#!/bin/sh
echo $PATH | egrep "/home/dan/lampstack-7.1.20-0/common" > /dev/null
if [ $? -ne 0 ] ; then
PATH="/home/dan/lampstack-7.1.20-0/frameworks/laravel/app/Console:/home/dan/lampstack-7.1.20-0/frameworks/cakephp/bin:/home/dan/lampstack-7.1.20-0/frameworks/codeigniter/bin:/home/dan/lampstack-7.1.20-0/frameworks/symfony/bin:/home/dan/lampstack-7.1.20-0/frameworks/zendframework/app/Console:/home/dan/lampstack-7.1.20-0/git/bin:/home/dan/lampstack-7.1.20-0/varnish/bin:/home/dan/lampstack-7.1.20-0/sqlite/bin:/home/dan/lampstack-7.1.20-0/php/bin:/home/dan/lampstack-7.1.20-0/mysql/bin:/home/dan/lampstack-7.1.20-0/apache2/bin:/home/dan/lampstack-7.1.20-0/common/bin:$PATH"
export PATH
fi
echo $LD_LIBRARY_PATH | egrep "/home/dan/lampstack-7.1.20-0/common" > /dev/null
if [ $? -ne 0 ] ; then
LD_LIBRARY_PATH="/home/dan/lampstack-7.1.20-0/git/lib:/home/dan/lampstack-7.1.20-0/varnish/lib:/home/dan/lampstack-7.1.20-0/varnish/lib/varnish:/home/dan/lampstack-7.1.20-0/varnish/lib/varnish/vmods:/home/dan/lampstack-7.1.20-0/sqlite/lib:/home/dan/lampstack-7.1.20-0/mysql/lib:/home/dan/lampstack-7.1.20-0/apache2/lib:/home/dan/lampstack-7.1.20-0/common/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
export LD_LIBRARY_PATH
fi

TERMINFO=/home/dan/lampstack-7.1.20-0/common/share/terminfo
export TERMINFO
##### GIT ENV #####
GIT_EXEC_PATH=/home/dan/lampstack-7.1.20-0/git/libexec/git-core/
export GIT_EXEC_PATH
GIT_TEMPLATE_DIR=/home/dan/lampstack-7.1.20-0/git/share/git-core/templates
export GIT_TEMPLATE_DIR
GIT_SSL_CAINFO=/home/dan/lampstack-7.1.20-0/common/openssl/certs/curl-ca-bundle.crt
export GIT_SSL_CAINFO

##### VARNISH ENV #####
		
      ##### SQLITE ENV #####
			
##### GHOSTSCRIPT ENV #####
GS_LIB="/home/dan/lampstack-7.1.20-0/common/share/ghostscript/fonts"
export GS_LIB
##### IMAGEMAGICK ENV #####
MAGICK_HOME="/home/dan/lampstack-7.1.20-0/common"
export MAGICK_HOME

MAGICK_CONFIGURE_PATH="/home/dan/lampstack-7.1.20-0/common/lib/ImageMagick-6.9.8/config-Q16:/home/dan/lampstack-7.1.20-0/common/"
export MAGICK_CONFIGURE_PATH

MAGICK_CODER_MODULE_PATH="/home/dan/lampstack-7.1.20-0/common/lib/ImageMagick-6.9.8/modules-Q16/coders"
export MAGICK_CODER_MODULE_PATH

##### FONTCONFIG ENV #####
FONTCONFIG_PATH="/home/dan/lampstack-7.1.20-0/common/etc/fonts"
export FONTCONFIG_PATH
SASL_CONF_PATH=/home/dan/lampstack-7.1.20-0/common/etc
export SASL_CONF_PATH
SASL_PATH=/home/dan/lampstack-7.1.20-0/common/lib/sasl2 
export SASL_PATH
LDAPCONF=/home/dan/lampstack-7.1.20-0/common/etc/openldap/ldap.conf
export LDAPCONF
##### PHP ENV #####
PHP_PATH=/home/dan/lampstack-7.1.20-0/php/bin/php
COMPOSER_HOME=/home/dan/lampstack-7.1.20-0/php/composer
export PHP_PATH
export COMPOSER_HOME
##### MYSQL ENV #####

##### APACHE ENV #####

##### FREETDS ENV #####
FREETDSCONF=/home/dan/lampstack-7.1.20-0/common/etc/freetds.conf
export FREETDSCONF
FREETDSLOCALES=/home/dan/lampstack-7.1.20-0/common/etc/locales.conf
export FREETDSLOCALES
##### CURL ENV #####
CURL_CA_BUNDLE=/home/dan/lampstack-7.1.20-0/common/openssl/certs/curl-ca-bundle.crt
export CURL_CA_BUNDLE
##### SSL ENV #####
SSL_CERT_FILE=/home/dan/lampstack-7.1.20-0/common/openssl/certs/curl-ca-bundle.crt
export SSL_CERT_FILE
OPENSSL_CONF=/home/dan/lampstack-7.1.20-0/common/openssl/openssl.cnf
export OPENSSL_CONF
OPENSSL_ENGINES=/home/dan/lampstack-7.1.20-0/common/lib/engines
export OPENSSL_ENGINES


. /home/dan/lampstack-7.1.20-0/scripts/build-setenv.sh
