FROM python:3.10.11-slim

WORKDIR /api

COPY requirements.txt requirements.txt

RUN apt-get update && apt-get install git -y
RUN pip install --no-cache-dir  -r requirements.txt
RUN apt-get update && apt-get install -y ffmpeg


COPY . .

EXPOSE 8000

CMD [ "uvicorn","asr_app:app","--host","0.0.0.0","--port","8000" ]