
# Need the following deps in fedora
# perl-ExtUtils-ParseXS.noarch

PIDGIN_VERSION=2.10.11

download () {
	bn=`basename "$1"`
	if [ ! -f "$bn" ]; then
		wget -O $bn "$1"
	fi
}

# Download
mkdir dl
cd dl
download "http://downloads.sourceforge.net/project/pidgin/Pidgin/$PIDGIN_VERSION/pidgin-$PIDGIN_VERSION.tar.gz"
download "http://ftp.gnome.org/pub/gnome/binaries/win32/gtk+/2.14/gtk+-bundle_2.14.7-20090119_win32.zip"
download "http://ftp.gnome.org/pub/gnome/binaries/win32/dependencies/gettext-tools-0.17.zip"
download "http://ftp.gnome.org/pub/gnome/binaries/win32/dependencies/gettext-runtime-0.17-1.zip"
download "https://developer.pidgin.im/static/win32/libxml2-dev_2.9.0-1_win32.zip"
download "https://developer.pidgin.im/static/win32/gtkspell-2.0.16.tar.bz2"
download "https://developer.pidgin.im/static/win32/enchant_1.6.0_win32.zip"
download "https://developer.pidgin.im/static/win32/nss-3.17.1-nspr-4.10.7.tar.gz"
download "https://developer.pidgin.im/static/win32/silc-toolkit-1.1.10.tar.gz"
download "https://developer.pidgin.im/static/win32/meanwhile-1.0.2_daa3-win32.zip"
download "https://developer.pidgin.im/static/win32/cyrus-sasl-2.1.25.tar.gz"
download "http://ftp.acc.umu.se/pub/GNOME/binaries/win32/intltool/0.40/intltool_0.40.4-1_win32.zip"
download "https://developer.pidgin.im/static/win32/pidgin-inst-deps-20130214.tar.gz"
download "http://developer.pidgin.im/static/win32/perl_5-10-0.tar.gz"
download "http://developer.pidgin.im/static/win32/tcl-8.4.5.tar.gz"

cd ..
# Remove previous stuff
rm -rf win32-dev
mkdir win32-dev

unzip -d win32-dev/gtk_2_0-2.14 dl/gtk+-bundle_2.14.7-20090119_win32.zip
unzip -d win32-dev/gettext-0.17 dl/gettext-tools-0.17.zip
unzip -d win32-dev/gettext-0.17 dl/gettext-runtime-0.17-1.zip
unzip -d win32-dev/libxml2-2.9.0 dl/libxml2-dev_2.9.0-1_win32.zip
tar xf dl/gtkspell-2.0.16.tar.bz2 -C win32-dev
unzip -d win32-dev/ dl/enchant_1.6.0_win32.zip
tar xf dl/nss-3.17.1-nspr-4.10.7.tar.gz -C win32-dev
tar xf dl/silc-toolkit-1.1.10.tar.gz -C win32-dev
unzip -d win32-dev/ dl/meanwhile-1.0.2_daa3-win32.zip
tar xf dl/cyrus-sasl-2.1.25.tar.gz -C win32-dev
unzip -d win32-dev/intltool_0.40.4-1_win32 dl/intltool_0.40.4-1_win32.zip
tar xf dl/pidgin-inst-deps-20130214.tar.gz -C win32-dev
tar xf dl/perl_5-10-0.tar.gz -C win32-dev
tar xf dl/tcl-8.4.5.tar.gz -C win32-dev

# Some tweaks
# Missing Bonour SDK file (only a .h)
cp -r ext/Bonjour_SDK win32-dev
# For some reason tries to link against .lib and fails, use .dll instead
find win32-dev/nss-3.17.1-nspr-4.10.7 | grep "\.lib" | xargs rm

# Pidgin
rm -rf pidgin-$PIDGIN_VERSION
tar xf dl/pidgin-$PIDGIN_VERSION.tar.gz
ln -s pidgin-$PIDGIN_VERSION pidgin
cd pidgin-$PIDGIN_VERSION
cp ../local.mak .
make -f Makefile.mingw 




