#!/bin/bash

# 2つの自然数を入力
echo "最大公約数：2" > /tmp/$$-ans
./gcd.sh 2 4 > /tmp/$$-result
diff /tmp/$$-ans /tmp/$$-result || echo "エラー：テスト 1" >> /tmp/$$-error.log

# 1つの自然数しか入力しない
echo "2つの自然数を入力してください" > /tmp/$$-ans
./gcd.sh 2 2>/tmp/$$-result
diff /tmp/$$-ans /tmp/$$-result || echo "エラー：テスト 2" >> /tmp/$$-error.log

# 文字を入力する
echo "2つの自然数を入力してください" > /tmp/$$-ans
./gcd.sh aaa aaaa 2>/tmp/$$-result
diff /tmp/$$-ans /tmp/$$-result || echo "エラー：テスト 3" >> /tmp/$$-error.log

# 2つの自然数を入力(素数)
echo "最大公約数：1" > /tmp/$$-ans
./gcd.sh 3 11 > /tmp/$$-result
diff /tmp/$$-ans /tmp/$$-result || echo "エラー：テスト 4" >> /tmp/$$-error.log

if [ -f /tmp/$$-error.log ]; then
    cat /tmp/$$-error.log 1>&2
    rm /tmp/$$-ans /tmp/$$-result /tmp/$$-error.log
    exit 1
else
    rm /tmp/$$-ans /tmp/$$-result
    echo "全てのテストが成功しました。"
fi

