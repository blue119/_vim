#!/usr/bin/env bash

fs+=(.vim)
fs+=(.vimrc)

date=`date +"%s"`

# for dein.vim
mkdir -p .vim/bundle/repos/github.com/Shougo
rm -rf /home/blue119/.cache/vim/

# move same filename to end up with _data.bak for backup old file.
git submodule init
git submodule update
for f in ${fs[*]}
do
	if [[ ! -L ${HOME}/${f} ]]; then
		if [[ -f ${HOME}/${f} ]] || [[ -d ${HOME}/${f} ]]; then
			echo "backup ${HOME}/${f} => ${HOME}/${f}_${date}_bak"
			mv ${HOME}/${f} ${HOME}/${f}_${date}_bak;
		fi
	else
		echo "delete symbolic link ${HOME}/${f}"
		rm ${HOME}/${f}
	fi
		echo "link ${PWD}/${f} => ${HOME}/${f}"
		ln -s ${PWD}/${f} ${HOME}/${f}
done

# add vimrc link for neovim
ln -s $HOME/.vim $HOME/.config/nvim
ln -s $HOME/.vimrc $HOME/.config/nvim/init.vim

vim +NeoBundleInstall +qall
#vim +PluginInstall +qall
#cd $HOME/.vim/bundle/YouCompleteMe && ./install.sh --clang-completer
#cd $HOME/.vim/bundle/vimproc.vim && make

