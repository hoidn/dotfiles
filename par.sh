wget http://www.nicemice.net/par/Par152.tar.gz
tar xzf Par152.tar.gz 
rm Par152.tar.gz 
cd Par152/
make -f protoMakefile 
cp par ~/bin
