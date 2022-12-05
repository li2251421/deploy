# k3s

## 参考文档
https://kubernetes.io/zh-cn/docs/concepts/storage/persistent-volumes/
https://kubernetes.io/zh-cn/docs/concepts/storage/storage-classes/

## local-storage.yaml
安装k3s默认配置 /var/lib/rancher/k3s/server/manifests/local-storage.yaml
### 修改存储位置
kubectl patch storageclass local-path -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"false"}}}'
"nodePathMap":[
{
"node":"DEFAULT_PATH_FOR_NON_LISTED_NODES",
"paths":["/k3s/storage"]  # 修改为要存储的位置
}
### 修改回收策略
reclaimPolicy: Retain
kubectl patch storageclass local-path -p '{"reclaimPolicy": "Retain"}'  
!!!The StorageClass "local-path" is invalid: reclaimPolicy: Forbidden: updates to reclaimPolicy are forbidden

kubectl patch pv pvc-74630360-23c1-42ce-a743-730e21bc3ca4 -p '{"spec":{"persistentVolumeReclaimPolicy":"Retain"}}'
!!!但每次重启应用，会创建新的pv