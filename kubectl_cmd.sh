#Deploy the Web api on kubernetes cluster

#Step 1: Login : use cloud login command

#Step 2: Verify cloud region and kubectl command as below
kubectl config current-context

#Step 3: Run Namespace
kubectl create ns hc-webapidemo
#Logs
#namespace "hc-webapidemo" created

#Step 3.1: Verify Namespace
kubectl get ns
#Logs
#NAME             STATUS    AGE
#hc-webapidemo    Active    28s

#Step 4: deploy yaml
kubectl create -f deploy.yaml -n hc-webapidemo
#update deployment 
#kubectl apply -f deploy.yaml -n hc-webapidemo

#Logs
#service "webdemo" created
#deployment.extensions "webdemo" created

#Step 4.1: Verify pods
kubectl get pods -n hc-webapidemo

#Step 4.1: Verify deployment
#Reference: https://kubernetes.io/docs/tasks/access-application-cluster/port-forward-access-application-cluster/
kubectl get deployment -n hc-webapidemo
kubectl get pods -n hc-webapidemo

#Step 4.1: port-forward service
#port-forward svc
kubectl port-forward svc/webdemo 8092:80 -n hc-webapidemo
#Logs
#Forwarding from 127.0.0.1:8092 -> 80
#Forwarding from [::1]:8092 -> 80
#Handling connection for 8092
#Handling connection for 8092

#Local URL
#http://localhost:8092/api/values
#Cloud URL
#http://<cloudName>:30006/api/values

#Delete Namespace
#kubectl delete namespace hc-webapidemo1