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

# Upload to S3
s3cmd --access_key=${AWS_KEY} --secret_key=${AWS_SECRET} put mongodb-$TIMESTAMP.tar s3://${S3_BUCKET_NAME}/${S3_BUCKET_PATH}/mongodb-$TIMESTAMP.tar

echo "Backup done."