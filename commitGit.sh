#!/bin/bash
echo "准备add"
git add .
echo "准备commit"
git commit -m $1
echo "准备pull"
git pull
echo "准备push"
git push origin master
echo "提交成功"
