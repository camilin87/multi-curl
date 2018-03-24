# Building the image  

```bash
docker build -t camilin87/multi-curl .
```

# Local development  

Most of the local development tasks should be run from the `src` directory  

## Prerequisites  

- ruby

## Install dependencies  

```bash
bundler install
```

## Running the tests  

```bash
bundle exec rspec
```

## Integration test  

```bash
sh int-test.sh
```
