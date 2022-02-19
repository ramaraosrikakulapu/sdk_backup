#!/bin/bash
#
#  Copyright (c) 2019 General Electric Company. All rights reserved.
#
#  The copyright to the computer software herein is the property of
#  General Electric Company. The software may be used and/or copied only
#  with the written permission of General Electric Company or in accordance
#  with the terms and conditions stipulated in the agreement/contract
#  under which the software has been supplied.
#
#  author: apolo.yasuda@ge.com
#

source <(wget -O - https://raw.githubusercontent.com/EC-Release/sdk/disty/scripts/libs/common.sh) -ver

function setDb() {

  # get pkey
  {
    git clone https://${EC_GITHUB_TOKEN}@github.com/EC-Release/data-storage.git
  } &> /dev/null
  #cd pkeys
  #find ./pkeys -name "${1}.key"
  #cs_dir=$(find ./pkeys -name "${1}.key")
  if [[ -f "./data-storage/${1}" ]]; then
    printf "\n\n**** sharing existing db (%s).\n" "$1"
    cp "./data-storage/${1}" ./.ec/.db
    #exit -1
  fi
  #cat $cs_dir
  rm -Rf data-storage
}

function getCredJson() {

  # get pkey
  {
    git clone https://${EC_GITHUB_TOKEN}@github.com/EC-Release/data-storage.git
  } &> /dev/null
  #cd pkeys
  #find ./pkeys -name "${1}.key"
  #cs_dir=$(find ./pkeys -name "${1}.key")
  if [[ -f "./data-storage/${1}" ]]; then
    #printf "\n\n**** sharing existing db (%s).\n" "$1"
    #cp "./data-storage/${1}" ./.ec/.db
    #exit -1
    cat "./data-storage/${1}"
  fi
  #cat $cs_dir
  rm -Rf data-storage
}

function getPrivateKey() {

  # get pkey
  {
    git clone https://${EC_GITHUB_TOKEN}@github.com/EC-Release/pkeys.git
  } &> /dev/null
  #cd pkeys
  #find ./pkeys -name "${1}.key"
  cs_dir=$(find ./pkeys -name "${1}.key")
  if [[ ! -f "$cs_dir" ]]; then
    printf "\n\n**** private key is invalid. Exiting the workflow.\n"
    exit -1
  fi
  cat $cs_dir
  rm -Rf pkeys
}

function getCSRIDByCrtDir() {
  agent -vfy -pbk $1 -smp | jq -r '.exts.csrId'
}

function getPublicCrt() {
  {
    git clone https://${EC_GITHUB_TOKEN}@github.com/EC-Release/x509.git
  } &> /dev/null
  
  cr_dir=$(find ./x509 -name "$1.cer")
  if [[ ! -f "$cr_dir" ]]; then
    printf "\n\n**** public cert is invalid. Exiting the workflow.\n"
    exit -1
  fi
  cat $cr_dir
  rm -Rf ./x509
}
