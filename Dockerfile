# 베이스 이미지로 Go 언어를 사용
FROM golang:1.22-alpine

# 작업 디렉토리 설정
WORKDIR /app

# 모듈 초기화 및 의존성 설치
COPY go.mod ./
COPY go.sum ./
RUN go mod download

# 소스 코드 복사
COPY . .

# 애플리케이션 빌드
RUN go build -o /hello-world

# 컨테이너가 시작될 때 실행될 명령
CMD ["/hello-world"]
