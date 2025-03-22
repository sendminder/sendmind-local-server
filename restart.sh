sudo docker compose -f ./docker-compose.yaml down
sudo docker compose -f ./docker-compose.yaml up -d

docker exec -it netdata sh -c 'cat > /etc/netdata/go.d/prometheus.conf << EOF
jobs:
  - name: sendmind-hub
    url: http://sendmind-hub:8080/metrics
    collect_response_time: yes
EOF'