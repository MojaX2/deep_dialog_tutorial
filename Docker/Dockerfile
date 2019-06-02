FROM tensorflow/tensorflow:nightly-gpu-py3-jupyter

RUN pip install jupyterlab
RUN pip install pipenv
RUN pip install sentencepiece

RUN apt-get install -y git

ARG USER_ID=1000
ARG GROUP_ID=1000
ENV USER_NAME=developer
RUN groupadd -g ${GROUP_ID} ${USER_NAME} && \
    useradd -d /home/${USER_NAME} -m -s /bin/bash -u ${USER_ID} -g ${GROUP_ID} ${USER_NAME} && \
    # DEBIAN_FRONTEND=noninteractive apt-get install -y sudo && \
    echo 'Defaults visiblepw'             >> /etc/sudoers && \
    echo "${USER_NAME} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
WORKDIR /home/${USER_NAME}

USER ${USER_NAME}


RUN git clone https://github.com/MojaX2/deep_dialog_tutorial.git
RUN cd deep_dialog_tutorial && pipenv install

CMD ["pipenv", "run", "jupyter", "lab", "--no-browser", "--ip=0.0.0.0"]