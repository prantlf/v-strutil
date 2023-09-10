# Changes

## [0.8.0](https://github.com/prantlf/v-strutil/compare/v0.7.0...v0.8.0) (2023-09-10)

### Features

* Add functions cutting lines from start and end ([1c7227f](https://github.com/prantlf/v-strutil/commit/1c7227f76f3b13a874daef1a517b91bf7a1295c5))

## [0.7.0](https://github.com/prantlf/v-strutil/compare/v0.6.0...v0.7.0) (2023-08-18)

### Features

* Add str_within  optimising the string extraction from Builder ([7c35b74](https://github.com/prantlf/v-strutil/commit/7c35b742fef7abefcbaa92a9588981c2a7adb7fd))

## [0.6.0](https://github.com/prantlf/v-strutil/compare/v0.5.0...v0.6.0) (2023-08-18)

### Features

* Add str_without_whitespace optimising the string extraction from Builder ([2fe4dfd](https://github.com/prantlf/v-strutil/commit/2fe4dfdb50005449469632f3dde3acc1161cddcb))

## [0.5.0](https://github.com/prantlf/v-strutil/compare/v0.4.0...v0.5.0) (2023-08-18)

### Bug Fixes

* Remove start and end arguments from skip_trailing_whitespace ([7d17338](https://github.com/prantlf/v-strutil/commit/7d1733869c244786b9313fdd234465961946dba8))

### BREAKING CHANGES

The start and end arguments were added to skip_trailing_whitespace
by an accident. They remain in skip_trailing_whitespace_within, like in other functions.

## [0.4.0](https://github.com/prantlf/v-strutil/compare/v0.3.0...v0.4.0) (2023-08-17)

### Features

* Add nth_line to get a line at an index ([2fd37fc](https://github.com/prantlf/v-strutil/commit/2fd37fcd9441c707d6769155a653c32c51ee6232))
* Add last_nth_line to walk the lines from the end ([8004bb6](https://github.com/prantlf/v-strutil/commit/8004bb605105608cf6191202e92a72af2c878c95))

## [0.3.0](https://github.com/prantlf/v-strutil/compare/v0.2.0...v0.3.0) (2023-08-16)

### Features

* Add actual string length computation ([f5ef9b7](https://github.com/prantlf/v-strutil/commit/f5ef9b7bd724deed047f0df4eda135009a248810))

## [0.2.0](https://github.com/prantlf/v-strutil/compare/v0.1.0...v0.2.0) (2023-08-14)

### Features

* Add comparison functions ([449a620](https://github.com/prantlf/v-strutil/commit/449a620b4cf3e2f41295e7101405bd12016054a0))

## [0.1.0](https://github.com/prantlf/v-strutil/compare/v0.0.1...v0.1.0) (2023-08-13)

### Features

* Add new bound check, lookup and space avoid functions, rename contains_at ([cb05f81](https://github.com/prantlf/v-strutil/commit/cb05f810820e99757f83b819a2b4d53c7f1ecd95))

### BREAKING CHANGES

Rename occurrences of `contains_at` to `contains_within`.
A reluctant, annoying change. Make the API consistent.

## 0.0.1 (2023-08-10)

Initial release.
