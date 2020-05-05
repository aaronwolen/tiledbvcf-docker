# TileDB-VCF Docker Image

This image builds the main TileDB-VCF library, CLI tool, and Python module.

```bash
docker build -f Dockerfile -t tiledbvcf .
```

Run the command-line tool:

```
docker run -it --rm --entrypoint tiledbvcf tiledbvcf:latest
```
