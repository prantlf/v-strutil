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
	cr := unsafe { index_u8_within_nochk(s, `\r`, start, s.len) }
	lf := unsafe { index_u8_within_nochk(s, `\n`, start, s.len) }
	mut eoln := if cr > lf || lf < 0 {
		cr
	} else {
		lf
	}
	if not_empty && eoln >= 0 {
		eoln = unsafe { skip_whitespace_within_nochk(s, eoln + 1, s.len) }
	}
	return if eoln >= 0 {
		s[eoln + 1..]
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
	cr := unsafe { last_index_u8_within_nochk(s, `\r`, 0, end) }
	lf := unsafe { last_index_u8_within_nochk(s, `\n`, 0, end) }
	mut eoln := if (cr >= 0 && cr < lf) || lf < 0 {
		cr
	} else {
		lf
	}
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
		start = if cr > lf || lf < 0 {
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
		start = if cr > lf || lf < 0 {
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
		cr := unsafe { index_u8_within_nochk(s, `\r`, start, s.len) }
		lf := unsafe { index_u8_within_nochk(s, `\n`, start, s.len) }
		start = if cr > lf || lf < 0 {
			cr
		} else {
			lf
		} + 1
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
		cr := unsafe { index_u8_within_nochk(s, `\r`, start, s.len) }
		lf := unsafe { index_u8_within_nochk(s, `\n`, start, s.len) }
		start = if cr > lf || lf < 0 {
			cr
		} else {
			lf
		} + 1
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
		cr := unsafe { last_index_u8_within_nochk(s, `\r`, 0, end) }
		lf := unsafe { last_index_u8_within_nochk(s, `\n`, 0, end) }
		if counter == 0 {
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
		end = if (cr >= 0 && cr < lf) || lf < 0 {
			cr
		} else {
			lf
		}
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
		cr := unsafe { last_index_u8_within_nochk(s, `\r`, 0, end) }
		lf := unsafe { last_index_u8_within_nochk(s, `\n`, 0, end) }
		if counter == 0 {
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
		end = if (cr >= 0 && cr < lf) || lf < 0 {
			cr
		} else {
			lf
		}
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
		cr := unsafe { last_index_u8_within_nochk(s, `\r`, 0, end) }
		lf := unsafe { last_index_u8_within_nochk(s, `\n`, 0, end) }
		end = if (cr >= 0 && cr < lf) || lf < 0 {
			cr
		} else {
			lf
		}
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
		cr := unsafe { last_index_u8_within_nochk(s, `\r`, 0, end) }
		lf := unsafe { last_index_u8_within_nochk(s, `\n`, 0, end) }
		end = if (cr >= 0 && cr < lf) || lf < 0 {
			cr
		} else {
			lf
		}
		if end < 0 {
			break
		}
	}
	return ''
}
