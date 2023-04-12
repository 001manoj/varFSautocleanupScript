# Author: Manoj Kumar Pal
#

for server in $(cat serverlists); do sshpass -p redhat ssh -o StrictHostKeyChecking=accept-new root@$server  ' bash -s '< ./space.sh ; done

#this script is used to login the list of the servers specified in the serverlists file and do ssh for every servers and execute space.sh script and 
#perform actions specified inside the space.sh script file.
