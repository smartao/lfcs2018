#!/bin/bash

### Varivais ###
DIR=/tmp

### Essential Commands ###
# task 1
# Gerando IP randomico
unset IP; for i in `seq 4`; do IP=$IP.$(od -An -N1 -i /dev/random); done ; echo $IP |  cut -d. -f2-5 | sed 's/[[:blank:]]//g' > /$DIR/ipssh
unset IP; for i in `seq 4`; do IP=$IP.$(od -An -N1 -i /dev/random); done ; echo $IP |  cut -d. -f2-5 | sed 's/[[:blank:]]//g' >> /$DIR/ipssh

# task 2
mkdir $DIR/xpto2 2> /dev/null
touch $DIR/xpto.jpg
touch $DIR/xpto.png
touch $DIR/zfff.xtx
touch $DIR/zfff.XTX

# task 4
touch $DIR/axxx.txt

# task 5
echo "#!/bin/bash
echo 'saida normal'
ocorreu um erro" > /tmp/scriptstd.sh
chmod 755 /tmp/scriptstd.sh

# task 6

# task 7

# task 8

# task 9

# task 10

### Operation of Running Systems ###
