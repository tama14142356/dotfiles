# 構成
dein-plugin
 - coc-plugin

# 初期設定手順
1. シンボリックリンク作成
1. dein install
1. yarn nodejs install
1. coc設定
1. python補完設定

## シンボリックリンク作成

```bash
$ sh dotfileslinks.sh
```

## dein install
1. dein install 方法：  
[dein install](https://github.com/Shougo/dein.vim)

1. nvim 開く
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

```
$ npm install --save yarn
```

2. ない場合、検索して、yarnから入れてください  
参考URL(ubuntu):  
自分の環境の場合:  
- [yarn install](https://yanor.net/wiki/?Node.js/yarn/yarn%E3%81%AE%E3%82%A4%E3%83%B3%E3%82%B9%E3%83%88%E3%83%BC%E3%83%AB+-+Ubuntu)  
- [nodejs, npm install](https://qiita.com/seibe/items/36cef7df85fe2cefa3ea)

ソースコードからインストール(サーバとかの自分の環境ではない場合):  
- [nodejs, npm binary or source code download](https://nodejs.org/en/download/)
- [nodejs, npm install](https://github.com/nodejs/help/wiki/Installation)

## coc設定
1. nodejs用のnvimパッケージインストール
```
$ yarn global add neovim
```

## python 補完
1. jedi, flake8, blackなどインストール
1. nvim開く
1. normalモードで
```
:CocInstall coc-python
```

## neovim ビルド（ない場合）
```
~/ $ cd .local
~/.local/ $ git clone git@github.com:neovim/neovim.git
~/.local $ cd neovim
~/.local/neovim $ git checkout stable  # for stable version
~/.local/neovim $ rm -r build/  # if build/ doesn't exist, ignore
~/.local/neovim $ make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/.local/neovim"
~/.local/neovim $ make install
```

`.bashrc`に以下を追記
```sh
export PATH="$HOME/.local/neovim/bin:$PATH"
```
### neovimでのclipboard tool(xclip) ビルド
[xclipのダウンロード](https://sourceforge.net/projects/xclip/)からダウンロード  
```
~/ $ cd .local
~/ $ ls
xclip-<version>.tar.gz
~/.local/ $ tar zxvf xclip-<version>.tar.gz
~/.local/ $ cd xclip-<version>
~/.local/xclip-<version> $ ./configure --prefix=$HOME/.local/xclip-<version>
~/.local/xclip-<version> $ make
~/.local/xclip-<version> $ make install
```

`.bashrc`に以下を追記
```sh
export PATH="$HOME/.local/xclip-<version>/bin:$PATH"
export DISPLAY=:0.0
```
