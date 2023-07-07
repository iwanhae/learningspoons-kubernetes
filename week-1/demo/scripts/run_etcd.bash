#! /bin/bash

nohup etcd \
    --advertise-client-urls=https://127.0.0.1:2379 \
    --listen-client-urls=https://127.0.0.1:2379 \
    --listen-peer-urls=https://127.0.0.1:2380 \
    --initial-advertise-peer-urls=https://127.0.0.1:2380 \
    --initial-cluster=master=https://127.0.0.1:2380 \
    --client-cert-auth=true \
    --trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt \
    --cert-file=/etc/kubernetes/pki/etcd/server.crt \
    --key-file=/etc/kubernetes/pki/etcd/server.key \
    --peer-client-cert-auth=true \
    --peer-trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt \
    --peer-cert-file=/etc/kubernetes/pki/etcd/peer.crt \
    --peer-key-file=/etc/kubernetes/pki/etcd/peer.key \
    --data-dir=/var/lib/etcd \
    --name=master \
    --snapshot-count=10000 &