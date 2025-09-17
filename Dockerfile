FROM ubuntu:20.04

ENV TZ=Asia/Kolkata
ENV DEBIAN_FRONTEND=noninteractive

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        python3.10 python3-pip python3-venv sudo \
        git bash curl wget unzip nano \
        ffmpeg mediainfo p7zip-full neofetch \
        ca-certificates locales \
        libglib2.0-0 libsm6 libxrender1 libxext6 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Buat folder default Ultroid
RUN mkdir -p /root/TeamUltroid
WORKDIR /root/TeamUltroid

# Copy semua file project
COPY . .

# Upgrade pip & install Python dependencies
RUN pip3 install --no-cache-dir --upgrade pip setuptools wheel
RUN if [ -f requirements.txt ]; then pip3 install --no-cache-dir -r requirements.txt; fi

# Start bot
CMD ["bash", "run.sh"]
