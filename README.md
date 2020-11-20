# Chiquito nginx

This is a joke.

# How to use

See Makefile or run `make` for help

# Requirements

* docker
* docker-compose
* crazyness
* python3 and pip

# Tasks

[![Issues open](https://img.shields.io/github/issues/davidfrigola/chiquitonginx.svg)](https://github.com/davidfrigola/chiquitonginx/issues)

# Last build
[![Actions Status](https://github.com/davidfrigola/chiquitonginx/workflows/Build,%20run%20and%20test%20app%20python%20based/badge.svg)](https://github.com/davidfrigola/chiquitonginx/actions)



# Kubernetes version - local

Requires minikube and terraform (0.13)

Build the containers using
```
docker-compose -f docker-compose-simple.yml build
```

Then go to `/terraform/environment/local` and run `terraform apply`
A new namespace `chiquito-namespace` will be created , with a `chiquito-deployment` including 3 pods with 2 containers each : `chiquito-nginx` and `app` (nodejs version)

Then check for the ingress via :
```
kubectl get ingress chiquito-ingress -n chiquito-local


NAME               CLASS    HOSTS   ADDRESS      PORTS   AGE
chiquito-ingress   <none>   *       172.17.0.2   80      20m

```
And you can curl `curl http://172.17.0.2/202` or any other endpoint.

Ignoring the ingress, you can go to the deployment by port forwarding `80` so we can access nginx container

```
kubectl port-forward deployment/chiquito-deployment 8999:80 -n chiquito-local
```

Then curl :

```
curl http://localhost:8999/200 -v

Trying 127.0.0.1:8999...
* TCP_NODELAY set
* Connected to localhost (127.0.0.1) port 8999 (#0)
> GET /200 HTTP/1.1
> Host: localhost:8999
> User-Agent: curl/7.68.0
> Accept: */*
>
* Mark bundle as not supporting multiuse
< HTTP/1.1 200 OK
< Server: nginx/1.15.8
< Date: Mon, 16 Nov 2020 19:26:40 GMT
< Content-Type: text/plain; charset=utf-8
< Content-Length: 2
< Connection: keep-alive
< X-Powered-By: Express
< ETag: W/"2-nOO9QiTIwXgNtWtBJezz8kv3SLc"
< X-Chiquito: Siete caballos vienen de bonanza 200
<
* Connection #0 to host localhost left intact

```


To clean up , remove deployment and all pods using
```
terraform destroy
```
