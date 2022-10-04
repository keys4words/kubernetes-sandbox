# create cluster without traefik
k3d cluster create workshop --k3s-arg "--disable=traefik@server:0"  -p "80:80@loadbalancer" \
-p "443:443@loadbalancer" --agents 2