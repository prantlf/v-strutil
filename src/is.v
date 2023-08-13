module strutil

[inline]
pub fn is_space(s string) bool {
	return skip_space(s) == s.len
}

[inline]
pub fn is_whitespace(s string) bool {
	return skip_whitespace(s) == s.len
}
