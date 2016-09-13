# camo-on-aws

## Docker環境の構築
https://www.docker.com/products/docker-toolbox

## Docker Machine起動

```
$ docker-machine create --driver virtualbox default
$ eval $(docker-machine env default)
```

### 環境変数を自分のものに変更

```
$ cp -rp docker-compose.yml.sample docker-compose.yml
```

## Dockerのimageをbuild

```
$ docker-compose build
```

### 各自のAWS環境で変更する箇所
以下を参考に各自お好みで

terraform/env/dev/terraform.tfvars.sample

### Terraform実行

```
$ docker-compose run terraform plan  # 実行前に変更点確認
$ docker-compose run terraform apply # 反映
```

