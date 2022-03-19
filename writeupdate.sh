#!/bin/bash
# update write and pdf2write.sh

echo
echo "check http://styluslabs.com/download before proceeding"
read -p "proceed? (y/N) " -n 1 -r
echo
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
  # download write.tar.gz from styluslabs.com
  wget http://www.styluslabs.com/download/write-tgz -O /home/zoe/aur/write.tar.gz
  # extract write.tar.gz
  tar -xvzf /home/zoe/aur/write.tar.gz -C /home/zoe/aur/
  # delete write.tar.gz
  rm /home/zoe/aur/write.tar.gz
  bat /home/zoe/aur/Write/setup.sh
  echo
  read -p "install? (y/N) "
  echo
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    # run write setup
    /bin/bash /home/zoe/aur/Write/setup.sh
  fi
  echo
  echo "check https://raw.githubusercontent.com/styluslabs/templates/master/pdf2write.sh -O /home/zoe/bin/pdf2write.sh before proceeding"
  read -p "proceed? (y/N) " -n 1 -r
  echo
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    # downlad pfd2write.sh
    wget https://raw.githubusercontent.com/styluslabs/templates/master/pdf2write.sh -O /home/zoe/bin/pdf2write.sh
    # make pdf2write.sh executable
    chmod +x /home/zoe/bin/pdf2write.sh
    bat /home/zoe/bin/pdf2write.sh
  fi
fi
