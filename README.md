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

### python 補完
1. jedi, flake8, blackなどインストール
1. nvim開く
1. normalモードで
```
:CocInstall coc-python
```

### c++ 補完
1. [ccls buildの方法](https://github.com/MaskRay/ccls/wiki/Build)に従って、以下のようにcclsをインストール
```
$ cd .local
$ git clone --depth=1 --recursive https://github.com/MaskRay/ccls
$ cd ccls
$ cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release -DCMAKE_-DCMAKE_INSTALL_PREFIX=$HOME/.local/
$ cmake --build Release --target install
```
2. nvim 開く
3. normalモードで
```
:CocInstall coc-ccls
```
4. 以下を実行(extensionのエラー回避)
```
$ cd ~/.config/coc/extensions/node_modules/coc-ccls
$ ln -s node_modules/ws/lib lib
```
5. 実行したい単位のルートに移動してnvimを開いてnormalモードで以下を実行
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
$ make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/.local/neovim"
$ make install
```

`.bashrc`に以下を追記
```sh
export PATH="$HOME/.local/neovim/bin:$PATH"
```
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
