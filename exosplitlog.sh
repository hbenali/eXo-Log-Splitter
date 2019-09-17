#!/usr/bin/env bash
# @ Created by Houssem B. Ali
# Email : hbenali@exoplayform.com
# eXo Support LAB -- 2019

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ FN Defs ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function isInstalled() {
 [ ! -z "$(command -v $1)" ]
}

function gui_init() {
  echo "==========================================================================="
  echo "   eXo LOG Splitter by Houssem B. Ali, Email:<hbenali@exoplatform.com>     "
  echo "     ------------------> https://exoplatform.com <------------------       "
  echo "     -----------------------------> 2019 <--------------------------       "
  echo "==========================================================================="
}

function parseInput() {
  SHORT=HPpscvuao
  LONG=host,port,userprefix,count,verbose,userpassword,auth,offset
  if [[ $1 == "-h" ]] || [[ "$1" == "--help" ]]; then show_help && return; fi
  PARSED=$(getopt --options $SHORT --longoptions $LONG --name "$0" -- "$@")
  if [[ $? -ne 0 ]]; then
    exoprint_err "Could not parse arguments"
    return
  fi
  while true; do
    case "$1" in
    -H | --host)
      host="$2"
      shift 2
      ;;
    "")
      break
      ;;
    *)
      exoprint_err "Programming error"
      return
      ;;
    esac
  done
}

function exoprint_err() {
  echo -e "$(tput setaf 1)Error:$(tput init) $1"
}

function exoprint_suc() {
  echo -e "$(tput setaf 2)Success:$(tput init) $1"
}

function exoprint_warn() {
  echo -e "$(tput setaf 3)Warning:$(tput init) $1"
}

function exoprint_op() {
  echo -e "$(tput setaf 6)Operation:$(tput init) $1"
}
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Main Script ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
gui_init
