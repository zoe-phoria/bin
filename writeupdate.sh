#!/bin/bash
# update write and pdf2write.sh

printf "\ncheck http://styluslabs.com/download before proceeding\n"
read -p "proceed? (y/N) " -n 1 -r
printf "\n\n"
if [[ $REPLY =~ ^[Yy]$ ]]
then
  # download write.tar.gz from styluslabs.com
  wget http://www.styluslabs.com/download/write-tgz -O $HOME/builds/write.tar.gz
  # extract write.tar.gz
  tar -xvzf $HOME/builds/write.tar.gz -C $HOME/builds/
  # delete write.tar.gz
  rm $HOME/builds/write.tar.gz
  bat $HOME/builds/Write/setup.sh
  read -p $'\n'"install? (y/N) "
  printf "\n\n"
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    # run write setup
    /bin/bash $HOME/builds/Write/setup.sh
  fi
  echo
  printf "\ncheck https://raw.githubusercontent.com/styluslabs/templates/master/pdf2write.sh before proceeding\n"
  read -p "proceed? (y/N) " -n 1 -r
  printf "\n\n"
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    # downlad pfd2write.sh
    wget https://raw.githubusercontent.com/styluslabs/templates/master/pdf2write.sh -O $HOME/bin/pdf2write.sh
    # make pdf2write.sh executable
    chmod +x $HOME/bin/pdf2write.sh
    bat $HOME/bin/pdf2write.sh
  fi
fi
