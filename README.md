# デプロイ手順

1. AWS上に以下を用意
   - EC2 (Amazon Linux 2)
   - RDS (MySQL)
   - S3 (画像保存)
   - VPC + ALB

2. CircleCI設定
   - SSHキー登録（EC2に接続できる鍵）
   - 環境変数設定：
     - AWS_ACCESS_KEY_ID
     - AWS_SECRET_ACCESS_KEY
     - RAILS_MASTER_KEY
     - RDS_HOST / RDS_USERNAME / RDS_PASSWORD

3. GitHub mainブランチへpushで自動デプロイ
