######################################################################
# Automatically generated by qmake (3.1) Tue Apr 6 17:10:46 2021
######################################################################

TEMPLATE = app
TARGET = cefclient

ROOT = ../..
include($$ROOT/include/common.pri)
include($$ROOT/include/cef.pri)

LIBS += d3d11.lib glu32.lib imm32.lib opengl32.lib

CONFIG -= qt
CONFIG += warn_off

RC_FILE += resources/win/cefclient.rc

# You can make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# Please consult the documentation of the deprecated API in order to know
# how to port your code away from it.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# Input
HEADERS += browser/binding_test.h \
           browser/browser_window.h \
           browser/browser_window_osr_win.h \
           browser/browser_window_std_win.h \
           browser/bytes_write_handler.h \
           browser/client_browser.h \
           browser/client_handler.h \
           browser/client_handler_osr.h \
           browser/client_handler_std.h \
           browser/client_types.h \
           browser/dialog_test.h \
           browser/drm_test.h \
           browser/image_cache.h \
           browser/main_context.h \
           browser/main_context_impl.h \
           browser/main_message_loop_multithreaded_win.h \
           browser/media_router_test.h \
           browser/osr_accessibility_helper.h \
           browser/osr_accessibility_node.h \
           browser/osr_d3d11_win.h \
           browser/osr_dragdrop_events.h \
           browser/osr_dragdrop_win.h \
           browser/osr_ime_handler_win.h \
           browser/osr_render_handler_win.h \
           browser/osr_render_handler_win_d3d11.h \
           browser/osr_render_handler_win_gl.h \
           browser/osr_renderer.h \
           browser/osr_renderer_settings.h \
           browser/osr_window_win.h \
           browser/preferences_test.h \
           browser/resource.h \
           browser/response_filter_test.h \
           browser/root_window.h \
           browser/root_window_manager.h \
           browser/root_window_views.h \
           browser/root_window_win.h \
           browser/scheme_test.h \
           browser/server_test.h \
           browser/temp_window.h \
           browser/temp_window_win.h \
           browser/test_runner.h \
           browser/urlrequest_test.h \
           browser/views_menu_bar.h \
           browser/views_style.h \
           browser/views_window.h \
           browser/window_test.h \
           browser/window_test_runner.h \
           browser/window_test_runner_views.h \
           browser/window_test_runner_win.h \
		   browser/client_app_browser.h \
		   browser/extension_util.h \
		   browser/file_util.h \
		   browser/geometry_util.h \
		   browser/main_message_loop.h \
		   browser/main_message_loop_external_pump.h \
		   browser/main_message_loop_std.h \
		   browser/resource_util.h \
		   browser/util_win.h \
           common/scheme_test_common.h \
		   common/client_app.h \
		   common/client_app_other.h \
		   common/client_switches.h \
           renderer/client_renderer.h \
           renderer/performance_test.h \
           renderer/performance_test_setup.h \
		   renderer/client_app_renderer.h
SOURCES += cefclient_win.cc \
           browser/binding_test.cc \
           browser/browser_window.cc \
           browser/browser_window_osr_win.cc \
           browser/browser_window_std_win.cc \
           browser/bytes_write_handler.cc \
           browser/client_app_delegates_browser.cc \
           browser/client_browser.cc \
           browser/client_handler.cc \
           browser/client_handler_osr.cc \
           browser/client_handler_std.cc \
           browser/dialog_test.cc \
           browser/drm_test.cc \
           browser/image_cache.cc \
           browser/main_context.cc \
           browser/main_context_impl.cc \
           browser/main_context_impl_win.cc \
           browser/main_message_loop_multithreaded_win.cc \
           browser/media_router_test.cc \
           browser/osr_accessibility_helper.cc \
           browser/osr_accessibility_node.cc \
           browser/osr_accessibility_node_win.cc \
           browser/osr_d3d11_win.cc \
           browser/osr_dragdrop_win.cc \
           browser/osr_ime_handler_win.cc \
           browser/osr_render_handler_win.cc \
           browser/osr_render_handler_win_d3d11.cc \
           browser/osr_render_handler_win_gl.cc \
           browser/osr_renderer.cc \
           browser/osr_window_win.cc \
           browser/preferences_test.cc \
           browser/resource_util_win_idmap.cc \
           browser/response_filter_test.cc \
           browser/root_window.cc \
           browser/root_window_create.cc \
           browser/root_window_manager.cc \
           browser/root_window_views.cc \
           browser/root_window_win.cc \
           browser/scheme_test.cc \
           browser/server_test.cc \
           browser/temp_window_win.cc \
           browser/test_runner.cc \
           browser/urlrequest_test.cc \
           browser/views_menu_bar.cc \
           browser/views_style.cc \
           browser/views_window.cc \
           browser/window_test.cc \
           browser/window_test_runner.cc \
           browser/window_test_runner_views.cc \
           browser/window_test_runner_win.cc \
		   browser/client_app_browser.cc \
		   browser/extension_util.cc \
		   browser/file_util.cc \
		   browser/geometry_util.cc \
		   browser/main_message_loop.cc \
		   browser/main_message_loop_external_pump.cc \
		   browser/main_message_loop_external_pump_win.cc \
		   browser/main_message_loop_std.cc \
		   browser/resource_util_win.cc \
		   browser/util_win.cc \
           common/client_app_delegates_common.cc \
           common/scheme_test_common.cc \
		   common/client_app.cc \
		   common/client_app_other.cc \
		   common/client_switches.cc \
           renderer/client_app_delegates_renderer.cc \
           renderer/client_renderer.cc \
           renderer/performance_test.cc \
           renderer/performance_test_tests.cc \
		   renderer/client_app_renderer.cc