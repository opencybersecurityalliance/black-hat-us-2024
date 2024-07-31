#!/usr/bin/sh

echo "#### Kestrel Lab for Black Hat US 2024 ####"
echo ""

echo "Killing lab if exists..."
docker ps | grep opencybersecurityalliance | cut -d ' ' -f1 | xargs docker stop
echo ""

echo "Spinning up fresh lab..."
nohup repo2docker https://github.com/opencybersecurityalliance/black-hat-us-2024.git &
echo ""

while true
do
    sleep 1
    container=$(docker ps | grep opencybersecurityalliance)
    if [ -z "$container" ]
    then
        echo "#### Building lab..."
    else
        port=$(docker ps | grep opencybersecurityalliance | cut -d ':' -f2 | cut -d '-' -f1)
        echo "#### Ready, set, hunt"
        sleep 2
        firefox http://127.0.0.1:$port/tree
        break
    fi
done
