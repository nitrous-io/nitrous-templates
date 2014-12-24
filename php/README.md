This is the Docker image for all Nitrous.IO PHP containers.

To run:

```
docker build -t nitrousio/php:latest .
docker run -i -t -d nitrousio/php:latest
docker logs <CID>
docker ps <CID>
ssh -p <port> action@<ip>
```

Enter the password `docker logs` command displays.
