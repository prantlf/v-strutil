module strutil

import strings { Builder }

pub fn str_without_whitespace(mut b Builder) string {
	if b.len == 0 {
		return ''
	}
	temp_d := unsafe { tos(b.data, b.len) }
	start, end := avoid_whitespace(temp_d)
	if start == end {
		return ''
	}
	b << u8(0)
	len := end - start
	mut bcopy := unsafe { &u8(memdup_noscan(&u8(b.data) + start, len + 1)) }
	unsafe { bcopy[len] = 0 }
	s := unsafe { bcopy.vstring_with_len(len) }
	b.trim(0)
	return s
}

pub fn str_without_leading_whitespace(mut b Builder) string {
	if b.len == 0 {
		return ''
	}
	temp_d := unsafe { tos(b.data, b.len) }
	start := skip_whitespace(temp_d)
	if start == b.len {
		return ''
	}
	len := b.len - start
	b << u8(0)
	bcopy := unsafe { &u8(memdup_noscan(&u8(b.data) + start, len + 1)) }
	s := unsafe { bcopy.vstring_with_len(len) }
	b.trim(0)
	return s
}

pub fn str_without_trailing_whitespace(mut b Builder) string {
	if b.len == 0 {
		return ''
	}
	temp_d := unsafe { tos(b.data, b.len) }
	end := skip_trailing_whitespace(temp_d)
	if end == 0 {
		return ''
	}
	b << u8(0)
	bcopy := unsafe { &u8(memdup_noscan(b.data, end + 1)) }
	s := unsafe { bcopy.vstring_with_len(end) }
	b.trim(0)
	return s
}
