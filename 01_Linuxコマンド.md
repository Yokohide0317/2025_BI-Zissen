# はじめに

### `Enter`でその行を実行。

- コマンドを入力後、`Enter`を押すと実行。
- つまり、改行ができない。見栄えのために改行したい場合は、`\`(バックスラッシュ)を入力する。(日本語環境では、`¥`を使用する。)

### 基本文型

- `MainCommand`\_`SubCommand`\_`--OptionFlag`\_`引数`<br>
（`_`は半角スペース。`SubCommand`や`--OptionFlag`などは、ツールによって無い場合や、複数ある場合もある。）

# よく使うコマンド/概念

### コマンド

| コマンド | 説明 | 例1 | 例2 |
| :---: | :---: | :---: | :---: |
| ls | ファイル/ディレクトリのリストを表示 | ls | ls ./data/ |
| cd | ディレクトリを移動 | cd ./data/ | cd ../ |
| pwd | 現在の場所を表示 | pwd | - |
| mkdir | ディレクトリを作成 | mkdir dir01 | mkdir dir01/dir02 |
| mv | ファイルを移動(rename) | mv file.txt ./data/ | mv fire.txt file.txt |
| cp | ファイルをコピー | cp file.txt ./data/ | cp file1.txt file2.txt |
| rm | ファイル/ディレクトリを削除 | rm ./file1.txt | rm -r ./data |
| nano | (テキストエディタ) | nano ./file3.txt | (使い方については検索してください) |
| cat | ファイルの中身を結合/表示 | cat ./file1.txt | cat ./file1.txt ./file2.txt > ./file3.txt |
| less | ファイルの中身を少しずつ表示 | less ./file1.txt | (`q`を押して終了) |
| wget | web上からファイルをダウンロード | wget http://..... | - |

### ディレクトリ階層の指定

Linuxでは、`/`(スラッシュ)を区切りにフォルダ階層ができています。

```text
mydir/
├── dir01/
│   ├── text1.txt
│   ├── dir02/
│   │   └── text2.txt
...
```

`mydir`にいる時を考えます。
| ファイル |　相対的に指定 |
| --- | --- |
| (現在いる場所) | `./` |
| dir01 | `./dir01` |
| text1.txt | `./dir01/text1.txt` |
| text2.txt | `./dir01/dir02/text2.txt` |

`dir02`に移動したい場合、

- `cd ./dir01/dir02/`
- `cd ./dir01`, `cd ./dir02`<br>
のいずれかで移動できます。(1回の実行で移動するか、2回に分けて移動するかの違い)

一つ上の階層を指定したい時は`../`。<br>
`dir02`にいる時、

| ファイル |　相対的に指定 |
| --- | --- |
| text2.txt | `./text2.txt` |
| text1.txt | `../text1.txt` |
| dir01 | `../../dir01` |


### ホームディレクトリについて

Linuxのファイルシステム上、`user01`さんに割り当てられるホームディレクトリは、`/home/user01`です。<br>
`/`はいわゆる`Cドライブ`の一番上で、PCの設定ファイルなどが含まれるので、基本的に`/home/<user名>`以下で作業します。<br><br>

`~`(チルダ)を使うと便利です。また、`cd`にて、引数を指定しなかった場合は自動的に`/home/<user名>`へ移動します。

`/home/user01/dir01/dir02/dir03`にて、`dir03`にいる場合、以下は同じ結果になります。

- `cd ../../../`
- `cd /home/user01/`
- `cd ~/`

# 注意点

### エラーについて

エラー表示を無視すると、思いがけない失敗に繋がります。<br>
例えば、料理のレシピにて、

```text
1. 醤油、みりん、オイスターソースを混ぜ、ソースを作ります。
2. 鍋でエビを炒めます。
3. ソースを鍋に入れます。
```

- `ERROR: 醤油がありません。`が発生し無視 →ソースが作られていないで3番で止まってしまいます。(早めに気づくのでOK)<br>
- `ERROR: エビがありません。`が発生し無視 →3番は実行できますが、結果がおかしくなります。(最悪のパターン)

どちらにせよエラーはつきものなので、慌てず、出力される表示をよく読んで対応する必要があります。<br>
※正常→(基本的に)出力なし<br>

### 補完機能

ディレクトリやファイル名が長いと、どうしてもスペルミスなどをしてしまうことが多くなります。→`No such file or directory`<br>

```text
mydir/
├── dir01/
│   ├── text1.txt
│   ├── tatituteto.txt
│   ├── dir02/
│   │   └── text2.txt
...
```

において、`dir01/text1.txt`を削除したい場合、<br>
`rm dir01/te` まで入力すると、`dir01/`の中に、`te`から始まるオブジェクトは`text1.txt`のみが存在しているので、<br>
`tabキー`を押すと、残りの`xt1.txt`を自動入力してくれます。<br><br>

もし、`rm dir01/t` まで入力した場合、`t`から始まるオブジェクトは`text1.txt`と`tatituteto.txt`の２つがあります。<br>
そのため、一度で補完を行うことはできません。ただし、この際に`tabキー`を2回連続で押すことで候補となるオブジェクトの一覧が表示されます。<br><br>

ここで注意したいのが、<br>
`ls`、`cd`、`cat`、`less`などの、「既にオブジェクトが存在しているもの」に対して指定する場合は補完が活用できます。一方で、<br>
`mkdir`、`cp`、`wget`など、「新規に作成する場合」や「このPCが把握していないもの」に関しては、補完は使えません。<br>
※ cpで、「既に存在するファイルの中身を上書きをしたい場合」や「既に存在するディレクトリ内へ移動する場合」などはその限りではありません。

# 演習問題

### 演習1

`cd`、`pwd`、`ls`、`mkdir`を使い、以下のファイル構造を作成してください。

```text
workspace/ (/home/coder/workspace/)
    ├── kokugo/
    │   ├── kanji/
    │   └── waka/
    │
    ├── suugaku/
    │   ├── bibun/
    │   └── sekibun/
    │
    └── rika/
       ├── seibutu/
       │   └── seikagaku/
       └── buturi/
```

### 演習2

`seikagaku/`へ移動し、`pwd`で`/home/coder/workspace/rika/seibutu/seikagaku`が表示されることを確認してください。

### 演習3

`seikagaku/`から、`waka/`へ一回で移動してください。(失敗した場合は`cd ~/workspace/rika/seibutu/seikagaku`で戻れます。)

### 演習4

`bibun/`と`sekibun/`を削除し、`bisekibun/`を作成してください。

### +α

`bisekibun/`の中に、`bibun.txt`および`sekibun.txt`を作成し、それぞれ`bibun`と`sekibun`と入力してください。<br>
ヒント： `nano`を使用。

