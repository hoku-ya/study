# Git/GitHub

## 用語一覧
---
### 3つの異なる環境
- ワークツリー(ワーキングディレクトリ、ワークスペース)：一人のユーザーがローカル環境で実際に作業を行う時に使う作業環境。
- インデックス/ステージ：Gitではコミットの際にリポジトリに引き渡すファイルの一覧のこと。
- リポジトリ：変更履歴（ファイル）を保存する場所。リモートリポジトリとローカルリポジトリの２種類ある。

> ワークツリーからインデックスへ、インデックスからリポジトリへファイルやディレクトリを移動することをそれぞれ`ステージング`、`コミット`という。

### リポジトリ

- リモートリポジトリ：複数人で共有するためのリポジトリ。専用のサーバに配置されている。
- ローカルリポジトリ：一人のユーザーが利用するためのリポジトリ。利用するユーザーのローカル環境内のプロジェクトのルートディレクトリに`.git`という名前で配置されている。

> リポジトリを２種類に分けることで、普段の作業はローカルリポジトリを使ってすべて手元のマシン上でおこなうことができる。  
自分のローカルリポジトリで作業した内容はリモートリポジトリにアップロードして公開する(プッシュ)。また、リモートリポジトリを通して他の人の作業内容を取得することもできる(プル・フェッチ)。

### ブランチ

- ブランチ：１つのファイルやディレクトリを複数のバージョンに分けて開発ができるようにする仕組み。
- リモートブランチ：リモートリポジトリのブランチ。
- ローカルブランチ：ローカルリポジトリのブランチ。
- デフォルトブランチ：GitHubで最初にリポジトリを作成したときに作成されるブランチ。通常GitHubでは`main`という名前が設定される。
- アップストリームブランチ：作業中のブランチと関連付けられているリモートリポジトリのブランチのこと。`git branch -vv`で確認。
- リモート追跡ブランチ：リモートリポジトリの状態をPC上のリポジトリで保持しておくために利用される。「`origin/main`」、「`origin/HEAD`」など。これらのブランチはPC上のコミット操作などでは移動せず、リモートリポジトリと同期をおこなった場合にのみ更新される。

## コマンド一覧
---
### `status`
- `git status: `リポジトリの変更状態を確認する。  
４つの状態が存在する。  
    - `Untracked`: 追跡されていない。最初の状態をスナップショットに含めた時点から変更が追跡されるようになる。`add`してからもう一度`status`を確認するとUntrackedだったファイルがTrackedとなる。
    - `Unmodidied`: 変更されていない。（追跡されている→ワークツリー）
    - `Modified`: 変更されている。（追跡されている→ワークツリー）。追跡されているファイルに対して新しい変更が加わったとき。この状態の次は`add`によるステージ。
    - `Staged`: ステージされている。（追跡されている→ワークツリー）。この状態の次は`commit`によるコミット。

### `add`, `commit`
ステージング命令が`add`、コミット命令が`commit`。
- `git add ファイルorディレクトリ名`: 変更をステージする。  
`git status`で確認すると、*Changes to be committed*となっている。ステージしたファイルはスナップショットに含めることができる。
- `git commit -m "コミットメッセージ"`: 変更履歴を記録する操作。  
`git status`で確認すると、*nothing to commit, working tree clean*と表示され、ワーキングディレクトリに変更がない旨のメッセージが表示される。

### `log`
記録したコミットを確認する。
- `git log`: コミットハッシュ、変更ユーザーとメールアドレス、記録した日付とコミットメッセージが表示される。
- `git log --oneline`: 一つのコミットを１行で表示。

### `diff`
- `git diff`：ワーキングディレクトリとステージングエリアの詳細な差分情報を表示。

### **ブランチに関するコマンド**
---

### `branch`, `checkout`
- `git branch`: 現在のブランチの状態の確認。「*」がついているブランチが現在参照しているブランチ。
- `git branch sub`: 新しいブランチ「sub」の作成。
- `git checkout sub`: subブランチに切り替え、subブランチで変更履歴を記録する。`HEAD`をブランチがさすコミットに移動する操作。
- `git log --graph --all`：２つ以上のブランチの変更履歴が分岐している様子が確認できる。
- `git checkout -b git origin/git`：新しい環境でローカルリポジトリ(git)を作成し、リモートリポジトリ(origin/git)を取得するとき。
- `git fetch`→`git branch -a`：リモートブランチを含めたすべてのブランチを確認する。

### `merge`
あるブランチに対して別のブランチで行われた変更を取り込むための機能。それぞれのブランチがさすコミットの位置によって、統合する方法が異なる。  
1. 取り込む側のブランチに新しいコミットが記録されていない場合(ファストフォワード)  
取り込まれるブランチは取り込む側のブランチに先行してコミットが行われていると考えられているので、取り込む側のブランチを取り込まれるブランチの位置に移動することでブランチの状態を一致させる。  
<例>masterブランチに先行してsubブランチだけが新しい変更をコミットしているとき  
    1. `git checkout master`：取り込む側にチェックアウト  
    2. `git merge sub`：*Fast-forward*のメッセージが表示されており、masterブランチの内容がsubブランチの内容と一致する。  


2. 取り込む側のブランチに新しいコミットが記録されている場合のマージ(マージコミット)  
変更履歴が分岐しているため、単純にブランチのポインタの位置を移動することができない。  
この場合、Gitでは、取り込む側のブランチのコミットと取り込まれるブランチのコミット、さらに2つのブランチで共通のコミットのうち最新のコミット、
この3つの状態を比較して、それらを統合した新たなコミットを作成し、取り込む側のブランチをそのコミットに移動させる。  
この時記録されるコミットは2つのコミットを親に持つ特別なコミットになる。  
<例>masterブランチとsubブランチのそれぞれに新しいファイルを作成してコミットしたとき  
    1. `git checkout master`：取り込む側のブランチに移動  
    2. `git merge --no-edit sub`：subブランチをmasterブランチにマージ。  
    `--no-edit`オプションはコミットメッセージを編集することなくコミットを行うもので、コミットメッセージには「Merge branch 'ブランチ名'」というコミットメッセージが自動的に追加される。     

> **マージするときに発生するコンフリクトの対処**  
マージコミットを行う際にそれぞれのコミットで同じファイルに対する別々の変更が加えていると、うまく差分を統合できない場合があり、`コンフリクト`と呼ぶ。  
`git merge sub`を実行したときに「CONFLICT(content): Merge conflict in test.txt」というメッセージが表示され、text.txtでコンフリクトが発生したことが確認できる。
また、`git log`コマンドで変更履歴を確認すると、マージ実行前から状態が変わっていないことを確認できる。  
マージ時にコンフリクトが発生するとマージコミットは作成されず、代わりにファイルに対して特別な変更が加えられる。  
> - `git status`で確認すると、*Unmerged paths*としてtext.txtが表示されている。  
> - 実際のファイルの内容を確認してみると、競合した部分に「<<<<<<<HEAD」や「>>>>>>>sub」といった行が書き込まれており、それらの行に挟まれる形で両方のブランチの変更も記述されていることが確認できる。    

>**コンフリクトの解消**  
コンフリクトが起きたすべての競合部分からユーザー自身の手で「<<<<<<<HEAD」や「>>>>>>>sub」といった行を削除し、正しい状態に編集した後、改めてコミットを行う必要がある。



### **リモートリポジトリに関するコマンド**
---

### `clone`
- `git clone {リポジトリのURL}`：それぞれのユーザーのPC上リモートリポジトリのコピーを作成する。  


### `push`
リモートリポジトリにPC上の変更を反映させる操作。  
`git remote -v`：PC上に登録されているリモートリポジトリの一覧を確認する。
`git push [オプション] origin sub`：originという名前のリモートリポジトリに、ローカル環境で作成したsubブランチをプッシュする。


### `pull`
リモートリポジトリから最新の状態をローカルリポジトリに反映するコマンド。  
- `git pull`：リモートリポジトリの状態をローカルリポジトリに反映するコマンド。  
引数なしでコマンドを実行した場合は、作業中のブランチと関連付けられているリモートリポジトリのブランチを対象に`pull`が実行される。  
この関連付けられているブランチのことを**アップストリームブランチ**という。  
`git branch -vv`：アップストリームブランチの確認。  
例えば、「`* main XXXXXXXX(コミット番号) [origin/main] Merge branch`」ならローカルのmainブランチのアップストリームブランチがorigin/mainであることがわかる。
- `git pull origin geature/hogehoge`：デフォルトのアップストリーム以外のブランチを指定するとき。  


### `fetch`
リモートブランチの内容がローカルブランチよりも進んでいる場合に、リモートブランチの内容をローカルリポジトリに取得するときに使う。`fetch`してきた内容は「`origin/ブランチ名`」の形で保存される。  
但し、取得した変更の反映は行われないため、フェッチでリモートリポジトリのmainブランチの変更を取得したとしても、PC上のmainブランチの状態は変化しない。代わりにリモート追跡ブランチ（用語一覧参照）の状態が更新される。  
<例> ローカルリポジトリにmainブランチとAブランチがあり、リモートブランチにローカルより内容の進んだmainブランチとBブランチがある場合。  
`git fetch`を行うと、ローカルリポジトリに現在のmainブランチとAブランチの他に、origin/mainブランチとorigin/Bブランチが作成される。  

#### fetchした変更をPC上に取り込む場合
- この変更をPC上のsubブランチにも反映させたい場合は、subブランチにorigin/subブランチをマージし、変更内容を取り込む必要がある。  
`git checkout sub`  
- `git fetch`で作成されるのはリモート追跡ブランチであるため、PC上のリポジトリにはsubブランチは作成されずPC上にsubブランチがない場合、このままではsub2ブランチでの作業ができない。そのため、PC上にブランチの作成とチェックアウトを同時に行い、リモート追跡ブランチを基にした新たなブランチを作成する必要がある。  
`git checkout -b sub origin/sub `


### `pull`と`fetch`の違い
`git fetch`は、`git pull`と同じくリモートリポジトリから最新の状態をローカルに反映するコマンドだが、反映先がアップストリームブランチとなる。  
また、`git merge`はアップストリームブランチからローカルブランチを更新するコマンドとなる。  
つまり、`git fetch`と`git merge`の動作を合わせて行うコマンドが`git pull`になる。  
`fetch`は取得するだけ、`pull`は反映させる。

<!-- ![](./pull1.png) -->

## .gitignore
---
`.gitignore`という隠しファイルを使うことで、一部のファイルやディレクトリだけをGitの管理から外すことができる。  
ログファイルや設定ファイル等、変更履歴に含めたくないファイルやディレクトリに利用する。
#### .gitignoreを使ったファイルの除外手順
1. プロジェクトのルートディレクトリに`.gitignore`ファイルを作成する。
2. 作成した.gitignoreファイルに対して「log」というファイル名を指定することで、「log」という名前のファイルを作成してもワーキングディレクトリの変更として検知されないようになる。
    ``` .gitignore
    log
    ```
3. 変更した.gitignoreファイルをコミットする。  
`git add .gitignore`  
`git commit -m ".gitignoreの追加"`
5. この状態で、「log」というファイルを作成しても変更として検知されなくなる。  

#### .gitignoreを使ったディレクトリの除外方法
1. ファイルの時と同様に、.gitignoreファイルにsettingを指定してコミットする。
    ```
    log
    setting
    ```
    `git add .gitignore`  
    `git commit -m ".gitignoreに「setting」を追記`
2. この状態でsettingディレクトリを作成し、中にファイルを追加してもlogファイルと同様に検知されない。

#### すでにバージョン管理されているファイルを削除する方法
`.gitnore`ではすでにバージョン管理されているファイルを途中から除外することはできない。  
そのため、すでにバージョン管理されているファイルを除外したい場合は、一度ファイルを削除してコミットを行う必要がある。  
手動で削除することも可能だが、Gitではファイルの削除~ステージまでを行うことができるショートカットのコマンドとして、`git rm`コマンドが用意されている。  
さらに、`--cached`オプションをつけることでワーキングディレクトリにファイルを残しつつバージョン管理から外すことができる。  
1. `git rm --cached test.txt`
2. `git commit -m "test.txtをバージョン管理から除外"`
3. 以降は.gitignoreでtest.txtが指定されているため、変更が検知されなくなる。


## GitHub Flow
---
チームで一つの開発を行うとき、それぞれのメンバーが共通の運用ルールなしで開発を進めてしまうと、コンフリクトの発生などリポジトリの内容に多くの不整合が発生してしまう。  
そのため、ブランチを作成する方法やその利用方法についてあらかじめ開発チームのメンバー間で取り決めを行うことで、混乱を最小限に抑える。  
このような運用ルールとして、GitHub FlowやGit Flowなどがある。

### GitHub Flowを使った開発の流れ
- mainブランチの内容はいつでもデプロイ可能にしておく
- 全てのブランチはmainから作成される。
- 開発するブランチごとに【トピックブランチ】を作成する。開発用のブランチには説明的な名前を付けて作成する。  
また、他のメンバーからも作業の様子がわかるようにローカルでコミットしたものを定期的にリモートにプッシュする。
- トピックブランチで行っている開発作業が終わって、ブランチをマージするときにプルリクエストを作成する。プルリクエストは他者のレビューを受けてOKならばmainにマージされる。  
マージが終わったらプルリクエストはクローズされる。


## Pull Request
---
- ソースコードの変更の反映（ブランチのマージ）をほかの開発者に依頼する機能。  
- 開発者それぞれがブランチを作成してそのブランチ上で開発を行ったとき、開発者それぞれがソースコードの部分的な変更を行ったものをおおもとのブランチに取り込んでしまう（マージしてしまう）と、プログラムが壊れてしまうなどの不都合が発生する可能性があるため必要。  
- 反映を依頼された開発者は、ソースコードの変更点を確認し、場合により修正点を指摘し、大元のソースコード（ブランチ）への反映を行っても問題ないことを確認してから、安全にソースコードの変更を反映することが可能。


## 操作一覧
---
> ## **変更の取り消し**  
>**1. `add`直後の取り消し(追加した内容は取り消さない)**  
`git restore --staged ファイル名`  
statusが*Changes to be commited*から*Changes not staged for commmit*に変化。→変更がワーキングディレクトリに戻っている。  
**2. `add`直後の取り消し(追加した内容も取り消し)**  
`git restore ファイル名`  
statusが*nothing to commit, working tree clean*に戻っている。変更・追加した内容も消えている。  
**3. コミットの巻き戻し(リセット)**  
`git reset オプション コミットハッシュ`  
**4. 変更を打ち消すコミットの追加(リバート)**  
`git revert オプション コミットハッシュ`  

> ## **リモートブランチを確認したい**
> <手順>  
> 1. `git fetch`
> 2. `git branch -a`

> ## **ブランチの削除（ローカル・リモート）**  
> 1. ローカルブランチの削除  
`git branch -D <delete local branch>`
> 2. リモートブランチの削除  
方法１）リモートブランチを削除する  
`git push --delete origin <remote branch name>`  
方法２）リモートブランチを削除する  
`git push origin :<remote branch name>`

> ## **リモートブランチの情報をローカルに作成**  
> <手順>
> 1. リモートブランチをローカルに反映させるため、`fetch`を行う。  
`git fetch`  
> 2. リモートを含め、すべてのブランチを確認。  
`git branch -a`  
> 3. リモートブランチの情報をローカルに作成。  
`git checkout -b ブランチ名 origin/ブランチ名`  


## エラー一覧
---
> ## **There is no tracking information for the current branch.**
>- 内容：`git pull`を実行したとき次のようなメッセージが出て処理が走らなかった。
*There is no tracking information for the current branch.*  
>- 原因：pullの基本形である`git pull <remote> <branch>`の`<remote>`と`<branch>`が省略された場合、「カレントブランチのアップストリームからカレントブランチに pull する」という挙動にフォールバックするため、カレントブランチのアップストリームがわからないとこのエラーが出る。  
実際にアップストリームブランチを確認する(`git branch -vv`)と、カレントブランチのアップストリームブランチはないことがわかるはず。
>- 対処：カレントブランチにアップストリームを指定すればよい。  
<例>`git branch --set-upstream-to=origin/master master`：master ブランチの upstream をリモート origin の master ブランチに設定



