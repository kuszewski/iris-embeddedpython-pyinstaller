from containers.intersystems.com/intersystems/iris:2022.1.0.209.0

USER root

WORKDIR /opt/irisbuild
RUN chown irisowner:irisowner /opt/irisbuild

USER irisowner

ENV PYTHONPATH=/usr/irissys/lib/python:/usr/irissys/mgr/python
ENV IRISUSERNAME=_SYSTEM
ENV IRISPASSWORD=SYS
ENV IRISNAMESPACE=USER

RUN pip3 install tqdm colorama pyinstaller

COPY irisbench.py irisbench.py
COPY runtimehook.py runtimehook.py
COPY iris.script iris.script

RUN iris start IRIS \
	&& iris session IRIS < iris.script \
    && iris stop IRIS quietly
