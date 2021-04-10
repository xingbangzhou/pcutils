import os
import sys
import subprocess
import shutil

def deepCopy(path, out):
    for files in os.listdir(path):
        name = os.path.join(path, files)
        back_name = os.path.join(out, files)
        if os.path.isfile(name):
            if not os.path.isfile(back_name):
                shutil.copy(name, back_name)
        else:
            if not os.path.isdir(back_name):
                os.makedirs(back_name)
            deepCopy(name, back_name)

def copyDepends():
    shadowBin = os.path.join('.', 'shadow', 'bin')
    if not os.path.isdir(shadowBin):
        os.makedirs(shadowBin)
    
    cefBin = os.path.join('.', 'depends', 'cef-85', 'bin')
    deepCopy(cefBin, shadowBin)

def generateSln():
    rootProPath = os.path.join('..', 'cpp', 'pcutils.pro')
    commandList = [
       'qmake',
        '-tp',
        'vc',
        '-r',
        rootProPath 
    ]
    
    slnDir = 'shadow'
    if os.path.exists(slnDir):
        shutil.rmtree(slnDir)
        
    os.makedirs(slnDir)
    
    result = subprocess.call(commandList, cwd=slnDir)

if __name__ == '__main__':
    generateSln()
    copyDepends()
