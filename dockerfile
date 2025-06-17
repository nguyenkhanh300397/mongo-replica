
FROM mongo:4.4

COPY init-replica.js /docker-entrypoint-initdb.d/init-replica.js


