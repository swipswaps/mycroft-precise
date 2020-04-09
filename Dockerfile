FROM python:3.7-slim
ENV TERM linux
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y install git python3-scipy cython libhdf5-dev python3-h5py portaudio19-dev swig libpulse-dev libatlas-base-dev
RUN mkdir -p /root/allure /opt/mycroft/mycroft-precise
COPY . /opt/mycroft/mycroft-precise
WORKDIR /opt/mycroft/mycroft-precise
RUN pip install .
RUN pip install pytest allure-pytest
ENTRYPOINT ["pytest", "--alluredir", "/root/allure/allure-result"]
