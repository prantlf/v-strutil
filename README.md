# strutil

String and character lookup and manipulation utilities. What you're missing in the `string` type.

## Installation

You can install this package either from [VPM] or from GitHub:

```txt
v install prantlf.strutil
v install --git https://github.com/prantlf/v-strutil
```

## API

Some methods support arguments `start` and `end`, so that the operation can take place only on the middle part of the string to avoid creating a new string with the section to run the operation on. If the argument `end` is `-1`, the length of the input string will be used instead.

    is_space(s string) bool
    is_whitespace(s string) bool

    skip_space(s string) int
    skip_space_within(s string, start int, end int) int
    skip_space_within_nochk(s string, start int, end int) int
    skip_whitespace(s string) int
    skip_whitespace_within(s string, start int, end int) int
    skip_whitespace_within_nochk(s string, start int, end int) int
    skip_trailing_space(s string) int
    skip_trailing_space_within(s string, start int, end int) int
    skip_trailing_space_within_nochk(s string, start int, end int) int
    skip_trailing_whitespace(s string) int
    skip_trailing_whitespace_within(s string, start int, end int) int
    skip_trailing_whitespace_within_nochk(s string, start int, end int) int

    avoid_space(s string) (int, int)
    avoid_space_within(s string, start int, end int) (int, int)
    avoid_space_within_nochk(s string, start int, end int) (int, int)
    avoid_whitespace(s string) (int, int)
    avoid_whitespace_within(s string, start int, end int) (int, int)
    avoid_whitespace_within_nochk(s string, start int, end int) (int, int)

    contains_u8_within(s string, p string, start int) bool
    contains_u8_within_nochk(s string, p string, start int) bool
    contains_within(s string, p string, start int) bool
    contains_within_nochk(s string, p string, start int) bool
    starts_with_within(s string, p string, start int) bool
    starts_with_within_nochk(s string, p string, start int) bool
    ends_with_within(s string, p string, start int) bool
    ends_with_within_nochk(s string, p string, start int) bool

    index_u8_within(s string, c u8, start int, end int) int
    index_u8_within_nochk(s string, c u8, start int, end int) int
    last_index_u8_within(s string, c u8, start int, end int) int
    last_index_u8_within_nochk(s string, c u8, start int, end int) int
    index_within(s string, p string, start int, end int) int
    index_within_nochk(s string, p string, start int, end int) int
    last_index_within(s string, p string, start int, end int) int
    last_index_within_nochk(s string, p string, start int, end int) int

    compare_str_within(l string, r string, start_r int, end_r int) int
    compare_str2_within(l string, start_l int, end_l int, r string, start_r int, end_r int) int
    compare_str_within_nochk(l string, r string, start_r int, end_r int) int
    compare_str2_within_nochk(l string, start_l int, end_l int, r string, start_r int, end_r int) int

    first_line(s string) string
    first_line_not_empty(s string) string
    last_line(s string) string
    last_line_not_empty(s string) string
    nth_line(s string) ?string
    nth_line_not_empty(s string) ?string
    last_nth_line(s string) ?string
    last_nth_line_not_empty(s string) ?string

    replace_u8(s string, rep u8, with u8) string

    check_bounds_incl(s string, start int, end int) int
    check_bounds_excl(s string, start int, end int) int
    check_bounds_strict(s string, start int, end int) !int

    str_len(s &u8, end int) int
    str_len_nochk(s &u8, end int) int

    str_without_whitespace(mut b strings.Builder) string
    str_without_leading_whitespace(mut b strings.Builder) string
    str_without_trailing_whitespace(mut b strings.Builder) string

## Contributing

In lieu of a formal styleguide, take care to maintain the existing coding style. Lint and test your code.

## License

Copyright (c) 2023 Ferdinand Prantl

Licensed under the MIT license.

[VPM]: https://vpm.vlang.io/packages/prantlf.strutil
[abstractions]: #abstractions
