## Usage
### Run Image
docker run -itd -v */path/to/workfolder*::/work -e BUILDER_UID="$(id -u)" -e BUILDER_GID="$(id -g)" --name *container_name* kortanzh/aosp_nougat bash
### Execute bash in container
docker exec -it --user "$(id -u)" *container_name* bash
