docker run --rm --name dexplex -p 8080:8080 -it -v /home/gdan/dev/docker/dexplex/dexplex/logs:/dexplex/logs -v /home/gdan/dev/docker/dexplex/dexplex/config:/dexplex/config dexplex $1 $2 $3
