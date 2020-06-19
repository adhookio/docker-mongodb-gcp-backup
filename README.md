docker-mongodb-gcp-backup
============

# Description
Backup your MongoDB to your Google Cloud Storage bucket.

# Add Credentials
Edit the Google Cloud Storage Credentials in the .boto file.

# Build image

    docker build -t adhook/docker-mongodb-s3-backup .

# Usage

    docker run -i \
        -e MONGO_HOST=docker.for.mac.localhost:27017 
        -e MONGO_DATABASE=adhook 
        -e MONGO_USER=<<DATABASE_USER>> \
        -e MONGO_PASSWORD=<<DATABASE_PW>> \ 
        -e GS_URL=gs://adhook-mongodb-backup  
        --rm  adhook/docker-mongodb-gcp-backup

The params ```MONGO_USER``` and ```MONGO_PASSWORD``` are optional.

👉 The container will be deleted after the backup (`--rm` Option).

# Create a cronjob

    crontab -e 

    # m h  dom mon dow   command
    30 2 * * *     docker run -i -e MONGO_HOST=docker.for.mac.localhost:27017 -e MONGO_DATABASE=adhook -e MONGO_USER=<<DATABASE_USER>> -e MONGO_PASSWORD=<<DATABASE_PW>> -e GS_URL=gs://adhook-mongodb-backup  --rm  adhook/docker-mongodb-gcp-backup

    
