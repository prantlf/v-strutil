module strutil

[direct_array_access]
pub fn skip_space(s string, start int, stop int) int {
	if start < 0 || start >= s.len {
		return 0
	}
	end := if stop < 0 {
		s.len
	} else {
		if stop > s.len || stop <= start {
			return -1
		}
		stop
	}
	return unsafe { skip_space_nochk(s, start, end) }
}

[direct_array_access; unsafe]
pub fn skip_space_nochk(s string, start int, end int) int {
	for i := start; i < end; i++ {
		if s[i] != ` ` {
			return i
		}
	}
	return end
}

[direct_array_access]
pub fn skip_whitespace(s string, start int, stop int) int {
	if start < 0 || start >= s.len {
		return 0
	}
	end := if stop < 0 {
		s.len
	} else {
		if stop > s.len || stop <= start {
			return -1
		}
		stop
	}
	return unsafe { skip_whitespace_nochk(s, start, end) }
}

[direct_array_access; unsafe]
pub fn skip_whitespace_nochk(s string, start int, end int) int {
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

[direct_array_access]
pub fn skip_trailing_space(s string, start int, stop int) int {
	if start < 0 || start >= s.len {
		return stop
	}
	end := if stop < 0 {
		s.len
	} else {
		if stop > s.len || stop <= start {
			return -1
		}
		stop
	}
	return unsafe { skip_trailing_space_nochk(s, start, end) }
}

[direct_array_access; unsafe]
pub fn skip_trailing_space_nochk(s string, start int, end int) int {
	mut i := end
	for i > start {
		i--
		if s[i] != ` ` {
			return i + 1
		}
	}
	return start
}

[direct_array_access]
pub fn skip_trailing_whitespace(s string, start int, stop int) int {
	if start < 0 || start >= s.len {
		return stop
	}
	end := if stop < 0 {
		s.len
	} else {
		if stop > s.len || stop <= start {
			return -1
		}
		stop
	}
	return unsafe { skip_trailing_whitespace_nochk(s, start, end) }
}

[direct_array_access; unsafe]
pub fn skip_trailing_whitespace_nochk(s string, start int, end int) int {
	mut i := end
	for i > start {
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
