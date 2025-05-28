# dbtxSnowflake

このプロジェクトは、Snowflakeでメダリオンアーキテクチャを実装するdbtプロジェクトです。

## アーキテクチャ

3層のデータアーキテクチャを実装しています：

1. ブロンズレイヤー（raw_orders）
   - 生データの取り込み
   - データの変換や検証を行わない

2. シルバーレイヤー（cleaned_orders）
   - データのクレンジング
   - 基本的なバリデーション
   - 無効なデータの除外

3. ゴールドレイヤー（daily_order_stats）
   - ビジネス分析用の集計データ
   - 日次の注文統計
   - KPIの計算

## ブランチ戦略

本プロジェクトは以下のブランチ戦略を採用しています：

- `master`: 本番環境用ブランチ
- `stg`: ステージング環境用ブランチ（デフォルトブランチ）
- `feature/*`: 機能開発用ブランチ

### 開発フロー

1. 新機能開発時は `stg` からフィーチャーブランチを作成
```bash
git checkout stg
git checkout -b feature/new-feature
```

2. 開発完了後、`stg` にプルリクエストを作成

3. レビュー後、`stg` にマージ

4. `stg` での動作確認後、`master` にプルリクエストを作成

5. 最終レビュー後、`master` にマージ

## セットアップ

1. プロファイルの設定
```yaml
dbtxsnowflake:
  target: dev
  outputs:
    dev:
      type: snowflake
      account: your-account
      user: your-username
      password: your-password
      role: your-role
      database: your-database
      warehouse: your-warehouse
      schema: your-schema
```

2. モデルの実行
```bash
dbt run
```

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
