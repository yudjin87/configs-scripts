#!/bin/bash

QT_VERSION=5.1.0

# debug
mkdir -p ~/devel/qt/qt$QT_VERSION-debug
tar -zxvf ~/Downloads/qt-everywhere-opensource-src-$QT_VERSION.tar.gz -C ~/devel/qt/qt$QT_VERSION-debug
cd ~/devel/qt/qt$QT_VERSION-debug
mv qt-everywhere-opensource-src-$QT_VERSION/* ./
rm -r qt-everywhere-opensource-src-$QT_VERSION/

echo yes | ./configure -debug -force-debug-info -opensource -nomake examples -nomake tests -prefix /opt/Qt/Qt-$QT_VERSION-debug
make -j3
echo 2 | sudo -S make install

# release
mkdir -p ~/devel/qt/qt$QT_VERSION-release
tar -zxvf ~/Downloads/qt-everywhere-opensource-src-$QT_VERSION.tar.gz -C ~/devel/qt/qt$QT_VERSION-release
cd ~/devel/qt/qt$QT_VERSION-release
mv qt-everywhere-opensource-src-$QT_VERSION/* ./
rm -r qt-everywhere-opensource-src-$QT_VERSION/

echo yes | ./configure -release -opensource -nomake examples -nomake tests -prefix /opt/Qt/Qt-$QT_VERSION-release
make -j3
echo 2 | sudo -S make install
