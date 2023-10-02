#!/usr/bin/env bash

ls -l /tmp
echo "GEN_SSH_KEYS=$GEN_SSH_KEYS"

go-deploy -init --working-directory aws
go-deploy --working-directory aws -w test-go-deploy -c config.yml.sample
public_ip=`terraform -chdir=aws output -raw public_ip`
which ansible
ansible --version
echo $public_ip
#ssh -i /tmp/go-ssh ubuntu@$public_ip ls -l stage_dir/test_file
ret=$?
go-deploy --working-directory aws -w test-go-deploy -destroy
exit $ret 
