# kibana-plugin-build
kibana-plugin-build は kibana の UI を変更することができるプラグインです。
本リポジトリには、必要なマニフェストファイル等が入っています。

## 動作環境
- Elasticsearch: >=8

## インストール
### kibana
kibana を clone します。
```
make clone-submodule
```

#### kibanaの事前セットアップ
```
make setup-kibana
```

### プラグイン
custom-kibana-theme を clone します。
```
make clone-plugin-into-kibana-plugin
```

## ビルド
### プラグイン
プラグインをビルドします。
```
make plugin-build
```
