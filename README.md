## Reference pipeline to deploy terraform on AWS
 - Using gitlab pipeline
 - Using aws codepipiline

## Sample code deploy ./deploy
# helloworld_tf_deploy

## .pre-commit-config.yaml
# Hooks
- Using pre-commit-terraform hooks from gruntwork-io and from antonbabenko to test,validate and scan terraform code
- Also could use infracost on pre-commit-config

## Gitlab pipeline stages and hooks description

- Using default hashicorp/terraform image set to 15.1
(non intended for production, you need to deploy a custom golden docker image with the versions tools that your environment need)
# Sample : 
  terraform, pre-commit, git, yamlint, etc

- Using gitlab cache to improve terraform module/pluging load

# Stages
- lint (yaml, terraform)
- test (init included in test stage)
- plan
- apply
- destroy

- Introduce Infracost hook 
https://gitlab.com/infracost/infracost-gitlab-ci/
https://gitlab.com/guided-explorations/iac/infracost-for-terraform
