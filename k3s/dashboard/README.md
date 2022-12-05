# k3s

## 代理加速
export http_proxy=http://192.168.2.103:7890;export https_proxy=http://192.168.2.103:7890

## 文档参考
https://docs.rancher.cn/docs/k3s/installation/kube-dashboard/_index

## 部署 Kubernetes 仪表盘
查看最新release=>v2.7.0
https://github.com/kubernetes/dashboard/releases
下载recommended.yaml
https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
create
k3s kubectl create -f dashboard.recommended.yaml

## 外网访问dashboard
将service的type改成NodePort
kubectl -n kubernetes-dashboard edit service kubernetes-dashboard
或者(推荐)
kubectl -n kubernetes-dashboard port-forward svc/kubernetes-dashboard 9090:443 --address 192.168.220.178 &
查看端口号
kubectl get service -n kubernetes-dashboard

## 仪表盘 RBAC 配置
k3s kubectl create -f dashboard.admin-user.yml -f dashboard.admin-user-role.yml

## 登录dashboard
获得 Bearer Token
k3s kubectl -n kubernetes-dashboard create token admin-user
登录
https://{masterip}:{port}/#/login