#!/bin/bash

if [[ $# -gt 1 ]]; then

  while test $# -gt 1; do
    case "$1" in
      --cm)
        shift
        if test $# -gt 0; then
          EXEC_GIT_COMMIT="$1"
        fi
        shift
        ;;
      --vd)
        shift
        if test $# -gt 0; then
          EXEC_VENDOR="$1"
        fi
        shift
        ;;
      --fq)
        shift
        if test $# -gt 0; then
          EXEC_FREQ="$1"
        fi
        shift
        ;;
      --ul)
        shift
        if test $# -gt 0; then
          EXEC_URL="$1"
        fi
        shift
        ;;
      --da)
        shift
        if test $# -gt 0; then
          EXEC_DAT="$1"
        fi
        shift
        ;;
      --mp)
        shift
        if test $# -gt 0; then
          EXEC_MAP="$1"
        fi
        shift
        ;;
      *)
        printf "\nflag: %s", "$1"
        break
        ;;
    esac
  done  
  
  printf "\n--cm: %s,\n--vd: %s,\n --fq: %s,\n --ul: %s,\n --da: %s,\n --mp: %s\n\n" "$EXEC_GIT_COMMIT" "$EXEC_VENDOR" "$EXEC_FREQ" "$EXEC_URL" "$EXEC_DAT" "$EXEC_MAP"
  
  TIME=$(date)
  printf "\n\n local time: %s\n\n" "$TIME"
  
  wget -q --show-progress -O ~/.ec/scripts/custom.sh $EXEC_URL
  chmod +x ~/.ec/scripts/custom.sh

  #functional interface to be implemented
  # function name: int_a
  #
  # param1: a base64 string of a custom json object (custom-obj) from script api
  # param2: a base64 string of a custom json object during sac instantiation. format: {\"region1-region1-userpool1\":[\"service1\":\"service2\"],\"region1-region1-userpool2\":[\"service1\":\"service2\"]}
  # 
  # return: stdout. 
  # i.e. printf "%s" "{\"decision\":\"PERMIT\"}";return 0;
  # i.e. printf "%s" "{\"error\":\"error from aws token verification.\"}";return -1;
  int_a "$EXEC_DAT" "$EXEC_MAP"
  rm ~/.ec/scripts/custom.sh
  exit 0
fi
