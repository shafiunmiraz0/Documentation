FROM couchbase/sync-gateway:latest AS stage_base
COPY sync-gateway.json /etc/sync_gateway/config.json
#RUN chmod 777 /etc/sync_gateway/config.json
COPY init-syncgateway.sh /opt/couchbase-sync-gateway/init/init-syncgateway.sh
#RUN chmod 777 /opt/couchbase-sync-gateway/init/init-syncgateway.sh
#RUN chmod +x /opt/couchbase-sync-gateway/init/init-syncgateway.sh
