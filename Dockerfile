FROM tiledb/tiledb:1.7.7

# Version of TileDB-VCF to install
ARG version=0.4.0

# Install tiledb-vcf dependencies
RUN apt-get update \
    && apt-get install --no-install-recommends -y \
         autoconf automake \
         libbz2-dev liblz4-dev libcurl4-openssl-dev liblzma-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install pandas pybind11==2.3.0 "pyarrow>=0.16.0" "dask>=0.19.0"

RUN wget -P /home/tiledb https://github.com/TileDB-Inc/TileDB-VCF/archive/${version}.tar.gz \
    && tar xzf /home/tiledb/${version}.tar.gz -C /home/tiledb \
    && rm /home/tiledb/${version}.tar.gz \
    && cd TileDB-VCF-${version}/apis/python \
    && python3 setup.py install \
    && rsync -rav ../../dist/ /usr/local/ \
    && rm -rf /home/tiledb/TileDB-VCF-${version}

ENTRYPOINT ["/bin/bash"]
