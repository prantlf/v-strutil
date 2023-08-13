module strutil

[inline]
pub fn skip_space(s string) int {
	return unsafe { skip_space_within_nochk(s, 0, s.len) }
}

pub fn skip_space_within(s string, start int, end int) int {
	stop := check_bounds_incl(s, start, end)
	if stop < 0 {
		return start
	}
	return unsafe { skip_space_within_nochk(s, start, stop) }
}

[direct_array_access; unsafe]
pub fn skip_space_within_nochk(s string, start int, end int) int {
	for i := start; i < end; i++ {
		if s[i] != ` ` {
			return i
		}
	}
	return end
}

[inline]
pub fn skip_whitespace(s string) int {
	return unsafe { skip_whitespace_within_nochk(s, 0, s.len) }
}

pub fn skip_whitespace_within(s string, start int, end int) int {
	stop := check_bounds_incl(s, start, end)
	if stop < 0 {
		return start
	}
	return unsafe { skip_whitespace_within_nochk(s, start, stop) }
}

[direct_array_access; unsafe]
pub fn skip_whitespace_within_nochk(s string, start int, end int) int {
	for i := start; i < end; i++ {
		match s[i] {
			` `, `\t`, `\r`, `\n` {}
			else {
				return i
			}
		}
	}
	return end
}

[inline]
pub fn skip_trailing_space(s string) int {
	return unsafe { skip_trailing_space_within_nochk(s, 0, s.len) }
}

pub fn skip_trailing_space_within(s string, start int, end int) int {
	stop := check_bounds_incl(s, start, end)
	if stop < 0 {
		return stop
	}
	return unsafe { skip_trailing_space_within_nochk(s, start, stop) }
}

[direct_array_access; unsafe]
pub fn skip_trailing_space_within_nochk(s string, start int, end int) int {
	for i := end; i > start; {
		i--
		if s[i] != ` ` {
			return i + 1
		}
	}
	return start
}

[inline]
pub fn skip_trailing_whitespace(s string, start int, end int) int {
	return unsafe { skip_trailing_whitespace_within_nochk(s, 0, s.len) }
}

pub fn skip_trailing_whitespace_within(s string, start int, end int) int {
	stop := check_bounds_incl(s, start, end)
	if stop < 0 {
		return stop
	}
	return unsafe { skip_trailing_whitespace_within_nochk(s, start, stop) }
}

[direct_array_access; unsafe]
pub fn skip_trailing_whitespace_within_nochk(s string, start int, end int) int {
	for i := end; i > start; {
		i--
		match s[i] {
			` `, `\t`, `\r`, `\n` {}
			else {
				return i + 1
			}
		}
	}
	return start
}
