#!/bin/bash

cmd=$1
shift

init() {

  if [ ! -e "$HOME/.pedacoin/pedacoin.conf" ]; then
      mkdir -p $HOME/.pedacoin/
      /daemon/src/pedacoin 2>&1 | grep "^rpc" > $HOME/.pedacoin/pedacoin.conf
  fi
}

case $cmd in
   shell)
      sh -c "$*"
      exit $?
      ;;
   login)
      bash -l
      exit $?
      ;;
   init)
      init
      exit 0
      ;;
   pedacoind)
      /daemon/src/pedacoind "$@"
      exit $?
      ;;
   log)
      tail -f $HOME/.pedacoin/debug.log
      ;;
   getconfig)
      cat $HOME/.pedacoin/pedacoin.conf
      ;;
   *)
      echo "Unknown cmd $cmd"
      exit 1
esac
