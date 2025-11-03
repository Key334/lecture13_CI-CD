# AWS自動構築手順（CloudFormation + CircleCI）

## 1. ネットワーク作成
```bash
aws cloudformation create-stack \
  --stack-name lecture13-network \
  --template-body file://cloudformation/network.yml \
  --capabilities CAPABILITY_NAMED_IAM
2. セキュリティグループ作成
bash
コードをコピーする
aws cloudformation create-stack \
  --stack-name lecture13-security \
  --template-body file://cloudformation/security.yml \
  --parameters ParameterKey=VPCID,ParameterValue=$(aws cloudformation list-exports --query "Exports[?Name=='VPCID'].Value" --output text)
3. EC2・RDS・S3・ALB構築
bash
コードをコピーする
aws cloudformation create-stack \
  --stack-name lecture13-infra \
  --template-body file://cloudformation/ec2_rds_s3_alb.yml \
  --parameters file://cloudformation/parameters.json \
  --capabilities CAPABILITY_NAMED_IAM
4. CircleCI設定
GitHubリポジトリ: Key334/lecture13_CI-CD

CircleCIの「Project Settings > Environment Variables」で以下を登録

AWS_ACCESS_KEY_ID

AWS_SECRET_ACCESS_KEY

AWS_DEFAULT_REGION = ap-northeast-1

5. Ansibleデプロイ（CircleCIから自動実行）
EC2へSSH接続 → Railsセットアップ → Puma + Nginx起動

Serverspecでテスト実行

S3バケットへ画像アップロード確認


