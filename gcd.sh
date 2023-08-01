#!/bin/bash

# 正しくない入力を行った際はエラー終了する(引数が2つでない、自然数以外の入力である)
if [ $# -ne 2 ] || ! [[ $1 =~ ^[0-9]+$ ]] || ! [[ $2 =~ ^[0-9]+$ ]]
then
    echo "2つの自然数を入力してください" >&2
    exit 1
fi

num1=$1
num2=$2 

# ユークリッドの互除法で最大公約数を計算
while [ "$num2" -ne 0 ]; do
    amari=$(expr "$num1" % "$num2")
    num1=$num2
    num2=$amari
done

# 最大公約数を表示
echo "最大公約数：$num1"
