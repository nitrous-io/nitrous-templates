_Last updated 2015-09-16_

1. Create a docker container (you must enable advanced mode in account settings)

https://pro.nitrous.io/app/#/containers/new

2. Write a docker file for the template & test it

```
	$ docker build -t template-name
```

3. Upload the tarball or docker image to create a testable image

https://pro.nitrous.io/app/#/images/new

4. Create a new container using that image

Make sure it works as you expect it to work for the end-user.

5. Push template to Nitrous Templates github repository

6. Build the S3 README

* setup s3 command & AWS access keys

$ go get github.com/russross/blackfriday-tool
$ go install github.com/russross/blackfriday-tool

$ export $(cat ~/.aws)
$ make publish-jekyll

7. Add new template to Makefile

`/nitrous-templates/Makefile`

a. Add to the template type listing by appending template name to list (build-basic, build-stacks, build-advanced)
b. Add to relevant `push-stacks` list  (build-basic, build-stacks, build-advanced)
c. add build instructions

```
	jekyll:
	@./script/dbuild jekyll
	.PHONY: jekyll
```

d. Add s3 publish instructions

```
	publish-jekyll:
		@./script/publish-s3 jekyll Jekyll jekyll/README.md ruby README.md ubuntu/README.md
	.PHONY: publish-jekyll
```

8. Pull latest images dependency in the tree

* Whatever you are inheriting FROM in the first line of the Dockerfile

```
	$ docker pull quay.io/nitrous/ruby
```

9. Build Jekyll template

```
	$ make jekyll
```

10. Push new image build upstream to quay

* requires quay.io authentication
* requires quay.io push access

```
	$ script/dpush jekyll
```

11. Commit the Makefile changes to nitrous-templates github repo

12. Merge branch

```
	$ git merge add-jekyll
	$ git push origin latest
```

13. Create template image thumbnail

TODO: get image path

14. Ensure the image is on Quay.io and is public

* compress the image using tinyPNG
* upload to s3 to `nitrous-image-icons`
* make the image world readable

15. Add slack notification

16. Add new template row to production database

* slug
* name (name)
* description (something relevant)
* config (“privileged”:false,”publish_all”:true)
* type (“basic”, “stack”, “advanced”)
* image (quay.io/nitrous/jekyll.latest)

