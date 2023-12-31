# Changes

## [0.11.1](https://github.com/prantlf/v-strutil/compare/v0.11.0...v0.11.1) (2024-01-01)

### Bug Fixes

* Remove unneded checks from index and last_index ([0cf1fd0](https://github.com/prantlf/v-strutil/commit/0cf1fd0c1900cc8b17019be0b78d0e46ce6c998d))

## [0.11.0](https://github.com/prantlf/v-strutil/compare/v0.10.0...v0.11.0) (2023-12-29)

### Features

* Add functions index and last_index ([a9e0927](https://github.com/prantlf/v-strutil/commit/a9e09278926d1c280f696887e9e6bc783743e672))

### Bug Fixes

* Make contains_within_nochk inline ([d59391f](https://github.com/prantlf/v-strutil/commit/d59391fe759358c7a09b494e9165dbfe46ae37a9))

## [0.10.0](https://github.com/prantlf/v-strutil/compare/v0.9.1...v0.10.0) (2023-12-16)

### Features

* Add functions count and count_u8 ([97b7aa7](https://github.com/prantlf/v-strutil/commit/97b7aa7fd02d6937f2bccd59a2430622b712eef6))

## [0.9.1](https://github.com/prantlf/v-strutil/compare/v0.9.0...v0.9.1) (2023-12-11)

### Bug Fixes

* Adapt for V langage changes ([7153d05](https://github.com/prantlf/v-strutil/commit/7153d05b42fe88cd5c1081e79f391be7a8f79520))

## [0.9.0](https://github.com/prantlf/v-strutil/compare/v0.8.0...v0.9.0) (2023-09-11)

### Features

* Add lookups for eoln and right after it ([7c8ca69](https://github.com/prantlf/v-strutil/commit/7c8ca69f0327c5afbac7b5529ecee15f0a7d6a15))

### BREAKING CHANGES

Carriage return cannot be used alone as a line break any more.
It has to be always followed by a line feed. Let us see is this change survives.

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
