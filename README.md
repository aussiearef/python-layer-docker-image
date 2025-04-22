# Build Microservices with AWS and Python 

![Microservices with Python and AWS ](https://img-c.udemycdn.com/course/750x422/5295272_c99f_5.jpg)



This repository maintains a Docker image that can be used to produce a Layer.zip file as a shared library for all the AWS Lambda functions of this Online Course: ["Build Microservices with Python and Amazon Web Services"](https://www.udemy.com/course/draft/5295272/?referralCode=4727A2957A33ED2E4226)

Two ready-to-use Layer.zip files are provided for Python 3.12.0 and Python 3.12.0 under the/Layer Files directory. When you create your Lambda function in AWS, please make sure that the version of your Python runtime in AWS Lambda service matches the version of the Layer.zip file.

If you need a Layer.zip file with Python 3.11 or Python 3.10 etc, you must use the dockerfile with Docker Desktop to produce the Layer.zip:

- Clone the repository.
- Open Terminal
- Go to where "dockerfile" file is located. 
- Run these commands:
  - docker build -f dockerfile -t layer .
  - docker images
- Find the Image ID of a docker image that is called "layer". Copy it somewhere. In below command you must replace <Image ID> with the image ID of the "layer" image.
- Run this command: docker run  -it --rm -v <absolute host path>:/download <Image ID> (example: docker run  -it --rm -v /Users/aref/Downloads:/download 4c32df90a1d5)
  - In the above docker command, make sure your current user has write access to the host path e.g. /Users/aref/Downloads.
- When the shell of the docker container appears, run these commands:
  - cd /
  - cd layer/
  - cp layer.zip /download/
- Now, navigate to the host directory you used above (e.g., /Users/aref/Downloads) and find the layer.zip file there.
- Type "exit" to exit the container.

The above process will take about 10-15 minutes to complete.





