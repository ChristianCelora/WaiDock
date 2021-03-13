FROM mysql:5.7.30

# Add the content of the backup_db/ directory to your image
# All scripts in docker-entrypoint-initdb.d/ are automatically
# executed during container startup

ADD backup_db /docker-entrypoint-initdb.d/
RUN chown -R mysql:mysql /docker-entrypoint-initdb.d/
CMD ["mysqld", "--character-set-server=utf8mb4", "--collation-server=utf8mb4_unicode_ci"]

#COPY ./init_db.sh /init_db.sh
#RUN chmod 774 /init_db.sh && /init_db.sh