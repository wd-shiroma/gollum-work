# Gollum working directory

This is working directory template for [gollum wiki](https://github.com/gollum/gollum).

## directories summery

- `repos`  
wiki repository (make directory yourself)
- `util`  
custom js/css building utility (require node.js and yarn)
- `dist`  
configuration file example
- `mastodon`  
scripts used by omniauth-mastodon

## usage

First of all, clone this repository.

```shell
$ git clone https://github.com/wd-shiroma/gollum-work.git
$ cd gollum-work
```

Create wiki repository

```shell
$ mkdir repos
$ cd repos
$ git init
```

If you use omnigollum, you will need to install the gem module.

```shell
$ git clone https://github.com/arr2036/omnigollum.git
$ cd omnigollum
$ gem build omnigollum.gemspec
$ gem install omnigollum-*.gem
```

More detail, check the official repository's Readme.md.  
[omnigollum/Readme.md at master · arr2036/omnigollum](https://github.com/arr2036/omnigollum/blob/master/Readme.md)

If you use omniauth-mastodon, check `dist/omniauth-config.rb` and initialize with `mastodon/create_db.sh`

If you want to customize with SCSS stylesheets and javascript over ES2015, you can use my prepared the building utility.  
Usage is [here](https://github.com/wd-shiroma/gollum-work/blob/master/util/README.md).

