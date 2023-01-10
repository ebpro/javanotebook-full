#BUILDERS="${JUPYTERBOOK_BUILDERS:-html pdflatex singlehtml}"
BUILDERS="${JUPYTERBOOK_BUILDERS:-html}"
cmd="docker run --rm --workdir=\"/booksrc\"\
    --volume $PWD:/booksrc \
	--env NB_UID=$UID \
    --env JUPYTER_ENABLE_LAB=yes \
    brunoe/jupyterjava:develop \
		bash -c \
			\"for builder in $BUILDERS; do \
				python -m nb_conda_kernels list;\
				jupyter-book build \
					--path-output /booksrc/.book/ \
					--config /booksrc/.book/_config.yml \
					--toc /booksrc/.book/_toc.yml \
					--builder singlehtml \
					/booksrc; \
			done\""

# echo "Running: \($cmd\)"

eval $cmd
