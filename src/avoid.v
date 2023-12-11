module strutil

@[inline]
pub fn avoid_space(s string) (int, int) {
	unsafe {
		return avoid_space_within_nochk(s, 0, s.len)
	}
}

pub fn avoid_space_within(s string, start int, end int) (int, int) {
	stop := check_bounds_excl(s, start, end)
	if stop < 0 {
		return 0, stop
	}
	if start == end {
		return start, end
	}
	unsafe {
		return avoid_space_within_nochk(s, start, stop)
	}
}

@[direct_array_access; unsafe]
pub fn avoid_space_within_nochk(s string, start int, end int) (int, int) {
	from := unsafe { skip_space_within_nochk(s, start, end) }
	to := unsafe { skip_trailing_space_within_nochk(s, from, end) }
	return from, to
}

@[inline]
pub fn avoid_whitespace(s string) (int, int) {
	unsafe {
		return avoid_whitespace_within_nochk(s, 0, s.len)
	}
}

pub fn avoid_whitespace_within(s string, start int, end int) (int, int) {
	stop := check_bounds_excl(s, start, end)
	if stop < 0 {
		return start, stop
	}
	if start == end {
		return start, end
	}
	unsafe {
		return avoid_whitespace_within_nochk(s, start, stop)
	}
}

@[direct_array_access; unsafe]
pub fn avoid_whitespace_within_nochk(s string, start int, end int) (int, int) {
	from := unsafe { skip_whitespace_within_nochk(s, start, end) }
	to := unsafe { skip_trailing_whitespace_within_nochk(s, from, end) }
	return from, to
}
