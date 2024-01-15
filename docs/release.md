# リリースフロー

1. `feature/xxx`を`develop`から切って`develop`にマージしていく
1. リリースタイミングで`npm run bump:release`を実行
1. `npm run versionup:dryrun`でtagとCHANGELOGが問題ないか確認する
1. 一旦`git add . && git reset --hard HEAD`で変更を戻す
1. `npm run versionup`でoriginにtagをpushする
1. tagのpushをトリガーにPRが自動生成される
1. PRが問題なければ`main`にマージする
1. `main`へのマージをトリガーにgithub packagesにpublishされる
1. `main`から`develop`に向けてPRを作成し、マージしたらリリース作業終了
