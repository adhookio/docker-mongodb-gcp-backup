#!/bin/sh -xe

TIMESTAMP=`date +%F-%H%M`
S3_BUCKET_PATH="mongodumps"

if [ -z "${MONGO_USER}" ];
then
    # Create backup (without credentials)
    mongodump -h ${MONGO_HOST} -d ${MONGO_DATABASE}

else
    # Create backup (with credentials)
    mongodump -h ${MONGO_HOST} -d ${MONGO_DATABASE} -u ${MONGO_USER} -p ${MONGO_PASSWORD}
fi

# Add timestamp to backup
mv dump mongodb-$TIMESTAMP
tar cf mongodb-$TIMESTAMP.tar mongodb-$TIMESTAMP
cp mongodb-$TIMESTAMP.tar /root
# Upload to gcp
cd /root && ls -a && gsutil cp mongodb-$TIMESTAMP.tar ${GS_URL}

echo "Backup done."