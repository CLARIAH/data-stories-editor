FROM node:alpine as frontend-build
RUN apk --no-cache add git

WORKDIR /app
COPY ./frontend/ /app/frontend
RUN cd /app
RUN git clone https://github.com/knaw-huc/npm-chart-plugin
RUN git clone https://github.com/knaw-huc/npm-geo-plugin

RUN npm install && npm run build

FROM python:3.13-alpine

WORKDIR /app

COPY ./service/requirements.txt /app/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

COPY ./service/ /app/service/

CMD ["fastapi", "run", "service/main.py", "--port", "80"]