This is the Docker image for all Nitrous.IO Go containers.

To run:

```
docker build -t nitrousio/golang:latest .
docker run -i -t -d nitrousio/golang:latest
docker logs <CID>
docker ps <CID>
ssh -p <port> nitrous@<ip>
```

Enter the password `docker logs` command displays.
