# .vim

这是本人的vim配置，不同环境下配置可能不同

1、安装依赖
```bash
brew install build-essential cmake python-dev python3-dev vim git llvm clang libclang-10-dev libboost-all-dev
```
如果主机是ubuntu
```bash
sudo apt-get install build-essential cmake python-dev python3-dev vim git llvm clang libclang-10-dev libboost-all-dev
```

2、安装ctags、cscope
```bash
brew install ctags cscope
```
如果主机是ubuntu
```bash
sudo apt-get install ctags cscope
```

3、在用户根目录下创建.vim目录，clone仓库代码到该目录
```bash
git clone https://github.com/vooxle/.vim
```

4、安装YouCompleteMe
```bash
cd bundle/YouCompleteMe
python3 install.py --clang-completer
```

5、将.vimrc文件拷贝到用户主目录
```bash
cd ~/.vim/
cp -r .vimrc ~/
```
