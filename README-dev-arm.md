# ARM build insttructions  

## Clone the repo  

```bash
git clone https://github.com/camilin87/multi-curl.git
```

## Get the latest source  

```bash
git pull --rebase
```

## Login to the Docker registry  

```bash
docker login
```

## Build the image  

```bash
docker build -f Dockerfile-arm32v6 -t camilin87/multi-curl-arm32v6 .
```

## Publish the image  

```bash
docker push camilin87/multi-curl-arm32v6
```

## Cleanup  

```bash
docker rmi camilin87/multi-curl-arm32v6
docker system prune -f
```
