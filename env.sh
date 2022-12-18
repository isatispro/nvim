#!/bin/bash

#########################################################################
# Copyright (C) 2022 All rights reserved.
#
# Author        : isatis
# Email         : 704739397@qq.com
# File Name     : install_packer.sh
# Created Time  : 日 12/18 22:58:31 2022
# Describe      : 
#
#########################################################################

function do_all_in_mac()
{
    # 安装git
    yes | brew install git

    # clone packer.nvim
    git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

}

if [ "$(uname)"=="Darwin" ]; then
    # Mac OS X 操作系统
    do_all_in_mac
elif [ "$(expr substr $(uname -s) 1 5)"=="Linux" ]; then   
    # GNU/Linux操作系统
    echo "un supported"
elif [ "$(expr substr $(uname -s) 1 10)"=="MINGW32_NT" ]; then    
    # Windows NT操作系统
    echo "un supported"
fi
