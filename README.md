# Infrataster Docker Image [![Docker Repository on Quay.io](https://quay.io/repository/wantedly/infrataster/status "Docker Repository on Quay.io")](https://quay.io/repository/wantedly/infrataster)
Docker Image for [Infrataster](https://github.com/ryotarai/infrataster).
Please see [official one's README](https://github.com/ryotarai/infrataster/) for more information about Infrataster.

## SUPPORTED TAGS

* `latest`
 * Ruby 2.1.5
 * Infrataster v0.3.0

## HOW TO USE

```bash
# Get the docker image
$ docker pull quay.io/wantedly/infrataster

# Prepare feature spec files
$ ls spec
nginx_image_server_spec.rb spec_helper.rb

# Run feature tests
$ docker run \
    -v $PWD/spec:/test/spec
    -e "TARGET_IP=192.168.111.222"
    quay.io/wantedly/infrataster
```

## LICENSE
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)
