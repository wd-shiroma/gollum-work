# Gollum custom js/css build utility

## features

- javascript: build and minify from ECMA2015 and later.
- css: build and minify from SCSS.
- bundle twemoji parser.

## requirements

- node.js (latest)
- yarn (latest)

## usage

You need to clone this repository in the same directory as your wiki repository.

```
$ ls .
repos/ # <-(example) your wiki repository
$ git clone https://github.com/wd-shiroma/gollum-customizing-util.git
$ cd gollum-customizing-util
```

If your wiki repository is not `repos` directory, you should edit `gulpfile.js`.

```
$ vim gulpfile.js
```

Build utility.

```
$ yarn install
```

This util will watch `./style` and `./javascript` directories.

```
$ yarn run watch
```

Edit `./style/*.scss` and `./javascript/*.js`. And when save the edited script, this util will build the minifid scripts at your wiki directory.

