#! /usr/bin/env bash

#ansible 설치
sudo apt update
sudo apt install ansible -y

#환경설정 초기 파일 구성
mkdir -p /home/vagrant/.vim/autoload /home/vagrant/.vim/bundle
touch /home/vagrant/.vimrc
touch /home/vagrant/.bashrc
