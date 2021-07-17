# Dockerfile

1 - Clone the repository
2 - use below commnad inside the cloned directory to build docker images  
	
	docker build -t ubuntu-16.4 .
	

3 - After this command docker will create a custom image using ubuntu 16.4 you can verify that by

	
	# docker images

	REPOSITORY    TAG       IMAGE ID       CREATED       SIZE
	ubuntu-16.4   latest    c3cb5bb80163   5 hours ago   424MB

    You will see output similar to above output 
 
4 - For creating the container from this docker image use below commad

	docker run -itd --name ubuntu ubuntu-16.4
                      
			then 
	docker exec -it ubuntu /bin/bash

	to attache terminal to docker container

			OR

	docker run -it --name ubuntu ubuntu-16.4 /bin/bash

     last command will open the /bin/bash terminal of the container



# system_detail.sh

1 - Give executable permission to [system_detail.sh] script

2 - Execute it with sudo privilege it will print the detail of your linux machine (only on redhat based machine)


# delete_file.sh

1 - Give executable permission to [delete_file.sh] script

2 - Execute it with sudo privilege

3 - delete_file.sh script will delete audio file older than 48 hours from /home/ubuntu/audios/ 

4 - It will also create a log file inside /home/ubuntu/audios/logs/ which will contain the name and timing of deleted files.



# Doubt


1 - Unable to add timing in ISO format in the log

2 - I dont know to check the bandwith of all interface in a single command 
	we can use nload but don't know to to generate a static output from this commnad


