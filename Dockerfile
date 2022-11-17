FROM ubuntu:20.04
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
RUN apt-get update -y \
&& apt-get install -y software-properties-common \
&& add-apt-repository ppa:deadsnakes/ppa \
&& apt-get install openjdk-8-jdk -y \
&& apt-get install python3-pip -y \
&& export JAVA_HOME \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*
ENV PYSPARK_PYTHON=/usr/bin/python3
ENV PYSPARK_DRIVER_PYTHON=/usr/bin/python3
RUN pip install pyspark==3.2.1
RUN pip install jupyter -U && pip install jupyterlab
EXPOSE 8888
RUN mkdir /project
WORKDIR /project
ENTRYPOINT ["jupyter", "lab","--ip=0.0.0.0","--allow-root"]