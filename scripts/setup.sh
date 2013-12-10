#!/bin/sh
wget http://dl.google.com/android/android-sdk_r22.3-linux.tgz
tar -zxf android-sdk_r22.3-linux.tgz
export ANDROID_HOME=$PWD/android-sdk-linux
export PATH=${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
echo y | android update sdk --filter 1,2 --no-ui --force
echo y | android update sdk --all --no-ui --force --filter $(android list sdk --all | grep -i 'Android 4.0.3' | grep -Po '\d+' | head -n 1)
echo y | android update sdk --all --no-ui --force --filter $(android list sdk --all | grep -i 'Build-tools, revision 17' | grep -Po '\d+' | head -n 1)
