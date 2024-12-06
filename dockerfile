FROM python:3.10.11-slim

WORKDIR /api

COPY ./requirements.txt /api/requirements.txt 

RUN python -m pip install --no-cache-dir -r requirements.txt

COPY ./app.py /api/
COPY /whisper-small-en/ /api/

EXPOSE 8000

CMD [ "fastapi","run","app.py","--port","8000" ]