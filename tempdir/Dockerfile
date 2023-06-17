FROM python
RUN pip install flask
COPY  ./static /home/myapp/static/
COPY  ./templates /home/myapp/templates/
COPY  benjamin_cornejo_website.py /home/myapp/
EXPOSE 8888
CMD python3 /home/myapp/benjamin_cornejo_website.py
