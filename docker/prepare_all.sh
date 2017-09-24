set -e
apt-get update
apt-get install --force-yes -y emacs vim nano openssh-server lxde vnc4server build-essential zlib1g-dev libgsl0-dev -y unzip tmux screen firefox-esr net-tools xfce4-terminal libopenmpi-dev openmpi-bin
apt-get remove -y --force-yes lxterminal
apt-get clean

conda update --all
conda config --add channels r
conda config --add channels bioconda
conda install -y bwa samtools picard vcftools plink2 stacks r r-vegan r-devtools bioconductor-qvalue

mkdir /var/run/sshd
ssh-keygen -A
sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
echo "root:congen17" | chpasswd
echo PasswordAuthentication yes >> /etc/ssh/sshd_config


echo congen17 > pass
echo congen17 >> pass
vncpasswd < pass
rm pass
chmod a+x /root/.vnc/xstartup

git clone https://github.com/kanaka/noVNC.git
#mkdir /noVNC/utils
cd /noVNC/utils
git clone https://github.com/kanaka/websockify
cd /

chmod a+x prepare_negui.sh
conda create -n python2 python=2
./prepare_negui.sh
git clone https://github.com/popgengui/negui.git
cd /negui
git checkout origin/develop
git checkout -b dev
cd /


ln -s /bin/tar /bin/gtar
echo "source('https://bioconductor.org/biocLite.R')" > R.inst
echo "biocLite('LEA')" >> R.inst
echo "install.packages('RepeatABEL', repos='http://cran.us.r-project.org')" >> R.inst
echo "devtools::install_github('ngthomas/microhaplot', build_vignettes = TRUE)" >> R.inst
R --no-save < R.inst

git clone https://github.com/arunsethuraman/ima2p.git
cd /ima2p
chmod a+x configure
./configure
make install
cd /

wget http://popgen.net/ms.tar.gz
tar zxf ms.tar.gz
cd msdir
gcc -O3 -o ms ms.c streec.c rand1.c -lm
cp ms /usr/bin
cd /

wget https://bio.cst.temple.edu/~hey/downloads/IMfig.py


mkdir /data
chmod a+x run.sh
