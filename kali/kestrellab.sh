#!/usr/bin/sh

echo "killing lab if exists..."
docker ps | grep opencybersecurityalliance | cut -d ' ' -f1 | xargs docker stop

echo "spinning up fresh lab..."
nohup repo2docker https://github.com/opencybersecurityalliance/black-hat-us-2024.git &

while true
do
    sleep 1
    container=$(docker ps | grep opencybersecurityalliance)
    if [ -z "$container" ]
    then
        echo "building lab..."
    else
        port=$(docker ps | grep opencybersecurityalliance | cut -d ':' -f2 | cut -d '-' -f1)
        echo "ready, hunt"
        sleep 1
        firefox http://127.0.0.1:$port/tree
        break
    fi
done
