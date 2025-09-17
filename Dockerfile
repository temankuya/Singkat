FROM python:3.13-slim

# set timezone
ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# install dependencies
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    ffmpeg \
    mediainfo \
    p7zip-full \
 && rm -rf /var/lib/apt/lists/*

# copy project
COPY . .

# jalankan fetch.py (setup awal)
RUN python3 fetch.py

# start the bot
CMD ["bash", "run.sh"]
