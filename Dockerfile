FROM python:3.11-slim

# set timezone
ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y \
    ffmpeg \
    neofetch \
    mediainfo \
    p7zip-full \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

COPY . .

RUN python3 fetch.py

CMD ["bash", "run.sh"]
