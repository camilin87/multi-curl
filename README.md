# multi-curl  

Docker container to download multiple urls with unique filenames  

# Usage  

Create a file with a list of urls to download  

```bash
cat > /tmp/urls_list <<EOL
https://tddapps.com/shoes/
https://www.tddapps.com/contact/
https://github.com/camilin87
EOL
```

Run the container  

```bash
docker run --rm \
  -v /tmp/urls_list:/var/mc/input/urls.txt \
  -v ~/Downloads/tmp:/var/mc/output/ \
  camilin87/multi-curl
```
