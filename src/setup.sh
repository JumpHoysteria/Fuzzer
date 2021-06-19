DIR="/root/sudo-1.8.31p2"

if [ -d "$DIR" ]; then
  # Take action if $DIR exists. #
  echo "Folder exists"
  yes | rm -R $DIR
else
  echo "Does not exist. Nothing removed."
fi

DIR="/root/code/sudo-1.8.31p2"

if [ -d "$DIR" ]; then
  # Take action if $DIR exists. #
  echo "Folder exists"
  yes | rm -R $DIR
else
  echo "Does not exist. Nothing removed."
fi

cd /root/code

echo "Extracting Folder"
tar -xf sudo-1.8.31p2.tar

#START

## NORMAL COMPILATION!

# echo "Copy Stuff"
# cp -R sudo-1.8.31p2 /root/.
# echo "Compiling Stuff"
# cd /root/sudo-1.8.31p2 && ./configure && make && make install 


# AFL Instrumentation Compilation!

echo "Copy Stuff"
cp /root/code/episode02/argv-fuzz-inl.h /root/code/sudo-1.8.31p2/src/. 
cp /root/code/episode02/progname.c /root/code/sudo-1.8.31p2/lib/util/.
cp /root/code/episode02/sudo.c /root/code/sudo-1.8.31p2/src/.
echo "Compiling Stuff"
cp -R sudo-1.8.31p2 /root/.
cd /root/sudo-1.8.31p2 && CC=/root/AFL/afl-clang-fast ./configure --disable-shared && make && make install

# END 

mkdir /tmp/in && mkdir /tmp/out && echo -en "sudo\x00-l\x00" > /tmp/in/1.testcase

/root/sudo-1.8.31p2/src/sudo --version