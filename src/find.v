module strutil

[direct_array_access]
pub fn contains_at(s string, p string, start int) bool {
	if start < 0 || p.len > s.len - start {
		return false
	}
	return unsafe { contains_at_nochk(s, p, start) }
}

[direct_array_access; unsafe]
pub fn contains_at_nochk(s string, p string, start int) bool {
	cur := unsafe { s.str + start }
	for c in p {
		if unsafe { *cur != c } {
			return false
		}
		unsafe { cur++ }
	}
	return true
}

[direct_array_access]
pub fn index_u8_within(s string, c u8, start int, stop int) int {
	if start < 0 || start >= s.len {
		return -1
	}
	end := if stop < 0 {
		s.len
	} else {
		if stop > s.len || stop <= start {
			return -1
		}
		stop
	}
	return unsafe { index_u8_within_nochk(s, c, start, end) }
}

[direct_array_access; unsafe]
pub fn index_u8_within_nochk(s string, c u8, start int, end int) int {
	for i := start; i < end; i++ {
		if s[i] == c {
			return i
		}
	}
	return -1
}

[direct_array_access]
pub fn last_index_u8_within(s string, c u8, start int, stop int) int {
	if start < 0 || start >= s.len {
		return -1
	}
	end := if stop < 0 {
		s.len
	} else {
		if stop > s.len || stop <= start {
			return -1
		}
		stop
	}
	return unsafe { last_index_u8_within_nochk(s, c, start, end) }
}

[direct_array_access; unsafe]
pub fn last_index_u8_within_nochk(s string, c u8, start int, end int) int {
	mut i := end
	for i > start {
		i--
		if s[i] == c {
			return i
		}
	}
	return -1
}
