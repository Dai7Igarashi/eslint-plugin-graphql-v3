#!/bin/bash

function main() {
  # localのgitコマンドのパスを取得
  local -r git=$(type -tP git)

  if [ -n "$("$git" status --porcelain)" ]; then
    echo "commitされていない変更があります" >&2
    exit 1
  fi

  "$git" checkout develop
  "$git" fetch origin develop
  "$git" reset --hard origin develop
  "$git" checkout -b release
  # lerna versionでtagを打つために、事前にoriginにbranchが必要なためpushする
  "$git" push origin release
}

main
