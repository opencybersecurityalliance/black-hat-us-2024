#!/usr/bin/sh

docker ps | grep opencybersecurityalliance | cut -d ' ' -f1 | xargs docker stop

nohup repo2docker https://github.com/opencybersecurityalliance/black-hat-us-2024.git &

while true
do
    sleep 1
    container=$(docker ps | grep opencybersecurityalliance)
    if [ -z "$container" ]
    then
        echo "build container..."
    else
        port=$(docker ps | grep opencybersecurityalliance | cut -d ':' -f2 | cut -d '-' -f1)
        echo "let's hunt..."
        sleep 2
        firefox http://127.0.0.1:$port/tree
        break
    fi
done
