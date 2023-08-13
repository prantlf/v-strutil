module strutil

[direct_array_access]
pub fn first_line(s string) string {
	cr := s.index_u8(`\r`)
	lf := s.index_u8(`\n`)
	eoln := if (cr >= 0 && cr < lf) || lf < 0 {
		cr
	} else {
		lf
	}
	return if eoln >= 0 {
		s[..eoln]
	} else {
		s
	}
}

[direct_array_access]
pub fn first_line_not_empty(s string) string {
	start := unsafe { skip_whitespace_within_nochk(s, 0, s.len) }
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

[direct_array_access]
pub fn last_line(s string) string {
	cr := s.last_index_u8(`\r`)
	lf := s.last_index_u8(`\n`)
	eoln := if cr > lf || lf < 0 {
		cr
	} else {
		lf
	}
	return if eoln >= 0 {
		s[eoln + 1..]
	} else {
		s
	}
}

[direct_array_access]
pub fn last_line_not_empty(s string) string {
	end := unsafe { skip_trailing_whitespace_within_nochk(s, 0, s.len) }
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
