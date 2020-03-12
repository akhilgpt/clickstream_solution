CREATE STREAM clicks_stream (_time bigint,time varchar, ip varchar, remote_user Varchar, request varchar, status int, userid int, bytes bigint, referrer Varchar, agent varchar) with (kafka_topic = 'clickstream', value_format = 'AVRO');

CREATE STREAM filtering AS SELECT * FROM clicks_stream where status is not '200';

CREATE STREAM min_sum AS SELECT userid, SUM(bytes) AS min_bytes_sum, WindowStart() AS window_start_time, WINDOWEND () AS window_end_time, from click_stream WINDOW TUMBLING (size 60 second) GROUP BY userid ;

CREATE STREAM hour_sum AS SELECT userid, SUM(bytes) AS hour_bytes_sum, WindowStart() AS window_start_time, WINDOWEND () AS window_end_time, from click_stream WINDOW TUMBLING (SIZE 1 HOUR) GROUP BY userid ;

CREATE STREAM Sessions AS SELECT userid + time + time AS user_session_id, WindowStart() AS session_start, userid AS user_id, count(*) AS request_count FROM click_stream WINDOW SESSION (600 SECONDS) GROUP BY userid ;
