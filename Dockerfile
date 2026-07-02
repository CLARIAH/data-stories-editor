FROM node:alpine as frontend-build
RUN apk --no-cache add git

WORKDIR /app
COPY src/frontend/ /app

RUN npm install && npm run build

FROM python:3.13-alpine

WORKDIR /app

COPY src/service/requirements.txt /app/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

COPY src/service /app/service/
COPY --from=frontend-build /app/ /app/frontend

CMD ["fastapi", "run", "service/main.py", "--port", "80"]