FROM python:3.11-slim-bullseye

ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# install dependencies + repo MediaArea
RUN apt-get update && apt-get install -y \
    ffmpeg \
    neofetch \
    p7zip-full \
    wget \
    gnupg \
    git \
 && wget https://mediaarea.net/repo/deb/repo-mediaarea_1.0-19_all.deb \
 && dpkg -i repo-mediaarea_1.0-19_all.deb || true \
 && apt-get -f install -y \
 && apt-get update && apt-get install -y mediainfo \
 && rm -rf /var/lib/apt/lists/* repo-mediaarea_1.0-19_all.deb

# copy project files
COPY . .

# install python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# jalankan fetch.py sekali untuk setup awal
RUN python3 fetch.py

# start ultroid
CMD ["bash", "run.sh"]
