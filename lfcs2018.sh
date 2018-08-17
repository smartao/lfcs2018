#!/bin/bash

### Varivais ###
DIR1="/tmp"
DIR2="$DIR1/files"

### Essential Commands ###
# task 1
# Gerando IP randomico
unset IP; for i in `seq 4`; do IP=$IP.$(od -An -N1 -i /dev/random); done ; echo $IP |  cut -d. -f2-5 | sed 's/[[:blank:]]//g' > $DIR1/ipssh
unset IP; for i in `seq 4`; do IP=$IP.$(od -An -N1 -i /dev/random); done ; echo $IP |  cut -d. -f2-5 | sed 's/[[:blank:]]//g' >> $DIR1/ipssh

# task 2
# Criando arquivos e diretorios
for i in {1..100}; do mktemp -dqp $DIR2 >/dev/null; for i in {1..20};do mktemp -qp $DIR2 > /dev/null ;done; done

# task 4
#touch $DIR/axxx.txt

# task 5
echo "#!/bin/bash
echo 'saida normal'
ocorreu um erro" > $DIR1/scriptstd.sh
chmod 755 $DIR1/scriptstd.sh

# task 6

# task 7

# task 8

# task 9

# task 10

### Operation of Running Systems ###
