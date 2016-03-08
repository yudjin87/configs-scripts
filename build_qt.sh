#!/bin/bash

QT_VERSION=5.1.0

# get basic dependencies
sudo apt-get build-dep qt5-default
# addressSanitizer="-sanitize address" # Optional - GCC 4.8 and newer and reasonably recent clang
# threadSanitizer="-sanitize thread" # Optional - GCC 4.8 and newer and reasonably recent clang
# platform="-platform linux-clang" # Optional - if you want to use clang instead of GCC
# Then just append those to ./configure <...> ${addressSanitizer} ${threadSanitizer} ${platform} if needed
 
# debug
mkdir -p ~/devel/qt/qt$QT_VERSION-debug
tar -zxvf ~/Downloads/qt-everywhere-opensource-src-$QT_VERSION.tar.gz -C ~/devel/qt/qt$QT_VERSION-debug
cd ~/devel/qt/qt$QT_VERSION-debug
mv qt-everywhere-opensource-src-$QT_VERSION/* ./
rm -r qt-everywhere-opensource-src-$QT_VERSION/
./configure -prefix ~/devel/qt/qt-debug-$QT_VERSION -debug -opensource -nomake examples -nomake tests -confirm-license -opengl desktop
make -j3
echo 2 | sudo -S make install

# release
mkdir -p ~/devel/qt/qt$QT_VERSION-release
tar -zxvf ~/Downloads/qt-everywhere-opensource-src-$QT_VERSION.tar.gz -C ~/devel/qt/qt$QT_VERSION-release
cd ~/devel/qt/qt$QT_VERSION-release
mv qt-everywhere-opensource-src-$QT_VERSION/* ./
rm -r qt-everywhere-opensource-src-$QT_VERSION/

./configure -prefix ~/devel/qt/qt-release-$QT_VERSION -release -opensource -nomake examples -nomake tests -confirm-license -opengl desktop
make -j3
echo 2 | sudo -S make install
