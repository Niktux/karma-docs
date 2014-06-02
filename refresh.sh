#! /bin/sh
rm -rf build/html && make html
ln -s ../../favicon.ico build/html/favicon.ico
