#!/bin/bash

cat > mongo-init.js <<EOL
db = db.getSiblingDB('admin');
db.createUser({
      user: "mike-admin",
      pwd: "3242fDSn43332sKLN2fD3fHSd",
      roles: [{ role: "userAdminAnyDatabase", db: "admin" }]
});
EOL
