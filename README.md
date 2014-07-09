hydra
=====

Add authorized key for user

    export REMOTE_USER=vagrant
    export REMOTE_KEY=$(cat $HOME/.ssh/id_rsa.pub)
    cd ansible
    ansible-playbook --inventory-file=$(pwd)/hosts --private-key=$HOME/.vagrant.d/insecure_private_key -u vagrant bootstrap.yml
