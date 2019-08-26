# spartan-app

Tuesday
$ docker build .

or docker build -t andrebriggs/spartan-app:latest . with tag

$ docker image ls

$ docker run --rm -p 8080:8080 DOCKER_IMAGE_ID

$ docker ps 

$ docker push andrebriggs/spartan-app Push the tag name

Dockerfile based off of instructions at https://boyter.org/posts/how-to-start-go-project-2018/

Instrumenting Prom
https://prometheus.io/docs/guides/go-application/

https://www.callicoder.com/docker-golang-image-container-example/

curl -sS localhost:8080/metrics | grep spartan_app

kubectl port-forward svc/prometheus-server 8080:80 -n prometheus

go to 
http://127.0.0.1:8080/graph?g0.range_input=1h&g0.expr=spartan_app_processed_ops_total&g0.tab=0&g1.range_input=1h&g1.expr=&g1.tab=1


Setting up prom scraping 
https://medium.com/@zhimin.wen/custom-prometheus-metrics-for-apps-running-in-kubernetes-498d69ada7aa

Alerting on gauges in PROM
https://www.robustperception.io/alerting-on-gauges-in-prometheus-2-0

TODO:

Go Module creation: https://roberto.selbach.ca/intro-to-go-modules/
