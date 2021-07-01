﻿#include "stable.h"
#include "pluginframework/uuplugin.h"
#include "uuplugin_p.h"
#include "pluginframework/uuplugincontext.h"
#include "uupluginframeworkcontext.h"

uuPlugin::uuPlugin()
    :d_ptr(NULL)
{

}

uuPlugin::~uuPlugin()
{
    delete d_ptr;
}

void uuPlugin::init(uuPluginPrivate* dd)
{
    if (d_ptr) return; //throw ctkIllegalStateException("ctkPlugin already initialized");
    d_ptr = dd;
}

void uuPlugin::init(const QWeakPointer<uuPlugin> &self, uuPluginFrameworkContext *fw, const QString &loc)
{
    if (d_ptr) return; //throw ctkIllegalStateException("ctkPlugin already initialized");
    d_ptr = new uuPluginPrivate(self, fw, loc);
}

uuPlugin::State uuPlugin::getState() const
{
  Q_D(const uuPlugin);
  return d->state;
}

void uuPlugin::start()
{
    Q_D(uuPlugin);

    if (d->state == UNINSTALLED)
    {
        return; //throw ctkIllegalStateException("ctkPlugin is uninstalled");
    }

    if (d->state == ACTIVE)
    {
        return;
    }
    //Resolve plugin (if needed)
    d->getUpdatedState();

    d->finalizeActivation();
}

void uuPlugin::stop()
{
    Q_D(uuPlugin);

    if (d->state == UNINSTALLED)
    {
        return; //throw ctkIllegalStateException("ctkPlugin is uninstalled");
    }

    d->waitOnOperation(&d->operationLock, "Plugin::stop", false);

    switch (d->state)
    {
    case INSTALLED:
    case RESOLVED:
    case STOPPING:
    case UNINSTALLED:
        return;
    case ACTIVE:
    case STARTING:
        d->stop0();
        break;
    }
}

void uuPlugin::uninstall()
{
    Q_D(uuPlugin);

    switch (d->state)
    {
    case UNINSTALLED:
        return;
    case STARTING:
    case ACTIVE:
    case STOPPING:
    {
        d->waitOnOperation(&d->operationLock, "ctkPlugin::uninstall", true);
        if (d->state & (ACTIVE | STARTING))
        {
            d->stop0();
        }
        d->operation.fetchAndStoreOrdered(uuPluginPrivate::UNINSTALLING);
    }
    case RESOLVED:
    case INSTALLED:
    {
        d->fwCtx->plugins->remove(d->location);
        if (d->operation.fetchAndAddOrdered(0) != uuPluginPrivate::UNINSTALLING)
        {
            d->waitOnOperation(&d->operationLock, "Plugin::uninstall", true);
            d->operation.fetchAndStoreOrdered(uuPluginPrivate::UNINSTALLING);
        }

        // d->fwCtx->listeners.emitPluginChanged(ctkPluginEvent(ctkPluginEvent::UNRESOLVED, d->q_func()));
        d->pluginActivator = 0;
        d->state = UNINSTALLED;
        d->operation.fetchAndStoreOrdered(uuPluginPrivate::IDLE);
        d->operationLock.wakeAll();
        break;
    }
    }
    // d->fwCtx->listeners.emitPluginChanged(ctkPluginEvent(ctkPluginEvent::UNINSTALLED, d->q_ptr));
}

uuPluginContext* uuPlugin::getPluginContext() const
{
    Q_D(const uuPlugin);
    return d->pluginContext.data();
}

QString uuPlugin::getLocation() const
{
  Q_D(const uuPlugin);
  return d->location;
}
