This is the Docker image for all Nitrous.IO Docker containers.

To run:

```
docker build -t nitrousio/docker:latest .
docker run -i -t -d nitrousio/docker:latest
docker logs <CID>
docker ps <CID>
ssh -p <port> nitrous@<ip>
```

Enter the password `docker logs` command displays.
