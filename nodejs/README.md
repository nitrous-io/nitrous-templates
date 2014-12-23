This is the Docker image for all Nitrous.IO Node.JS containers.

To run:

```
docker build -t nitrousio/nodejs:latest .
docker run -i -t -d nitrousio/nodejs:latest
docker logs <CID>
docker ps <CID>
ssh -p <port> action@<ip>
```

Enter the password `docker logs` command displays.
