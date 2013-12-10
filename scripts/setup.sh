#!/bin/bash
if [ `uname -m` = x86_64 ]; then
    if command -v apt-get >/dev/null; then
        sudo apt-get update -qq
        sudo apt-get install -qq libstdc++6:i386 lib32z1
    fi
fi
wget http://dl.google.com/android/android-sdk_r22.3-linux.tgz
tar -zxf android-sdk_r22.3-linux.tgz
export ANDROID_HOME=$PWD/android-sdk-linux
export PATH=${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${PATH}
echo y | android update sdk --filter 1,2 --no-ui --force > /dev/null
echo y | android update sdk --all --no-ui --force --filter $(android list sdk --all | grep -i 'Android 4.0.3' | grep -Po '\d+' | head -n 1) > /dev/null
echo y | android update sdk --all --no-ui --force --filter $(android list sdk --all | grep -i 'Build-tools, revision 17' | grep -Po '\d+' | head -n 1) > /dev/null
