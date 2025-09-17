# Gunakan Ubuntu 20.04 sebagai base image (stabil untuk ARM)
FROM ubuntu:20.04

# Set timezone & non-interactive apt
ENV TZ=Asia/Kolkata
ENV DEBIAN_FRONTEND=noninteractive
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Update & install Python + dependencies sistem
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        python3 python3-pip python3-venv \
        bash git curl wget unzip nano \
        ffmpeg mediainfo p7zip-full neofetch \
        ca-certificates locales \
        libglib2.0-0 libsm6 libxrender1 libxext6 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy semua file project (termasuk fetch.py & requirements.txt)
COPY . .

# Upgrade pip & install Python dependencies
RUN pip3 install --no-cache-dir --upgrade pip setuptools wheel
RUN if [ -f requirements.txt ]; then pip3 install --no-cache-dir -r requirements.txt; fi

# Jalankan fetch.py **setelah Python terinstall**
RUN python3 fetch.py
# Entrypoint untuk jalankan bot
CMD ["bash", "run.sh"]
