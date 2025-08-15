FROM couchbase/server:latest AS stage_base
# FROM couchbase:latest AS stage_base 
COPY init-cbserver.sh /opt/couchbase/init/init-cbserver.sh
RUN chmod 777 /opt/couchbase/init/init-cbserver.sh
COPY sample-data.json /opt/couchbase/init/sample-data.json
#COPY init-cbserver.sh /opt/couchbase/init/init-cbserver.sh 
RUN chmod 777 /opt/couchbase/init/sample-data.json
