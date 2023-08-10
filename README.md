# strutil

String and character lookup and manipulation utilities. What you're missing in the `string` type.

## Installation

You can install this package either from [VPM] or from GitHub:

```txt
v install prantlf.strutil
v install --git https://github.com/prantlf/v-strutil
```

## API

Some methods support arguments `start` and `stop`, so that the operation can take place only on the middle part of the string to avoid creating a new string with the section to run the operation on. If the argument `stop` is `-1`, the length of the input string will be used instead.

    is_space(s string) bool
    is_whitespace(s string) bool

    first_line(s string) string
    first_line_not_empty(s string) string
    last_line(s string) string
    last_line_not_empty(s string) string

    skip_space(s string, start int, stop int) int
    skip_space_nochk(s string, start int, end int) int
    skip_whitespace(s string, start int, stop int) int
    skip_whitespace_nochk(s string, start int, end int) int
    skip_trailing_space(s string, start int, stop int) int
    skip_trailing_space_nochk(s string, start int, end int) int
    skip_trailing_whitespace(s string, start int, stop int) int
    skip_trailing_whitespace_nochk(s string, start int, end int) int

    contains_at(s string, p string, start int) bool
    contains_at_nochk(s string, p string, start int) bool

    index_u8_within(s string, c u8, start int, stop int) int
    index_u8_within_nochk(s string, c u8, start int, end int) int
    last_index_u8_within(s string, c u8, start int, stop int) int
    last_index_u8_within_nochk(s string, c u8, start int, end int) int

    replace_u8(s string, rep u8, with u8) string

## Contributing

In lieu of a formal styleguide, take care to maintain the existing coding style. Lint and test your code.

## License

Copyright (c) 2023 Ferdinand Prantl

Licensed under the MIT license.

[VPM]: https://vpm.vlang.io/packages/prantlf.strutil
[abstractions]: #abstractions
