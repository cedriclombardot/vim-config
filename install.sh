#/bin/sh

CURRENT=`pwd`

# Git
# git submodule update --init
# git submodule foreach git pull origin master

# Remove old installations
if [ -d ~/.vim ] ; then
    rm -f ~/.vim
    rm -f ~/.vimrc
    rm -f ~/.vim/doc/syntastic.txt
    rm -f ~/.vim/plugin/syntastic.vim
    rm -rf ~/.vim/syntax_checkers
fi

# Vim
ln -s $CURRENT/.vim ~/.vim
ln -s $CURRENT/.vimrc ~/.vimrc

# Syntastic
cp -R $CURRENT/syntastic/doc/* ~/.vim/doc
cp -R $CURRENT/syntastic/plugin/* ~/.vim/plugin
cp -R $CURRENT/syntastic/syntax_checkers ~/.vim/syntax_checkers

#NerdTree
cp -R $CURRENT/nerdtree/doc/* ~/.vim/doc
cp -R $CURRENT/nerdtree/plugin/* ~/.vim/plugin
cp -R $CURRENT/nerdtree/nerdtree_plugin ~/.vim/nerdtree_plugin

# Command-T
cd ~/.vim/.vim/ruby/command-t
ruby extconf.rb
make clean && make
cd $CURRENT

# Here we go :)
echo "Installed !"
