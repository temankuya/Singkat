FROM python:3.13-slim

ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    build-essential \
    python3-dev \
 && pip install --upgrade pip \
 && pip install --no-cache-dir -r requirements.txt \
 && apt-get purge -y --auto-remove gcc build-essential python3-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# copy project files
COPY . .

# jalankan fetch.py sekali untuk setup awal
RUN python3 fetch.py

# start ultroid
CMD ["bash", "run.sh"]
