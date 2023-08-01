#!/bin/bash

# 2つの自然数を入力
out1=$(./gcd.sh 2 4)
exout1="最大公約数：2"
if [ "$out1" != "$exout1" ]; then
    echo "失敗1：出力($out1)が期待される値($exout1)ではない。" >&2
    exit 1
else
    echo "成功1"
fi

# 1つの自然数しか入力しない
out2=$(./gcd.sh 3 2>&1)
exout2="2つの自然数を入力してください"
if [ "$out2" != "$exout2" ]; then
    echo "失敗2：出力($out2)が期待される値($exout2)ではない。" >&2
    exit 1
else
    echo "成功2"
fi

# 文字を入力する
out3=$(./gcd.sh aa aaa 2>&1)
exout3="2つの自然数を入力してください"
if [ "$out3" != "$exout3" ]; then
    echo "失敗3：出力($out3)が期待される値($exout3)ではない。" >&2
    exit 1
else
    echo "成功3"
fi

# 2つの自然数を入力(素数)
out4=$(./gcd.sh 3 11)
exout4="最大公約数：1"
if [ "$out4" != "$exout4" ]; then
    echo "失敗4：出力($out4)が期待される値($exout4)ではない。" >&2
    exit 1
else
    echo "成功4"
fi

