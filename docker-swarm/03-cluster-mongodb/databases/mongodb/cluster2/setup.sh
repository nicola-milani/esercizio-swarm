#!/bin/bash

export MONGODB_PASSWORD=$(cat /run/secrets/MONGODB_PASSWORD)
export MONGODB_USERNAME=$(cat /run/secrets/MONGODB_USERNAME)
cat << EOF >/tmp/CreateMongoUser.js
use admin;
db.auth("${MONGODB_USERNAME}","${MONGODB_PASSWORD}");
sleep(1000);
rs.initiate();
sleep(1000);
cfg = rs.conf();
cfg.members[0].host = "mongo1:27017";
rs.reconfig(cfg); 
rs.add({ host: "mongo2:27017", priority: 0.5 }); 
rs.add({ host: "mongo3:27017", priority: 0.5 });
rs.status();
EOF
mongosh mongodb://"${MONGODB_USERNAME}":"${MONGODB_PASSWORD}"@mongo1:27017/admin?ssl=false < /tmp/CreateMongoUser.js

