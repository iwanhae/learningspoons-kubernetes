FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y openssl apt-transport-https ca-certificates curl gpg
RUN curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | gpg --dearmor -o /etc/apt/keyrings/kubernetes-archive-keyring.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list
RUN apt update && apt install -y kubectl kubeadm
RUN apt install -y bash-completion && \
    echo 'source /etc/bash_completion' >> ~/.bashrc && \
    echo 'source <(kubectl completion bash)' >> ~/.bashrc

COPY scripts /scripts
ENV PATH="$PATH:/root/bin"

ENV ETCDCTL_API=3
ENV ETCDCTL_CACERT='/etc/kubernetes/pki/etcd/ca.crt'
ENV ETCDCTL_CERT='/etc/kubernetes/pki/apiserver-etcd-client.crt'
ENV ETCDCTL_KEY='/etc/kubernetes/pki/apiserver-etcd-client.key'
ENV ETCDCTL_ENDPOINTS='https://127.0.0.1:2379'

ENV KUBECONFIG='/etc/kubernetes/admin.conf'
WORKDIR /root