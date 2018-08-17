#!/bin/bash

### Varivais ###
DIR1="/tmp"
DIR2="$DIR1/files"

### Essential Commands ###
## Topico 1 ##
# Gerando IP randomico
unset IP; for i in `seq 4`; do IP=$IP.$(od -An -N1 -i /dev/random); done ; echo $IP |  cut -d. -f2-5 | sed 's/[[:blank:]]//g' > $DIR1/ipssh
unset IP; for i in `seq 4`; do IP=$IP.$(od -An -N1 -i /dev/random); done ; echo $IP |  cut -d. -f2-5 | sed 's/[[:blank:]]//g' >> $DIR1/ipssh

## Topicos 2 e 4 ##
# Criando arquivos e diretorios
mkdir $DIR2 2>/dev/null
for i in {1..200}; do mktemp -dqp $DIR2 XXXXXXXX >/dev/null; for i in {1..20};do mktemp -qp $DIR2 XXXXXXXX > /dev/null ;done; done
# Criando arquivos maiores que 10M e 100M
for i in {1..5}; do fallocate -l 110000000 $(mktemp -qp $DIR2); for i in {1..50}; do fallocate -l 11000000 $(mktemp -qp $DIR2); done; done

## Topico 5 ##
echo "#!/bin/bash
echo 'saida normal'
ocorreu um erro" > $DIR1/scriptstd.sh
chmod 755 $DIR1/scriptstd.sh

## Topico ##

# task 7

# task 8

# task 9

# task 10

### Operation of Running Systems ###
