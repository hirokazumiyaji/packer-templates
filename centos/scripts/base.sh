sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers
yum update
yum -y install gcc make gcc-c++ kernel-devel-`uname -r` perl wget bzip2.x86_64 bzip2-devel.i386 bzip2-devel.x86_64 bzip2-libs.i386 bzip2-libs.x86_64 "@Development Tools" "@Japanese Support" sqlite-devel openssl-devel mercurial ncurses-devel lua-devel

# gcc 4.9.2
cd /usr/local/src
echo "[gcc4.9.2] download"
curl -O http://ftp.tsukuba.wide.ad.jp/software/gcc/releases/gcc-4.9.2/gcc-4.9.2.tar.gz
echo "[gcc4.9.2] unarchive"
tar zxvf gcc-4.9.2.tar.gz > /dev/null
cd gcc-4.9.2
echo "gcc4.9.2] contrib"
./contrib/download_prerequisites
yum -y install glibc-devel.i686 gcc-c++.x86_64
echo "[gcc4.9.2] configure"
mkdir build && cd build
../configure --disable-multilib > /dev/null
echo "[gcc4.9.2] make & make install"
make && make install

cp -p /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
echo 'LC_CTYPE="ja_JP.UTF-8"' >> /etc/sysconfig/i18n
echo 'LANG="ja_JP.UTF-8"' >> /etc/sysconfig/i18n
echo 'LC_CTYPE=ja_JP.UTF-8' >> /etc/sysconfig/i18n
echo 'LC_NUMERIC="ja_JP.UTF-8"' >> /etc/sysconfig/i18n
echo 'LC_TIME="ja_JP.UTF-8"' >> /etc/sysconfig/i18n
echo 'LC_COLLATE="ja_JP.UTF-8"' >> /etc/sysconfig/i18n
echo 'LC_MONETARY="ja_JP.UTF-8"' >> /etc/sysconfig/i18n
echo 'LC_MESSAGES="ja_JP.ut8"' >> /etc/sysconfig/i18n
echo 'LC_PAPER="ja_JP.UTF-8"' >> /etc/sysconfig/i18n
echo 'LC_NAME="ja_JP.UTF-8"' >> /etc/sysconfig/i18n
echo 'LC_ADDRESS="ja_JP.UTF-8"' >> /etc/sysconfig/i18n
echo 'LC_TELEPHONE="ja_JP.UTF-8"' >> /etc/sysconfig/i18n
echo 'LC_MEASUREMENT="ja_JP.UTF-8"' >> /etc/sysconfig/i18n
echo 'LC_IDENTIFICATION="ja_JP.UTF-8"' >> /etc/sysconfig/i18n

/etc/init.d/vboxadd setup
