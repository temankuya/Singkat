FROM python:3.11-slim-bullseye

ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y \
    ffmpeg \
    neofetch \
    p7zip-full \
    wget \
    gnupg \
 && wget https://mediaarea.net/repo/deb/repo-mediaarea_1.0-19_all.deb \
 && dpkg -i repo-mediaarea_1.0-19_all.deb \
 && apt-get update && apt-get install -y mediainfo \
 && rm -rf /var/lib/apt/lists/*

COPY . .

RUN python3 fetch.py

CMD ["bash", "run.sh"]
