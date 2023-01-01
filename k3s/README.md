# k3s

## 代理加速
export https_proxy=http://192.168.2.101:7890;export http_proxy=http://192.168.2.101:7890;export all_proxy=socks5://192.168.2.101:7890
/etc/systemd/system/k3s.service.env
systemctl restart k3s

## 文档参考
https://docs.rancher.cn/docs/k3s/quick-start/_index

## 安装
curl -sfL https://get.k3s.io | sh -

## 命令
kubectl apply -k ./
kubectl delete -k ./
kubectl get deployments
kubectl get services
kubectl get pods
kubectl get secrets
kubectl get pods
kubectl get storageClass
kubectl get pvc
kubectl get pv
kubectl describe pvc wp-pv-claim
kubectl describe pv pvc-032918d5-3658-4329-aab3-d11fc70cd93e
kubectl patch pv pvc-74630360-23c1-42ce-a743-730e21bc3ca4 -p '{"spec":{"persistentVolumeReclaimPolicy":"Retain"}}'
kubectl delete pv pvc-74630360-23c1-42ce-a743-730e21bc3ca4
kubectl delete deployment,svc mysql

## 其他

