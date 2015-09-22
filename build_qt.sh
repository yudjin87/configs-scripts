#!/bin/bash

QT_VERSION=5.1.0

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
