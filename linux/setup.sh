apt-get update
apt-get -y upgrade
apt-get -y install make pkg-config git git-man gcc g++ libssl-dev uuid-dev htop curl

cwd=`pwd`
ln -s $cwd/etc/sysctl.conf /etc/sysctl.d/60-network-limits.conf
cp $cwd/etc/security/limits.d/nofile.conf /etc/security/limits.d/nofile.conf
cp $cwd/etc/default/locale /etc/default/locale

mkdir -p /etc/skel/.ssh
touch /etc/skel/.ssh/authorized_keys

echo "EDITOR=vi" >> /etc/bash.bashrc
