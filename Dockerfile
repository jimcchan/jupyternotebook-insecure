FROM debian:testing-slim

LABEL version="1.0"
LABEL maintainer="ITOps <itops0@gmail.com>"
LABEL description="Jupyter notebook"

# Install some deps, lessc and less-plugin-clean-css, and wkhtmltopdf
RUN apt-get update \
        && apt-get install -y --no-install-recommends \
			curl \
			python3-pip \
			python3-dev \
			vim \
			less \
        && rm -rf /var/lib/apt/lists/*

RUN pip install matplotlib jupyter

RUN useradd --system --create-home jupyter
USER jupyter

COPY config.py /etc/jupyter/config.py

ENTRYPOINT ["jupyter", "notebook"]
CMD ["--config", "/etc/jupyter/config.py"]
