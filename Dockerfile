FROM pblittle/docker-logstash

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get -y install wget unzip

# Set ENV vars
ENV ES_CLUSTER_NAME elasticsearch
ENV ES_AWS_REGION us-east-1
ENV ES_SECURITY_GROUP elasticsearch

# Install elasticsearch ec2 discovery plugin
RUN mkdir -p /opt/logstash/plugins/cloud-aws
WORKDIR /opt/logstash/plugins/cloud-aws
RUN wget http://download.elasticsearch.org/elasticsearch/elasticsearch-cloud-aws/elasticsearch-cloud-aws-2.1.1.zip 
RUN unzip elasticsearch-cloud-aws-2.1.1.zip
RUN rm elasticsearch-cloud-aws-2.1.1.zip

# Mount config files
ADD config/elasticsearch.yml /opt/logstash/elasticsearch.yml
ADD config/logstash.conf /opt/logstash.conf

WORKDIR /opt/logstash
