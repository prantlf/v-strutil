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
	eoln := unsafe { index_of_eoln_within_nochk(s, start, s.len) }
	return if eoln >= 0 {
		s[start..eoln]
	} else if start > 0 {
		s[start..]
	} else {
		s
	}
}

[inline]
pub fn from_second_line(s string) string {
	return from_second_line_impl(s, 0, false)
}

pub fn from_second_line_not_empty(s string) string {
	start := unsafe { skip_whitespace_within_nochk(s, 0, s.len) }
	return from_second_line_impl(s, start, true)
}

[direct_array_access]
fn from_second_line_impl(s string, start int, not_empty bool) string {
	if start == s.len {
		return ''
	}
	mut eoln := unsafe { index_after_eoln_within_nochk(s, start, s.len) }
	if not_empty && eoln >= 0 {
		eoln = unsafe { skip_whitespace_within_nochk(s, eoln, s.len) }
	}
	return if eoln >= 0 {
		s[eoln..]
	} else {
		''
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
fn last_line_impl(s string, end int) string {
	if end == 0 {
		return ''
	}
	eoln := unsafe { last_index_after_eoln_within_nochk(s, 0, end) }
	return if eoln >= 0 {
		s[eoln..end]
	} else if end < s.len {
		s[..end]
	} else {
		s
	}
}

[inline]
pub fn until_one_but_last_line(s string) string {
	return until_one_but_last_line_impl(s, s.len, false)
}

pub fn until_one_but_last_line_not_empty(s string) string {
	end := unsafe { skip_trailing_whitespace_within_nochk(s, 0, s.len) }
	return until_one_but_last_line_impl(s, end, true)
}

[direct_array_access]
fn until_one_but_last_line_impl(s string, end int, not_empty bool) string {
	if end == 0 {
		return ''
	}
	mut eoln := unsafe { last_index_of_eoln_within_nochk(s, 0, end) }
	if not_empty && eoln > 0 {
		eoln = unsafe { skip_trailing_whitespace_within_nochk(s, 0, eoln) }
	}
	return if eoln >= 0 {
		s[..eoln]
	} else {
		''
	}
}

[direct_array_access]
pub fn nth_line(s string, n int) ?string {
	mut start := 0
	for counter := n; counter >= 0; counter-- {
		if counter == 0 {
			eoln := unsafe { index_of_eoln_within_nochk(s, start, s.len) }
			return if eoln >= 0 {
				s[start..eoln]
			} else if start > 0 {
				s[start..]
			} else {
				s
			}
		}
		start = unsafe { index_after_eoln_within_nochk(s, start, s.len) }
		if start <= 0 || start == s.len {
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
		if counter == 0 {
			eoln := unsafe { index_of_eoln_within_nochk(s, start, s.len) }
			return if eoln >= 0 {
				s[start..eoln]
			} else if start > 0 {
				s[start..]
			} else {
				s
			}
		}
		start = unsafe { index_after_eoln_within_nochk(s, start, s.len) }
		if start <= 0 || start == s.len {
			break
		}
	}
	return none
}

[direct_array_access]
pub fn from_nth_line(s string, n int) string {
	mut start := 0
	for counter := n; counter >= 0; counter-- {
		if counter == 0 {
			return if start < s.len {
				s[start..]
			} else {
				''
			}
		}
		start = unsafe { index_after_eoln_within_nochk(s, start, s.len) }
		if start == 0 || start == s.len {
			break
		}
	}
	return ''
}

[direct_array_access]
pub fn from_nth_line_not_empty(s string, n int) string {
	mut start := 0
	for counter := n; counter >= 0; counter-- {
		start = unsafe { skip_whitespace_within_nochk(s, start, s.len) }
		if start == s.len {
			break
		}
		if counter == 0 {
			return if start < s.len {
				s[start..]
			} else {
				''
			}
		}
		start = unsafe { index_after_eoln_within_nochk(s, start, s.len) }
		if start == 0 || start == s.len {
			break
		}
	}
	return ''
}

[direct_array_access]
pub fn last_nth_line(s string, n int) ?string {
	mut end := s.len
	for counter := n; counter >= 0; counter-- {
		if counter == 0 {
			eoln := unsafe { last_index_after_eoln_within_nochk(s, 0, end) }
			return if eoln >= 0 {
				s[eoln..end]
			} else if end < s.len {
				s[..end]
			} else {
				s
			}
		}
		end = unsafe { last_index_of_eoln_within_nochk(s, 0, end) }
		if end < 0 {
			break
		}
	}
	return none
}

[direct_array_access]
pub fn last_nth_line_not_empty(s string, n int) ?string {
	mut end := s.len
	for counter := n; counter >= 0; counter-- {
		end = unsafe { skip_trailing_whitespace_within_nochk(s, 0, end) }
		if end == 0 {
			return if counter == 0 {
				''
			} else {
				none
			}
		}
		if counter == 0 {
			eoln := unsafe { last_index_after_eoln_within_nochk(s, 0, end) }
			return if eoln >= 0 {
				s[eoln..end]
			} else if end < s.len {
				s[..end]
			} else {
				s
			}
		}
		end = unsafe { last_index_of_eoln_within_nochk(s, 0, end) }
		if end < 0 {
			break
		}
	}
	return none
}

[direct_array_access]
pub fn until_last_nth_line(s string, n int) string {
	mut end := s.len
	for counter := n; counter >= 0; counter-- {
		if counter == 0 {
			return if end > 0 {
				s[..end]
			} else {
				''
			}
		}
		end = unsafe { last_index_of_eoln_within_nochk(s, 0, end) }
		if end < 0 {
			break
		}
	}
	return ''
}

[direct_array_access]
pub fn until_last_nth_line_not_empty(s string, n int) string {
	mut end := s.len
	for counter := n; counter >= 0; counter-- {
		end = unsafe { skip_trailing_whitespace_within_nochk(s, 0, end) }
		if end == 0 {
			break
		}
		if counter == 0 {
			return if end > 0 {
				s[..end]
			} else {
				''
			}
		}
		end = unsafe { last_index_of_eoln_within_nochk(s, 0, end) }
		if end < 0 {
			break
		}
	}
	return ''
}
