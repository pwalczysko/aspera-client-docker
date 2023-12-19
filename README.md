IDR Download
============

The https://hub.docker.com/r/imagedata/download image can be used to acquire
the original files which were imported into IDR:

        docker run -ti --rm -v /tmp/data:/data imagedata/download SOURCE TARGET

where SOURCE can be any subfolder under https://ftp.ebi.ac.uk/pub/databases/IDR/. For instance

        docker run -ti --rm -v /tmp/data:/data imagedata/download idr0001-graml-sysgro/20151116-verified/JL_120731_S6A /data/JL_120731_S6A

## Docker environment variables

Calling `docker run` as above envokes `ascp` to download the specified IDR dataset.

Note that you can modify the environment variables in the dockerfile directly in the command line.
For example, to increase the download rate to `100 Mbps`, add an environment variable to the `docker run` command line:

```bash
docker run -ti --rm -v /tmp/data:/data -e ASCP_LIMIT=100m imagedata/download idr0001-graml-sysgro/20151116-verified/JL_120731_S6A /data/JL_120731_S6A
```

You can modify additional variables as well

| Variable | ASCP flag | Default | Description |
| :------- | :-------- | :------ | :---------- |
| ASCP_KEY | `-i` | /home/data/.aspera/connect/etc/asperaweb_id_dsa.openssh | private_key_file |
| ASCP_LIMIT | `-l` | 40m | max_rate |
| ASCP_RETRANSFER_FILE | `-k` | 0 | Transfer file overwrite |
| ASCP_PORT | `-P` | 33001 | ssh-port|
| ASCP_USER | NA | fasp-public | user |
| ASCP_SERVER | NA | fasp.ebi.ac.uk | host |

For a more detailed description of these commands, see the [ascp documentation](https://www.ibm.com/docs/en/aci/3.9.2?topic=ascp-command-reference).
