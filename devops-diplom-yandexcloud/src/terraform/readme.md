terraform init -backend-config secret.backend.tfvars

ansible-playbook -i ./inventory/sample/hosts.yaml -u ubuntu --become --become-user=root site.yml

ansible-playbook -i ./inventory/mycluster/hosts.yaml --become --become-user=root cluster.yml

sudo cp -r /root/.kube ~/
sudo chown -R ubuntu:ubuntu ~/.kube

kubectl get node
kubectl get pods --all-namespaces

mkdir -p ~/.kube && ssh ubuntu@178.154.207.132 "sudo cat /root/.kube/config" >> ~/.kube/config

docker login docker.github.com -u
