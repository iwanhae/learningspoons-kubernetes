docker build -t test .
mkdir -p tmp
docker run -it --rm -v $(pwd)/tmp:/host test cp -r /mnt/. /host 