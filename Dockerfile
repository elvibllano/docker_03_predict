FROM public.ecr.aws/lambda/python:3.8

RUN yum update -y
RUN yum install -y libpq-dev gcc
# RUN yum install -y wget mesa-libGL
# RUN yum install unzip
# RUN wget https://github.com/Badar97/Progetto_PA/raw/main/file.zip
# RUN unzip file.zip
# RUN wget https://netcologne.dl.sourceforge.net/project/gdal-wheels-for-linux/GDAL-3.4.1-cp38-cp38-manylinux_2_5_x86_64.manylinux1_x86_64.whl
RUN pip install joblib \ 
       matplotlib \
       numpy \
       pandas \
       tensorflow \
       keras \
       sklearn \
       psycopg2-binary

#WORKDIR /app
WORKDIR ${LAMBDA_TASK_ROOT}

COPY app.py ${LAMBDA_TASK_ROOT}
COPY predict_script.py ${LAMBDA_TASK_ROOT}
COPY ElevationValues_full.json ${LAMBDA_TASK_ROOT}
COPY ElevationValues_full_ResultD2.json ${LAMBDA_TASK_ROOT}
COPY model5Gaeta.h5 ${LAMBDA_TASK_ROOT}
CMD ["app.handler"]