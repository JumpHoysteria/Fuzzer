# Docker Compose in This folder:
$ docker-compose build --no-cache
$ docker-compose up
# After docker-compose up, leave this command prompt running and open new one
# In new prompt: 
$ docker exec -u 0 -it fuzzer_fuzzer_1 bash
# This opens up a root shell in container.
# As root:
root:/home/user# /root/code/setup.sh

# Test whether binary is healthy:
/root/sudo-1.8.31p2/src/sudo #then press ENTER

# Start Fuzzing:
/root/code/start.sh