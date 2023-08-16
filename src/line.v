module strutil

[inline]
pub fn first_line(s string) string {
	return first_line_impl(s, 0)
}

pub fn first_line_not_empty(s string) string {
	start := unsafe { skip_whitespace_within_nochk(s, 0, s.len) }
	return first_line_impl(s, start)
}

[direct_array_access]
fn first_line_impl(s string, start int) string {
	if start == s.len {
		return ''
	}
	cr := unsafe { index_u8_within_nochk(s, `\r`, start, s.len) }
	lf := unsafe { index_u8_within_nochk(s, `\n`, start, s.len) }
	eoln := if (cr >= 0 && cr < lf) || lf < 0 {
		cr
	} else {
		lf
	}
	return if eoln >= 0 {
		s[start..eoln]
	} else if start > 0 {
		s[start..]
	} else {
		s
	}
}

[inline]
pub fn last_line(s string) string {
	return last_line_impl(s, s.len)
}

pub fn last_line_not_empty(s string) string {
	end := unsafe { skip_trailing_whitespace_within_nochk(s, 0, s.len) }
	return last_line_impl(s, end)
}

[direct_array_access]
pub fn last_line_impl(s string, end int) string {
	if end == 0 {
		return ''
	}
	cr := unsafe { last_index_u8_within_nochk(s, `\r`, 0, end) }
	lf := unsafe { last_index_u8_within_nochk(s, `\n`, 0, end) }
	eoln := if cr > lf || lf < 0 {
		cr
	} else {
		lf
	}
	return if eoln >= 0 {
		s[eoln + 1..end]
	} else if end < s.len {
		s[..end]
	} else {
		s
	}
}

[direct_array_access]
pub fn nth_line(s string, n int) ?string {
	mut start := 0
	for counter := n; counter >= 0; counter-- {
		cr := unsafe { index_u8_within_nochk(s, `\r`, start, s.len) }
		lf := unsafe { index_u8_within_nochk(s, `\n`, start, s.len) }
		if counter == 0 {
			eoln := if (cr >= 0 && cr < lf) || lf < 0 {
				cr
			} else {
				lf
			}
			return if eoln >= 0 {
				s[start..eoln]
			} else if start > 0 {
				s[start..]
			} else {
				s
			}
		}
		start = if (cr >= 0 && cr > lf) || lf < 0 {
			cr
		} else {
			lf
		} + 1
		if start == 0 || start == s.len {
			break
		}
	}
	return none
}

[direct_array_access]
pub fn nth_line_not_empty(s string, n int) ?string {
	mut start := 0
	for counter := n; counter >= 0; counter-- {
		start = unsafe { skip_whitespace_within_nochk(s, start, s.len) }
		if start == s.len {
			return if counter == 0 {
				''
			} else {
				none
			}
		}
		cr := unsafe { index_u8_within_nochk(s, `\r`, start, s.len) }
		lf := unsafe { index_u8_within_nochk(s, `\n`, start, s.len) }
		if counter == 0 {
			eoln := if (cr >= 0 && cr < lf) || lf < 0 {
				cr
			} else {
				lf
			}
			return if eoln >= 0 {
				s[start..eoln]
			} else if start > 0 {
				s[start..]
			} else {
				s
			}
		}
		start = if (cr >= 0 && cr > lf) || lf < 0 {
			cr
		} else {
			lf
		} + 1
		if start == 0 || start == s.len {
			break
		}
	}
	return none
}
