# sendmind-local-server

## ubuntu 설치

### wait online 비활성화
```
systemctl disable NetworkManager-wait-online.service
systemctl disable systemd-networkd-wait-online.service
sudo systemctl disable systemd-networkd-wait-online.service
```

### 인터넷 설치

```
sudo apt update
sudo apt install net-tools

iwconfig
ifconfig
sudo ifconfig wlp2s0 up
sudo iwlist wlan0 scan | grep ESSID

sudo vi /etc/netplan/50-cloud-init.yaml

network:
    version: 2
    renderer: networkd
    wifis:
        wlp2s0:
            dhcp4: true
            access-points:
                "SSID":
                    password: "PASSWORD"
sudo netplan apply
sudo reboot
```

```
sudo nano /etc/wpa_supplicant/wpa_supplicant.conf
network={
    ssid="<SSID>"
    psk="<PASSWORD>"
}
sudo wpa_supplicant -B -i wlp2s0 -c /etc/wpa_supplicant/wpa_supplicant.conf
```

### DHCP IP 주소 할당

```
sudo dhclient wlp2s0
ifconfig wlp2s0 로 ip 확인
```

## Docker 설치 

### docker install
- https://docs.docker.com/engine/install/ubuntu/
- https://docs.docker.com/compose/install/linux/

### portainer
- https://psychoria.tistory.com/684
- http://172.30.1.35:9000/#!/home

### postgresql
- https://psychoria.tistory.com/783

```
docker compose -f ./docker-compose.yaml up -d

sudo docker run -d \
--name=postgres \
-e POSTGRES_PASSWORD='' \
-v /data/postgres/data:/var/lib/postgresql/data \
postgres
```

## 설정 추가
.envrc 에 export 추가
docker file 에서 해당 키 넘기기
