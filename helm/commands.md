# find chart to install
helm search hub <what-i-search>
# add a chart repo
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo list
# install chart
helm install --set grafana.replicaCount=2 grafana bitnami/grafana
# show list of charts
helm list
# show details about chart
helm status <chart-name>
# upgrade/delete installation
helm upgrade grafana
helm upgrade --install sample-app sample/conf/charts/sample-app --namespace demo --set app.image=sample-app:local
# rollback
helm rollback grafana <revision-number>
# create helm chart
helm create <name>
# package helm chart
helm package <name-package>