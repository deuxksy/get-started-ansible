#! /usr/bin/env bash

#ssh key 생성
sshpass -p vagrant ssh -T -O StrictHostKeyChecking=no vagrant@ansible-node01
sshpass -p vagrant ssh -T -O StrictHostKeyChecking=no vagrant@ansible-node02