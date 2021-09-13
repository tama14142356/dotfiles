# 構成
dein-plugin
 - coc-plugin

# 初期設定手順
1. シンボリックリンク作成
1. dein install
1. yarn nodejs install
1. coc設定
1. python補完設定

# uninstall手順
1. deinのインストール先と、cocの拡張機能のインストール先を削除
   ```
   $ rm -rf ~/.config/coc
   $ rm -rf ~/.cache/dein/
   ```
   (多分、これでアンインストールできると思う。。試してみたことはない)

1. yarnのパッケージアンインストール  
   ```
   $ yarn global remove neovim
   ```
   参考：[npmとyarnのコマンド早見表](https://qiita.com/rubytomato@github/items/1696530bb9fd59aa28d8)

1. yarn nodejs, npmをアンインストールするかどうかは状況次第

## シンボリックリンク作成

```bash
$ bash linux/dotfileslinks.sh (linux)
$ bash linux/dotfileslinks_nvim.sh (nvim on linux)
$ bash linux/dotfileslinks_vim.sh (vim on linux)
$ windows/dotfileslinks.bat (windows 管理者権限)
```

`.bashrc`に以下を追記

```sh
# terminal setting for git
if [ -f "$HOME"/.gitterminal/mygit_prompt.sh ]; then
    source "$HOME"/.gitterminal/mygit_prompt.sh
fi
```

## シンボリックリンク削除

```bash
$ bash linux/removelinks.sh (linux) 
$ windows/removelinks.bat (windows)
```

`.bashrc`内の以下の文字列を削除

```sh
# terminal setting for git
if [ -f "$HOME"/.gitterminal/mygit_prompt.sh ]; then
    source "$HOME"/.gitterminal/mygit_prompt.sh
fi
```

## dein install
1. dein install 方法：  
[dein install](https://github.com/Shougo/dein.vim)

1. nvim(or vim) 開く
1. normalモードで
```
:call dein#install()
```

(update時)
```
:call dein#update()
```

## yarn nodejs install
1. npmがすでにある場合、yarnをインストール  
   1-a. npmがローカルビルドの場合または管理者権限が使える環境の場合  
     ```
     $ npm install -g yarn
     ```
   1-b. 管理者権限が使えず、globalにインストールできない場合  
     ```
     $ npm install --save yarn
     ```
     `.bashrc`に以下を追記  
     ```sh
     export PATH="$HOME/node_modules/.bin:$PATH"
     ```

2. ない場合、検索して、npmから入れてください  
参考URL(ubuntu):  
自分の環境の場合:  
- [yarn install](https://yanor.net/wiki/?Node.js/yarn/yarn%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB+-+Ubuntu)  
- [nodejs, npm install](https://qiita.com/seibe/items/36cef7df85fe2cefa3ea)

ソースコードからインストール(サーバとかの自分の環境ではない場合):  
- [nodejs, npm binary or source code download](https://nodejs.org/en/download/)
- [nodejs, npm install](https://github.com/nodejs/help/wiki/Installation)

## coc設定
1. nodejs用のnvimパッケージインストール(neovimのみ)
```
$ yarn global add neovim
```

### python 補完
1. jedi, flake8, blackなどインストール
1. nvim(or vim)開く
1. normalモードで

<s>`:CocInstall coc-python`</s>  
`:CocInstall coc-pyright`

[2021/09/08追記] [coc-python](https://github.com/neoclide/coc-python)はアーカイブ入りしているので、[coc-pyright](https://github.com/fannheyward/coc-pyright)へ変更  
参考：[coc-pythonがArchive入りしていることに気がついたのでcoc-jediに変えてみた](https://dev.classmethod.jp/articles/change-to-coc-jedi-from-coc-python/)

### c++ 補完
1. [ccls buildの方法](https://github.com/MaskRay/ccls/wiki/Build)に従って、以下のようにcclsをインストール
```
$ cd .local
$ git clone --depth=1 --recursive https://github.com/MaskRay/ccls
$ cd ccls
$ cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release -DCMAKE_-DCMAKE_INSTALL_PREFIX=$HOME/.local/
$ cmake --build Release --target install
```
2. nvim(or vim) 開く
3. normalモードで
```
:CocInstall coc-ccls
```
4. 以下を実行(extensionのエラー回避)
```
$ cd ~/.config/coc/extensions/node_modules/coc-ccls
$ ln -s node_modules/ws/lib lib
```
5. 実行したい単位のルートに移動してnvim(or vim)を開いてnormalモードで以下を実行
```
:call MakeCompilationDatabase()
```
## neovim ビルド（ない場合）
```
$ cd .local
$ git clone git@github.com:neovim/neovim.git
$ cd neovim
$ git checkout stable  # for stable version
$ rm -r build/  # if build/ doesn't exist, ignore
$ make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/.local/neovim" CMAKE_BUILD_TYPE=RelWithDebInfo
$ make install
```

`.bashrc`に以下を追記
```sh
export PATH="$HOME/.local/neovim/bin:$PATH"
```

参考：
- [neovim](https://github.com/neovim/neovim)
- [neovim build type](https://github.com/neovim/neovim/blob/master/README.md#install-from-source)

## vim ビルド（ない場合）
```
$ cd .local
$ git clone git@github.com:vim/vim.git
$ cd vim
$ git checkout v8.2.0  # for version 8.2
$ rm -r build/  # if build/ doesn't exist, ignore
$ ./configure --prefix=$HOME/.local/vim --with-features=huge --disable-selinux --enable-fontset --enable-multibyte --enable-gui=yes --enable-python3interp --enable-gpm --enable-acl --enable-xim --enable-rubyinterp --enable-cscope --with-x --enable-luainterp
$ make
$ make install
```

`.bashrc`に以下を追記
```sh
export PATH="$HOME/.local/vim/bin:$PATH"
```

参考: 
- [vim](https://github.com/vim/vim)
- [Vim の種類 (Vim family)](https://qiita.com/b4b4r07/items/f7a4a0461e1fc6f436a4)
- [vim 8.1 クリップボードにコピーできるバイナリをビルドする](https://ytyaru.hatenablog.com/entry/2020/05/22/000000)

### neovimでのclipboard tool(xclip) ビルド
[xclipのダウンロード](https://sourceforge.net/projects/xclip/)からダウンロード  
```
$ cd .local
$ ls
xclip-<version>.tar.gz
$ tar zxvf xclip-<version>.tar.gz
$ cd xclip-<version>
$ ./configure --prefix=$HOME/.local/xclip-<version>
$ make
$ make install
```

`.bashrc`に以下を追記
```sh
export PATH="$HOME/.local/xclip-<version>/bin:$PATH"
export DISPLAY=:0.0
```

### neovimでのperl ビルド
`:checkhealth`でperlのバージョンが古いと言われたときにビルドする方法  
1. perlビルド(参考文献：[perlのビルド/インストール方法](https://qiita.com/skaji/items/3dc443717250e56e0e0e))  
   1-1. [perl公式サイト](https://www.cpan.org/src/)から最新のperlのソースをダウンロード  
   1-2. 以下を実行してビルド(例として5.34.0の場合のビルド)  
   ```
   $ wget https://www.cpan.org/src/5.0/perl-5.34.0.tar.gz
   $ tar -xzf perl-5.34.0.tar.gz
   $ cd perl-5.34.0
   $ ./Configure -des -Dprefix=$HOME/.local/perl -Dscriptdir=$HOME/.local/perl/bin -des -Dman1dir=none -Dman3dir=none -DDEBUGGING=-g -Duseshrplib -Duseithreads
   $ make
   $ make test
   $ make install
   ```
   1-3. `.bashrc`に以下を追記  
   ```sh
   export PATH="$HOME/.local/perl/bin:$PATH"
   ```
2. cpanmのインストール    
   2-1. 以下を実行
   ```
   $ cpan App::cpanminus
   ```
   2-2. `.bashrc`に以下を追記
   ```sh
   export PERL_CPANM_OPT="--local-lib=$HOME/.local/lib/perl5"
   export PATH="$HOME/.local/lib/perl5/bin:$PATH"
   export PERL5LIB="$HOME/.local/lib/perl5/lib/perl5:$PERL5LIB"
   ```
3. `Neovim::Ext`モジュールのインストール  
以下を実行
```
$ cpanm -n Neovim::Ext
```
