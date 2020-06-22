docker-mongodb-gcp-backup
============

Backup your MongoDB to your Google Cloud Storage bucket.

# Usage

    docker run -i \
        -e MONGO_HOST=<<MONGODB_HOST>>
        -e MONGO_DATABASE=<<DATABASE_NAME> 
        -e MONGO_USER=<<DATABASE_USER>> \
        -e MONGO_PASSWORD=<<DATABASE_PW>> \ 
        -e GS_URL=gs://adhook-mongodb-backup \  
        -e GS_ACCESS_KEY=<<GS_ACCESS_KEY>> \
        -e GS_SECRET_ACCESS_KEY=<<GS_SECRET_ACCESS_KEY>> \
        --rm  docker.pkg.github.com/adhookio/docker-mongodb-gcp-backup/docker-mongodb-gcp-backup:latest

The params ```MONGO_USER``` and ```MONGO_PASSWORD``` are optional.

👉 The container will be deleted after the backup (`--rm` Option).

# Create a cronjob

    crontab -e 

    # m h  dom mon dow   command
    30 2 * * *     docker run -i -e MONGO_HOST=docker.for.mac.localhost:27017 -e MONGO_DATABASE=adhook -e MONGO_USER=<<DATABASE_USER>> -e MONGO_PASSWORD=<<DATABASE_PW>> -e GS_URL=gs://adhook-mongodb-backup  --rm  adhook/docker-mongodb-gcp-backup


    
