This is the Docker image for all Nitrous.IO Ruby containers.

To run:

```
docker build -t nitrousio/ruby:latest .
docker run -i -t -d nitrousio/ruby:latest
docker logs <CID>
docker ps <CID>
ssh -p <port> nitrous@<ip>
```

Enter the password `docker logs` command displays.
