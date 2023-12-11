module strutil

@[inline]
pub fn is_space(s string) bool {
	return skip_space(s) == s.len
}

@[inline]
pub fn is_whitespace(s string) bool {
	return skip_whitespace(s) == s.len
}

pub fn str_len(s &u8, end int) int {
	stop := if end < 0 {
		2147483648
	} else {
		end
	}
	return unsafe { str_len_nochk(s, stop) }
}

@[direct_array_access; unsafe]
pub fn str_len_nochk(s &u8, end int) int {
	for i := 0; i < end; i++ {
		if unsafe { s[i] } == `\0` {
			return i
		}
	}
	return end
}
