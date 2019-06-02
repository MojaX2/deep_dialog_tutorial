IMAGE_NAME="deep-dialog-tutorial"
docker build . -t ${IMAGE_NAME}
docker run --rm --runtime=nvidia -it -p 8888:8888 ${IMAGE_NAME}