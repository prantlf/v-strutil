module strutil

pub fn contains_u8_within(s string, c u8, start int, end int) bool {
	stop := check_bounds_incl(s, start, end)
	if stop < 0 {
		return false
	}
	return unsafe { contains_u8_within_nochk(s, c, start, stop) }
}

@[direct_array_access; unsafe]
pub fn contains_u8_within_nochk(s string, c u8, start int, end int) bool {
	for i := start; i < end; i++ {
		if s[i] == c {
			return true
		}
	}
	return false
}

@[inline]
pub fn count_u8(s string, c u8) int {
	return unsafe { count_u8_within_nochk(s, c, 0, s.len) }
}

pub fn count_u8_within(s string, c u8, start int, end int) int {
	stop := check_bounds_incl(s, start, end)
	if stop < 0 {
		return 0
	}
	return unsafe { count_u8_within_nochk(s, c, start, stop) }
}

@[direct_array_access; unsafe]
pub fn count_u8_within_nochk(s string, c u8, start int, end int) int {
	mut count := 0
	for i := start; i < end; i++ {
		if s[i] == c {
			count++
		}
	}
	return count
}

pub fn contains_within(s string, p string, start int, end int) bool {
	stop := check_bounds_incl(s, start, end)
	if stop < 0 {
		return false
	}
	return unsafe { contains_within_nochk(s, p, start, stop) }
}

@[direct_array_access; unsafe; inline]
pub fn contains_within_nochk(s string, p string, start int, end int) bool {
	return unsafe { index_within_nochk(s, p, start, end) >= 0 }
}

@[inline]
pub fn count(s string, p string) int {
	return unsafe { count_within_nochk(s, p, 0, s.len) }
}

pub fn count_within(s string, p string, start int, end int) int {
	stop := check_bounds_incl(s, start, end)
	if stop < 0 {
		return 0
	}
	return unsafe { count_within_nochk(s, p, start, stop) }
}

@[direct_array_access; unsafe]
pub fn count_within_nochk(s string, p string, start int, end int) int {
	mut count := 0
	skip := p.len
	for from := start; from < end; from += skip {
		from = unsafe { index_within_nochk(s, p, from, end) }
		if from < 0 {
			return count
		}
		count++
	}
	return count
}

pub fn starts_with_within(s string, p string, start int, end int) bool {
	stop := check_bounds_incl(s, start, end)
	if stop < 0 {
		return false
	}
	return unsafe { starts_with_within_nochk(s, p, start, stop) }
}

@[direct_array_access; unsafe]
pub fn starts_with_within_nochk(s string, p string, start int, end int) bool {
	if p.len > end - start || p.len == 0 {
		return false
	}
	cur := unsafe { s.str + start }
	for c in p {
		if unsafe { *cur != c } {
			return false
		}
		unsafe { cur++ }
	}
	return true
}

pub fn ends_with_within(s string, p string, start int, end int) bool {
	stop := check_bounds_incl(s, start, end)
	if stop < 0 {
		return false
	}
	return unsafe { ends_with_within_nochk(s, p, start, stop) }
}

@[direct_array_access; unsafe]
pub fn ends_with_within_nochk(s string, p string, start int, end int) bool {
	if p.len > end - start || p.len == 0 {
		return false
	}
	cur := unsafe { s.str + end - p.len }
	for c in p {
		if unsafe { *cur != c } {
			return false
		}
		unsafe { cur++ }
	}
	return true
}

pub fn index_u8_within(s string, c u8, start int, end int) int {
	stop := check_bounds_incl(s, start, end)
	if stop < 0 {
		return -1
	}
	return unsafe { index_u8_within_nochk(s, c, start, stop) }
}

@[direct_array_access; unsafe]
pub fn index_u8_within_nochk(s string, c u8, start int, end int) int {
	for i := start; i < end; i++ {
		if s[i] == c {
			return i
		}
	}
	return -1
}

pub fn last_index_u8_within(s string, c u8, start int, end int) int {
	stop := check_bounds_incl(s, start, end)
	if stop < 0 {
		return -1
	}
	return unsafe { last_index_u8_within_nochk(s, c, start, stop) }
}

@[direct_array_access; unsafe]
pub fn last_index_u8_within_nochk(s string, c u8, start int, end int) int {
	for i := end; i > start; {
		i--
		if s[i] == c {
			return i
		}
	}
	return -1
}

@[inline]
pub fn index(s string, p string) int {
	return index_within(s, p, 0, -1)
}

pub fn index_within(s string, p string, start int, end int) int {
	stop := check_bounds_incl(s, start, end)
	if stop < 0 {
		return -1
	}
	return unsafe { index_within_nochk(s, p, start, stop) }
}

@[direct_array_access; unsafe]
pub fn index_within_nochk(s string, p string, start int, end int) int {
	if p.len > end - start || p.len == 0 {
		return -1
	}
	for i := start; i < end; {
		mut j := 0
		for j < p.len && s[i + j] == p[j] {
			j++
		}
		if j == p.len {
			return i
		}
		i++
	}
	return -1
}

@[inline]
pub fn last_index(s string, p string) int {
	return last_index_within(s, p, 0, -1)
}

pub fn last_index_within(s string, p string, start int, end int) int {
	stop := check_bounds_incl(s, start, end)
	if stop < 0 {
		return -1
	}
	return unsafe { last_index_within_nochk(s, p, start, stop) }
}

@[direct_array_access; unsafe]
pub fn last_index_within_nochk(s string, p string, start int, end int) int {
	if p.len > end - start || p.len == 0 {
		return -1
	}
	for i := s.len - p.len; i >= 0; {
		mut j := 0
		for j < p.len && s[i + j] == p[j] {
			j++
		}
		if j == p.len {
			return i
		}
		i--
	}
	return -1
}

pub fn index_of_eoln_within(s string, start int, end int) int {
	stop := check_bounds_incl(s, start, end)
	if stop < 0 {
		return -1
	}
	return unsafe { index_of_eoln_within_nochk(s, start, stop) }
}

@[direct_array_access; unsafe]
pub fn index_of_eoln_within_nochk(s string, start int, end int) int {
	for i := start; i < end; i++ {
		c := s[i]
		if c == `\r` || c == `\n` {
			return i
		}
	}
	return -1
}

pub fn last_index_of_eoln_within(s string, start int, end int) int {
	stop := check_bounds_incl(s, start, end)
	if stop < 0 {
		return -1
	}
	return unsafe { last_index_of_eoln_within_nochk(s, start, stop) }
}

@[direct_array_access; unsafe]
pub fn last_index_of_eoln_within_nochk(s string, start int, end int) int {
	for i := end; i > start; {
		i--
		c := s[i]
		if c == `\r` || c == `\n` {
			return i
		}
	}
	return -1
}

pub fn index_after_eoln_within(s string, start int, end int) int {
	stop := check_bounds_incl(s, start, end)
	if stop < 0 {
		return -1
	}
	return unsafe { index_after_eoln_within_nochk(s, start, stop) }
}

@[direct_array_access; unsafe]
pub fn index_after_eoln_within_nochk(s string, start int, end int) int {
	for i := start; i < end; i++ {
		if s[i] == `\n` {
			return if i < end {
				i + 1
			} else {
				-1
			}
		}
	}
	return -1
}

pub fn last_index_after_eoln_within(s string, start int, end int) int {
	stop := check_bounds_incl(s, start, end)
	if stop < 0 {
		return -1
	}
	return unsafe { last_index_after_eoln_within_nochk(s, start, stop) }
}

@[direct_array_access; unsafe]
pub fn last_index_after_eoln_within_nochk(s string, start int, end int) int {
	for i := end; i > start; {
		i--
		if s[i] == `\n` {
			return if i < end {
				i + 1
			} else {
				-1
			}
		}
	}
	return -1
}
