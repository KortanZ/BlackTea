## Usage
### Run image with bash
```docker run -itd -v /path/to/workfolder:/work -e BUILDER_UID="$(id -u)" -e BUILDER_GID="$(id -g)" --name container_name kortanzh/xv6 bash```
### Execute bash in container
```docker exec -it --user "$(id -u)" container_name bash```
### Attach the container
```docker attach container_name```  
**Do not use ```exit``` to quit if you are half done your jobs, use ```ctrl-p ctrl-q``` to detach from the container.**
