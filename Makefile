build:
	docker build -t adgenomics/logstash .

run:
	docker run -v /home/ubuntu/docker-logstash-ec2-cluster/access.log:/var/log/apache2/access.log --name logstash -d -p 9300:9300 -p 9200:9200 -e AWS_ACCESS_KEY=${AWS_ACCESS_KEY} -e AWS_SECRET_KEY=${AWS_SECRET_KEY} adgenomics/logstash

clean:
	docker rm -f logstash
