FROM ubuntu:20.04

# Set timezone & non-interactive
ENV TZ=Asia/Kolkata
ENV DEBIAN_FRONTEND=noninteractive
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Update & install dependencies + Python 3.10
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        python3.10 python3.10-venv python3-pip sudo \
        git bash curl wget unzip nano \
        ffmpeg mediainfo p7zip-full neofetch \
        ca-certificates locales \
        libglib2.0-0 libsm6 libxrender1 libxext6 \
        build-essential libffi-dev libssl-dev python3-dev \
    && ln -sf /usr/bin/python3.10 /usr/bin/python3 \
    && ln -sf /usr/bin/python3.10 /usr/bin/python \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Buat folder Ultroid
RUN mkdir -p /root/TeamUltroid
WORKDIR /root/TeamUltroid

# Copy semua file project kamu
COPY . .

# Pastikan run.sh executable
RUN chmod +x run.sh

# Upgrade pip & install Python dependencies
RUN pip install --no-cache-dir --upgrade pip setuptools wheel
RUN if [ -f requirements.txt ]; then pip install --no-cache-dir -r requirements.txt; fi

# Jalankan fetch.py saat build (opsional)
RUN if [ -f fetch.py ]; then python fetch.py || true; fi

# Entry point: jalankan run.sh (fetch.py + start.py)
CMD ["bash", "run.sh"]
