#!/bin/bash

##### Varivais #####
DIR1="/tmp"
RNAMES="/usr/local/bin/random_users"

### Limpando diretorio /tmp ###
rm -rf $DIR1/*

### Criando usuarios ###
SENHA="123456"
for i in bill angie barbie junior; do useradd $i -m -s /bin/bash -p $(echo $SENHA | openssl passwd -1 -stdin) >/dev/null 2>&1;done
usermod -aG lxd bill 2>/dev/null

### Essential Commands ###
## Topico 1 ##
# Gerando IP randomico
unset IP; for i in `seq 4`; do IP=$IP.$(od -An -N1 -i /dev/random); done ; echo $IP |  cut -d. -f2-5 | sed 's/[[:blank:]]//g' > $DIR1/ipssh
unset IP; for i in `seq 4`; do IP=$IP.$(od -An -N1 -i /dev/random); done ; echo $IP |  cut -d. -f2-5 | sed 's/[[:blank:]]//g' >> $DIR1/ipssh

## Topicos 2 e 4 ##
# Criando arquivos e diretorios
DIR2="$DIR1/files"
mkdir $DIR2 2>/dev/null
for i in {1..200}; do mktemp -dqp $DIR2 XXXXXXX >/dev/null; for i in {1..20};do mktemp -qp $DIR2 XXXXXXXXX >/dev/null;done; done

# Criando arquivos maiores que 10M e 1M
for i in {1..5}; do fallocate -l 11000000 $(mktemp -qp $DIR2 XXXXXXXX.avi); for i in {1..50}; do fallocate -l 1100000 $(mktemp -qp $DIR2 XXXXXXXXX.jpg); done; done

# Permissoes especiais para pesquisa
chmod u+s $DIR2/$(pwgen -s 1 1)*
chmod g+s $DIR2/$(pwgen -s 1 1)*
chmod u+s,g+s $DIR2/$(pwgen -s 1 1)*
chmod +t $DIR2/$(pwgen -s 1 1)*
chmod +t $DIR2/$(pwgen -s 1 1)*
chown sergei. $DIR2/$(pwgen -s 1 1)*

# Diretorio para mover os arquivos
mkdir /tmp/new 2>/dev/null

# Alterando data de alguns arquivos
# Data de modificacao
DATA1=20180401
DATA2=20180701
touch -d $DATA1 $DIR2/$(pwgen -s 1 1)*
touch -d $DATA2 $DIR2/$(pwgen -s 1 1)*

# Permissoes
chmod 777  $DIR2/$(pwgen -s 1 1)*
chmod 755  $DIR2/$(pwgen -s 1 1)*

## Topico 5 ##
# Gerando script para redirecionar saida
echo "#!/bin/bash
echo 'saida normal'
ocorreu um erro" > $DIR1/scriptstd.sh
chmod 755 $DIR1/scriptstd.sh

## Topico 6 e 2 ##
# Copiando arquivos para pesquisa
cp /etc/passwd /tmp/
cp /etc/group /tmp/

# Gerando link para fazer pesquisa com o find
DIR3=$DIR1/links
mkdir $DIR3 2>/dev/null
for i in {1..5}; do ln /tmp/passwd $DIR3/file$(shuf -i1-500 -n1) 2>/dev/null;done
for i in {1..5}; do ln /tmp/group $DIR3/file$(shuf -i1-500 -n1) 2>/dev/null;done
for i in {1..5}; do ln -s -f /tmp/passwd $DIR3/file$(shuf -i1-500 -n1) 2>/dev/null;done

## Topico 07 ##
# Compactando arquivos 
DIR4=$DIR1/compactfiles
mkdir $DIR4 2>/dev/null
tar -cf $DIR4/"$(shuf -n 1 $RNAMES).tar" $DIR2/$(pwgen -s 1 1)* 2>/dev/null 		# .tar
tar -czf $DIR4/"$(shuf -n 1 $RNAMES).tar.gz" $DIR2/$(pwgen -s 1 1)* 2>/dev/null 	# .tar.gz
tar -cjf $DIR4/"$(shuf -n 1 $RNAMES).tar.bz2" $DIR2/$(pwgen -s 1 1)* 2>/dev/null	# .tar.bz2
tar -cJf $DIR4/"$(shuf -n 1 $RNAMES).tar.xz" $DIR2/$(pwgen -s 1 1)* 2>/dev/null	    # .tar.xz

## Topico 08 ##
# Tarefas manuais

## Topico 09 ##
# Tarefas manuais

## Topico 10 ##
DIR5=$DIR1/permissions
mkdir $DIR5 2>/dev/null
for i in {1..9};do touch $DIR5/"$i-$(shuf -n 1 $RNAMES)"; done

## Topico 11 ##
# Tarefas manuais

## Topico 12 ##

### Operation of Running Systems ###
## Topico 01 ##

### User and Group Management ###
## Topico 02 ##
addgroup billgates >/dev/null 2>/dev/null
addgroup linuxnew >/dev/null 2>/dev/null
usermod -aG linuxnew barbie >/dev/null 2>&1
