#!/bin/sh
for name in $(cat ./version);
do
  DOCKER_PATH=$name
  echo "生成:$name"
  DIR_NAME=$(echo $name|awk -F / '{print $2}'| awk -F : '{print $1}')
  mkdir $DIR_NAME
cat <<EOF >$DIR_NAME/Dockerfile
FROM $name
MAINTAINER libertinus
EOF

done
