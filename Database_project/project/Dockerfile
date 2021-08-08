FROM tiangolo/uwsgi-nginx-flask:python3.8
WORKDIR /var/www/amexpert/Database_project/project/
ENV STATIC_URL /data_base_/static
ENV STATIC_PATH /var/www/amexpert/Database_project/project/data_base_/static
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV FLASK_APP run.py
ENV FLASK_ENV development
ENV FLASK_DEBUG True
ENV DB_DRIVER=postgres
ENV DB_HOST=localhost
ENV DB_PORT=5432
ENV DB_USERNAME=postgres
ENV DB_PASSWORD=1234
ENV DB_DBNAME=amexpert
RUN pip install flask
RUN pip install Flask-SQLAlchemy
RUN pip install flask_bootstrap
RUN pip install flask_login
RUN pip install flask_bcrypt
RUN pip install flask_mail
RUN pip install flask_migrate
RUN pip install flask_limiter
RUN pip install flask_wtf
RUN pip install email_validator
RUN pip install xlrd
RUN pip install openpyxl
RUN pip install xlwt
RUN pip install psycopg2-binary
RUN pip install flask_caching

COPY . ./docker-entrypoint.sh

EXPOSE 5000

RUN ["chmod", "+x", "./docker-entrypoint.sh"]
RUN FLASK_APP=run.py
ENTRYPOINT ["./docker-entrypoint.sh"]
