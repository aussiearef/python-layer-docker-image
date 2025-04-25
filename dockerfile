# Define a build-time variable for the Python version with a default value
ARG pythonVersion=3.10.0

FROM amazonlinux:2

# Re-declare the build argument to ensure it's available in this stage
ARG pythonVersion

WORKDIR /App

# Debug: Print the pythonVersion to verify it's set
RUN echo "Building with Python version: ${pythonVersion}"

RUN yum update -y && \
    yum groupinstall "Development Tools" -y && \
    yum erase openssl-devel -y && \
    yum install openssl11 openssl11-devel libffi-devel bzip2-devel wget zip python3-pip -y

# Use the pythonVersion variable in the wget command
RUN wget "https://www.python.org/ftp/python/${pythonVersion}/Python-${pythonVersion}.tgz" && \
    tar -xf Python-${pythonVersion}.tgz && \
    cd Python-${pythonVersion} && \
    ./configure --enable-optimizations && \
    make -j $(nproc) && \
    make altinstall

# Verify the installed Python version
RUN python${pythonVersion%.*} --version

# Create layer directory structure
RUN mkdir -p /layer/python

# Install Python packages
RUN cd /layer/python && \
    pip3 install python-multipart -t . && \
    pip3 install PyJWT -t . && \
    pip3 install cffi -t . && \
    pip3 install dynamodb_json -t . && \
    pip3 install cryptography -t . && \
    pip3 install elasticsearch -t .

# Create the layer zip
RUN cd /layer && \
    zip -r layer.zip .

# Set the working directory to root
WORKDIR /