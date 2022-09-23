# find repo
helm search hub <what-i-search>
helm repo add <repo>
helm repo list
# install chart
helm install <name> <repo-name>
# show active helm charts
helm list
# show details about chart
helm status <chart-name>