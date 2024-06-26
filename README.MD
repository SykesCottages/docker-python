# Sykes Cottages Python Docker Images

## About

We use a variety of Python containers at Sykes Cottages across our platforms, but due to a lot of bespoke requirements in our applications using the official Python images typically required a monalithic Dockerfile to support the application.
All of our Python images are based off the [Base Sykes](https://github.com/SykesCottages/docker-base) image which uses the official Ubuntu Docker image.
We opted for this path to utilise aptitude so we could manage packages easier and utilise the package integrity verification that comes with apititude.

## Architecture Support

All our images have support for:
- `linux/amd64`
- `linux/arm64/v8`

Obtaining platform specific architectures:

```shell
docker pull --platform=<ARCHITECTURE> sykescottages/python:<VERSION>
```

Testing you have the right architecture:

```shell
docker run -it --platform=<ARCHITECTURE> sykescottages/python:<VERSION> arch
```

## Supported versions and available tags

- 2.7.18 (Deprecated) - `sykescottages/python:2.7`
- 3.6.15 (Deprecated) - `sykescottages/python:3.6`
- 3.7.17 (Deprecated) - `sykescottages/python:3.7`
- **3.8.19 (LTS EOL 2024-10-01)** - `sykescottages/python:3.8`
- **3.9.19 (LTS EOL 2025-10-01)** - `sykescottages/python:3.9`
- **3.10.14 (LTS EOL 2026-10-01)** - `sykescottages/python:3.10`
- **3.11.9 (LTS EOL 2027-10-01)** - `sykescottages/python:3.11`
- **3.12.4 (LTS EOL 2028-10-01)** - `sykescottages/python:3.12`

## Image Itinerary

For better visibility of packages there is now an included aptitude itinerary with each tag, this is located in the corresponding folder to the tag.
This will give better clarity on package version changes and be reflected in the git history.

## Usage

Pulling an image:
```
docker pull sykescottages/python:version
```

Running a container:
```
docker run -i -t sykescottages/python:version
```

Building from this image simply reference it as part of your Dockerfile:

```
FROM sykescottages/python:version

# ... Your configuration
```

## Testing

All testing is done in the form of a SUT containers which is run by the Docker Hub (see [Automated repository tests](https://docs.docker.com/docker-hub/builds/automated-testing/) for more information) and runs a variety of shell scripts.

## Supported Modules

Our standard installations only include the default modules based off the supported installed libraries.

### Excluded modules

Due to missing non-essential dependencies we exclude the following:

```shell
_bsddb             _curses            _curses_panel   
_sqlite3           _tkinter           bsddb185        
dbm                dl                 gdbm
imageop            readline           sunaudiodev                                           
```

If you do require any of the above you will need to rebuild python with the dependencies installed.

## Contributions

Contributions are welcome, but please adhere to the [CONTRIBUTION.MD](https://github.com/SykesCottages/docker-python/blob/master/CONTRIBUTION.MD). Also, if you could ensure that there are tests with every modification of the Dockerfiles to verify that your changes work.