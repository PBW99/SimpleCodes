# NotWorking
# Instead of this use, brew install io


import subprocess
import os
import zipfile
import shutil
from typing import *

def run(command:str, **kwargs):
    commandArgs = [ x for x in command.split(' ')]
    subprocess.run(commandArgs, **kwargs)


def downloadIoLang(zipFilePath:str, ioBinaryUrl:str):
    run(f'curl -L -o {zipFilePath} {ioBinaryUrl}')

def unzip(zipFilePath:str, zipDestDirPath:str, zipDestDirName:str):
    zipFile = zipfile.ZipFile(zipFilePath)
    directoryName = zipFile.namelist()[0]
    zipFile.extractall(zipDestDirPath)

    destPath = f'{zipDestDirPath}/{zipDestDirName}'
    if True == os.path.exists(destPath):
        shutil.rmtree(destPath)
    shutil.move(f'{zipDestDirPath}/{directoryName}', destPath)


def buildIo(ioProjectPath:str):
    os.chdir(ioProjectPath)
    run('make')
    run('sudo make install')

if __name__ == '__main__':
    currentDirectory = os.getcwd()
    config = {
        'zipFilePath' : f'{currentDirectory}/ioBin.zip',
        'ioBinUrl' : 'https://github.com/IoLanguage/io/archive/refs/tags/2019.05.22-alpha.zip',
        'unzipFilePath': f'{currentDirectory}',
        'unzipFileName': 'ioBin'
    }

    downloadIoLang(config['zipFilePath'], config['ioBinUrl'])
    unzip(config['zipFilePath'], config['unzipFilePath'], config['unzipFileName'])
    buildIo(f'{config["unzipFilePath"]}/{config["unzipFileName"]}')
