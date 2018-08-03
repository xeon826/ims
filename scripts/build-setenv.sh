#!/bin/sh
LDFLAGS="-L/home/dan/lampstack-7.1.20-0/common/lib $LDFLAGS"
export LDFLAGS
CFLAGS="-I/home/dan/lampstack-7.1.20-0/common/include/ImageMagick -I/home/dan/lampstack-7.1.20-0/common/include $CFLAGS"
export CFLAGS
CXXFLAGS="-I/home/dan/lampstack-7.1.20-0/common/include $CXXFLAGS"
export CXXFLAGS
		    
PKG_CONFIG_PATH="/home/dan/lampstack-7.1.20-0/common/lib/pkgconfig"
export PKG_CONFIG_PATH
