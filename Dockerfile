FROM python:latest

# set timezone
ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# update & install dependencies
RUN apt-get update && apt-get install -y \
    ffmpeg \
    neofetch \
    mediainfo \
    p7zip-full \
 && rm -rf /var/lib/apt/lists/*

# copy source
COPY . .

# install Python dependencies jika ada requirements.txt
# RUN pip install --no-cache-dir -r requirements.txt

RUN python3 fetch.py

# start the bot
CMD ["bash", "run.sh"]
