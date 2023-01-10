docker run --rm \
        --name JupyterJava-${PWD##*/} \
        --volume $PWD:/home/jovyan/work/${PWD##*/} \
        --publish 8888:8888 \
        --env NB_UID=$UID \
        --env JUPYTER_ENABLE_LAB=yes \
        brunoe/jupyterjava:develop start-notebook.sh --notebook-dir=${PWD##*/}
