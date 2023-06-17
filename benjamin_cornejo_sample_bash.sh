#!/bin/bash 

mkdir tempdir 
mkdir tempdir/templates 
mkdir tempdir/static 

cp benjamin_cornejo_website.py tempdir/. 
cp -r templates/* tempdir/templates/.
cp -r static/* tempdir/static/.

echo "FROM python" > tempdir/Dockerfile 
echo "RUN pip install flask" >> tempdir/Dockerfile

echo "COPY  ./static /home/myapp/static/" >> tempdir/Dockerfile
echo "COPY  ./templates /home/myapp/templates/" >> tempdir/Dockerfile
echo "COPY  benjamin_cornejo_website.py /home/myapp/" >> tempdir/Dockerfile
echo "EXPOSE 8888" >> tempdir/Dockerfile
echo "CMD python3 /home/myapp/benjamin_cornejo_website.py" >> tempdir/Dockerfile

cd tempdir
docker build -t benjamin_cornejo_imagen .

docker run -t -d -p 8888:8888 --name benjamin_cornejo_running benjamin_cornejo_imagen
docker ps -a 

