cd ..

proj_name=""
container_name=""
image_name=""
CUDA_VISIBLE_DEVICES='0'

docker run --gpus '"'device=$CUDA_VISIBLE_DEVICES'"' --ipc=host --rm -it \
    --name $container_name \
    --mount src=$(pwd),dst=/$proj_name,type=bind \
    -e NVIDIA_VISIBLE_DEVICES=$CUDA_VISIBLE_DEVICES \
    -p 7777:8888 \
    -w /$proj_name \
    $image_name \
    bash -c "bash" \
