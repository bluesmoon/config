apt-get install make pkg-config git git-man gcc g++ libssl-dev uuid-dev htop curl
cwd=`pwd`
ln -s $cwd/etc/sysctl.conf /etc/sysctl.d/60-network-limits.conf
cp $cwd/etc/security/limits.d/nofile.conf /etc/security/limits.d/nofile.conf

