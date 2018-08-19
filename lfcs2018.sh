#!/bin/bash

### Varivais ###
DIR1="/tmp"
DIR2="$DIR1/files"

### Limpando diretorio /tmp ###
rm -rf $DIR1/*

### Essential Commands ###
## Topico 1 ##
# Gerando IP randomico
unset IP; for i in `seq 4`; do IP=$IP.$(od -An -N1 -i /dev/random); done ; echo $IP |  cut -d. -f2-5 | sed 's/[[:blank:]]//g' > $DIR1/ipssh
unset IP; for i in `seq 4`; do IP=$IP.$(od -An -N1 -i /dev/random); done ; echo $IP |  cut -d. -f2-5 | sed 's/[[:blank:]]//g' >> $DIR1/ipssh

## Topicos 2 e 4 ##
# Criando arquivos e diretorios
mkdir $DIR2 2>/dev/null
for i in {1..200}; do mktemp -dqp $DIR2 XXXXXXX >/dev/null; for i in {1..20};do mktemp -qp $DIR2 XXXXXXXXX >/dev/null;done; done

# Criando arquivos maiores que 10M e 1M
for i in {1..5}; do fallocate -l 11000000 $(mktemp -qp $DIR2 XXXXXXXX.avi); for i in {1..50}; do fallocate -l 1100000 $(mktemp -qp $DIR2 XXXXXXXXX.jpg); done; done

# Alterando data de alguns arquivos
DATA1=20180401
DATA2=20180701
touch -d $DATA1 $DIR2/$(pwgen -s 1 1)*
touch -d $DATA2 $DIR2/$(pwgen -s 1 1)*

## Topico 5 ##
# Gerando script para redirecionar saida
echo "#!/bin/bash
echo 'saida normal'
ocorreu um erro" > $DIR1/scriptstd.sh
chmod 755 $DIR1/scriptstd.sh

## Topico 6 ##
# Copiando arquivos para pesquisa
cp /etc/passwd /tmp/
cp /etc/group /tmp/

## Topico 07 ##
# Compactando arquivos 
tar -cf $DIR1/$(pwgen -s 10 1).tar $DIR2/$(pwgen -s 1 1)* 2>/dev/null 		# .tar
tar -czf $DIR1/$(pwgen -s 10 1).tar.gz $DIR2/$(pwgen -s 1 1)* 2>/dev/null 	# .tar.gz
tar -cjf $DIR1/$(pwgen -s 10 1).tar.bz2 $DIR2/$(pwgen -s 1 1)* 2>/dev/nul	# .tar.bz2
tar -cJf $DIR1/$(pwgen -s 10 1).tar.xz $DIR2/$(pwgen -s 1 1)* 2>/dev/null	# .tar.xz

## Topico 08 ##


## Topico 09 ##


## Topico 10 ##


### Operation of Running Systems ###

## Topico 01 ##


