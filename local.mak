SHELL := /bin/bash
CC := i686-w64-mingw32-gcc
GMSGFMT := msgfmt
MAKENSIS := makensis
WINDRES := i686-w64-mingw32-windres
STRIP := i686-w64-mingw32-strip
INTLTOOL_MERGE := intltool-merge

INCLUDE_PATHS := -I$(PIDGIN_TREE_TOP)/../win32-dev/w32api/include
LIB_PATHS := -L$(PIDGIN_TREE_TOP)/../win32-dev/w32api/lib
