# clickstream_solution
solution for pluralsight Assesment

Source of docker images : https://github.com/deuscapturus/data-ops-candidate-challenge

Setup: Since I have a windows 10 personal laptop, I ran docker container on windows (install docker hub ).

1. open cmd prompt, go to location where docker-compose.yml file is present (download from https://github.com/deuscapturus/data-ops-candidate-challenge). 
2. Run docker-compose up

Since docker is running in unix based on container, I Installed an Ubuntu app on windows as well.

recap : Kafka is running in docker conatiner on windows and Ubuntu app on windows is running.

***In Ubuntu APP***

Now Open ubuntu app And Installed latest confluent kafka package on ubuntu

`curl -O http://packages.confluent.io/archive/5.4/confluent-5.4.1-2.12.tar.gz`\
`Cd confluent-5.4.1`

**Run command**\
`./bin/ksql-server-start /etc/ksql/ksql-server.properties`

---

In a new Ubuntu window, Run

**Run** 
`./bin/ksql http://localhost:8088`\

`ksql> RUN SCRIPT 'challange.sql';`

Note: for this challenge, I create 'challenge.sql' within my confluent-5.4.1 Directory

---
**Description of query**

The challange.sql script create a Stream 'click_stream'. Then create Stream 'filtering', 'min_sum', 'hour_sum' and 'Sessions' by querying the 'click_stream' Stream.




