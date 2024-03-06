tag:=v0.0.9
image_name:=poridhi-docker-lab
respository:=poridhi
container_name:=dockerlab

build-docker-lab:
	@ docker build --platform linux/amd64 -t ${image_name}:${tag} .

push-docker-lab:
	@ echo "Pushing ${respository}/${image_name}:${tag} to docker hub"
	@ docker tag ${image_name}:$(tag) ${respository}/${image_name}:${tag}
	@ docker push ${respository}/${image_name}:${tag}

run-docker-lab:
	@ docker run --platform linux/amd64 -d --name  ${container_name} -p 2222:22 ${image_name}:$(tag)

exec-docker-lab:
	@ docker exec -it ${container_name} /bin/bash

rm-docker-lab:
	@ docker stop ${container_name}
	@ docker rm -f ${container_name}		


