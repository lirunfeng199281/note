#!/bin/bash

gitPath=("queen-center-basicdata")

function checkOut(){
	# 粘贴板获取分支 如果分支不存在就输入
	clipBranch=$(cat /dev/clipboard)

	rightBranch=true
	for(( i=0;i<${#gitPath[@]};i++)) do
		cd ${gitPath[i]}
		target=".*"$clipBranch"$"
		have=`git branch -r -a | grep  "$clipBranch"  | wc -l`
		if [ $have -eq 0 ];then
			rightBranch=false
		fi
		cd ..
	done;
	if [ $rightBranch = "true" ];then
		echo "粘贴板上获取需要的切换分支："$clipBranch
	else
		echo "输入分支"
		read clipBranch
	fi
	# git status 检查是否存在未提交
	errorArray=()
	next="true"
	for(( i=0;i<${#gitPath[@]};i++)) do
		cd ${gitPath[i]}
		clean=`git status | grep "nothing to commit, working tree clean" | wc -l`
		if [ $clean -eq 0 ];then
			#失败
			next="false"
			errorArray=("${errorArray[*]}" ${gitPath[i]})
		fi
		cd ..
	done;
	if [ $next != "true" ];then
		echo "存在未提交的目录" ${errorArray[@]}
		return
	fi
	# git checkout切换目录
	for(( i=0;i<${#gitPath[@]};i++)) do
		cd ${gitPath[i]}
		git checkout -B $clipBranch
		git pull --progress -v --no-rebase "origin" $clipBranch
		cd ..
	done;

	
}


echo "操作类型 1(default)->checkOut 2->pull"
read operate

if [ -n "$operate" ];then
	if [ $operate = "1" ];then
		checkOut
	elif [ $operate = "2" ];then
		echo "123123123"
	fi
else
	checkOut
fi


