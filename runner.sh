#!/bin/sh
# Yes I could have avoided this script just by using "local-exec" in TF
# Usually I script out the flow then port it.

OGDIR=${PWD}

tf_run(){
  cd tf
  terraform init
  terraform plan
  terraform apply
  [ -d ~/.kube ] || mkdir ~/.kube/
  terraform output kubeconfig>~/.kube/config
  cd ${OGDIR}
}

docker_build(){
  cd container
  docker buld --tag demo-app .
}

deployment(){
  kubectl create demployment eksdemo --image=demo-app
}

main(){
  tr_run &&\
    docker_build &&\
      deployment
}

main
