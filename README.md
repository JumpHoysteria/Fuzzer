# Fuzzer

## What and Why
Plug and play-repo to fuzz sudo with [AFL](https://lcamtuf.coredump.cx/afl/) inside an Ubuntu Docker Container. Works on Windows 10, although the only non-OS-agnostic component is the syntax for the volume-description in `docker-compose.yaml`. Meaning you should be able to run this on a toaster, granted you get to run docker on it. 

*Who uses this?*
Very busy nerds. This repo enables you to run the proof of concept for fuzzing sudo in minutes. If you have the time to get to a working fuzzer yourself starting from LO's template, please do. I learned an awful lot during this process.

This is a crude reproduction of LiveOverflow's (LO) Pwnedit [Episode02](https://github.com/LiveOverflow/pwnedit). Use at your own risk.

All Credits: @LiveOverflow [Github](https://github.com/LiveOverflow) [YouTube](https://www.youtube.com/channel/UClcE-kVhqyiHCcjYwcpfj9w)
and any mistakes that you will find here are mine.

## Requirements
* [Docker](https://www.docker.com/)

## How to use

### Adjust paths in `docker-compose.yaml`
My path is hardcoded in this file. You will have to adjust the 'c:/Users/Alex/Desktop/Fuzzer/src' bit to point to where the src-Folder of this Repository lives on your system. 

### Follow instructions from `README.txt` or read on:

#### Build images and run container in repo-folder:
Open a command-prompt by pushing Win + R (i.e. push down Windows button and R button on Keyboard down at the same time), then enter `cmd` and press ENTER.
Enter the following commands without the prefixxed `$`-Sign

```bash
$ docker-compose build --no-cache
$ docker-compose up
```
Here you will get something that looks like this: 'XXX_fuzzer_1'. Write that down. After `docker-compose up` leads to `fuzzer_1 | ...`, open new command prompt.

#### In new prompt: 
```bash
$ docker exec -u 0 -it XXX_fuzzer_1 bash
```
#### This opens up a root shell in container.
#### As root:
```bash
$ /root/code/setup.sh
```

#### Test whether sudo binary is healthy:
```bash
$ /root/sudo-1.8.31p2/src/sudo #then press ENTER
```

#### Start Fuzzing:
```bash
$ /root/code/start.sh
```
