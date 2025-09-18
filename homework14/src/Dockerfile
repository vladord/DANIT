FROM python:3.12.10-slim
WORKDIR /app
RUN pip install flask==3.1.2 requests==2.32.5 Flask-RESTful==0.3.10 gunicorn==23.0.0
COPY . .
EXPOSE 80
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "app:app"]
