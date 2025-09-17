# Base image: Python terbaru berbasis Debian/Ubuntu
FROM ubuntu:20.04

# Set timezone
ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Non-interactive mode untuk apt
ENV DEBIAN_FRONTEND=noninteractive

# Update & install sistem dependencies
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        bash \
        git \
        curl \
        wget \
        unzip \
        nano \
        ffmpeg \
        mediainfo \
        p7zip-full \
        neofetch \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy semua file project
COPY . .


# Jalankan fetch.py jika ada (misal untuk installer.sh atau generate requirements.txt)
RUN if [ -f fetch.py ]; then python3 fetch.py || true; fi

# Entry point: jalankan run.sh untuk start bot
CMD ["bash", "run.sh"]
