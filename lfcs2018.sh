#!/bin/bash

##### Varivais #####
DIR="/tmp"
RNAMES="/usr/local/bin/random_users"

### Limpando diretorio /tmp ###
chattr -i /tmp/scriptstd.sh >/dev/null 2>&1
chattr -a  /tmp/passwd >/dev/null 2>&1
rm -rf $DIR/* >/dev/null 2>&1

### Criando usuarios ###
SENHA="123456"
for i in bill angie barbie junior; do useradd $i -m -s /bin/bash -p $(echo $SENHA | openssl passwd -1 -stdin) >/dev/null 2>&1;done
usermod -aG lxd bill 2>/dev/null

### Essential Commands ###
## Topico 1 ##
# Gerando IP randomico
unset IP; for i in `seq 4`; do IP=$IP.$(od -An -N1 -i /dev/random); done ; echo $IP |  cut -d. -f2-5 | sed 's/[[:blank:]]//g' > $DIR/ipssh
unset IP; for i in `seq 4`; do IP=$IP.$(od -An -N1 -i /dev/random); done ; echo $IP |  cut -d. -f2-5 | sed 's/[[:blank:]]//g' >> $DIR/ipssh

## Topicos 2 e 4 ##
# Criando arquivos e diretorios
DIR2="$DIR/files"
mkdir $DIR2 2>/dev/null
for i in {1..200}; do mktemp -dqp $DIR2 XXXXXXX >/dev/null; for i in {1..20};do mktemp -qp $DIR2 XXXXXXXXX >/dev/null;done; done

# Criando arquivos maiores que 10M e 1M
for i in {1..5}; do fallocate -l 11000000 $(mktemp -qp $DIR2 XXXXXXXX.avi); for i in {1..50}; do fallocate -l 1100000 $(mktemp -qp $DIR2 XXXXXXXXX.jpg); done; done

# Permissoes especiais para pesquisa
chmod u+s $DIR2/$(pwgen -s 1 1)*
chmod g+s $DIR2/$(pwgen -s 1 1)*
chmod u+s,g+s $DIR2/$(pwgen -s 1 1)*
chmod g+s,+t $DIR2/$(pwgen -s 1 1)*
chmod +t $DIR2/$(pwgen -s 1 1)*
chown barbie $DIR2/$(pwgen -s 1 1)*
chown barbie. $DIR2/$(pwgen -s 1 1)*
chown barbie:sudo $DIR2/$(pwgen -s 1 1)*

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

# Gerando arquivos para comparar
DIR1=$DIR/diff/simples
mkdir -p $DIR1 2>/dev/null

# Gerando dois arquivos simples para comprar diferencas
echo "Arquivo1 linha inicial
LINHA2
LINHA3

Arquivo1 linha5" > $DIR1/file1

echo "arquivo2 linha inicial
linha2
linha3
-
arquivo2 linha5" > $DIR1/file2

# Criando diretorios para comparar multiplos arquivos
DIR1=$DIR/diff/equals1
DIR2=$DIR/diff/equals2
mkdir $DIR1 2>/dev/null
mkdir $DIR2 2>/dev/null

echo "this file is equal" >> $DIR1/file1 
for i in {2..20}; do cp $DIR1/file1 $DIR1/file$i; done
cp $DIR1/* $DIR2 2>/dev/null
echo "THIS FILE IS NOT EQUAL, YOUR FOOL!" > $DIR2/file$(shuf -i1-20 -n1)

DIR1=$DIR/diff/multiplos
mkdir $DIR1 #2>/dev/null
echo "this file is equal" >> $DIR1/file1 
for i in {2..50}; do cp $DIR1/file1 $DIR1/file$i; done
echo "THIS FILE IS NOT EQUAL, YOUR FOOL!" > $DIR1/file$(shuf -i1-20 -n1)


## Topico 5 ##
# Gerando script para redirecionar saida
echo "#!/bin/bash
echo 'saida normal'
ocorreu um erro" > $DIR/scriptstd.sh
chmod 755 $DIR/scriptstd.sh
echo "Linha original do arquivo" >> /tmp/arquivo

## Topico 6 e 2 ##
# Copiando arquivos para pesquisa
cp /etc/passwd /tmp/
cp /etc/group /tmp/

# Gerando link para fazer pesquisa com o find
DIR3=$DIR/links
mkdir $DIR3 2>/dev/null
for i in {1..50}; do ln /tmp/passwd $DIR3/file$(shuf -i1-50000 -n1) 2>/dev/null;done
for i in {1..50}; do ln /tmp/group $DIR3/file$(shuf -i1-50000 -n1) 2>/dev/null;done
for i in {1..50}; do ln -s -f /tmp/passwd $DIR3/file$(shuf -i1-50000 -n1) 2>/dev/null;done

## Topico 07 ##
# Compactando arquivos 
DIR4=$DIR/compactfiles
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
DIR5=$DIR/permissions
mkdir $DIR5 2>/dev/null
for i in {1..9};do touch $DIR5/"$i-$(shuf -n 1 $RNAMES)"; done

# Adicionado usuarios com permissoes de ACL
setfacl -m u:bill:rwx /tmp/group
setfacl -m d:u:junior:rwx /tmp/permissions/

## Topico 11 ##
# Tarefas manuais

## Topico 12 ##

### Operation of Running Systems ###
## Topico 14 ##
# Crinado binario para o apparmor
cp /bin/ping /bin/ping-x >/dev/null 2>&1

### User and Group Management ###
## Topico 02 ##
# Criando usuarios e grupuos
addgroup billgates >/dev/null 2>/dev/null
addgroup linuxnew >/dev/null 2>/dev/null
usermod -aG linuxnew barbie >/dev/null 2>&1

### Services Configuration ###
## Topico 8 ##
DIR="/var/sites"
mkdir $DIR >>/dev/null 2>&1
echo " 
<!DOCTYPE html>
<html>
<body>
Pagina HTML importante!
</body>
</html>
" > $DIR/index.html

### Storage Management ###
# Criando pastas para ponto de montagem
mkdir /media/sda >>/dev/null 2>&1
mkdir /media/sdb >>/dev/null 2>&1
mkdir /media/sdc >>/dev/null 2>&1
mkdir /media/lvm >>/dev/null 2>&1
mkdir /media/hidden >>/dev/null 2>&1
mkdir /media/raid >>/dev/null 2>&1
mkdir /media/quota >>/dev/null 2>&1
