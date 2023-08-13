module strutil

[noinit]
pub struct RangeError {
	Error
	msg string
}

fn (e RangeError) msg() string {
	return e.msg
}

pub fn check_bounds_incl(s string, start int, end int) int {
	if start < 0 || start >= s.len {
		return -1
	}
	return if end < 0 {
		s.len
	} else {
		if end > s.len || start >= end {
			return -1
		}
		end
	}
}

pub fn check_bounds_excl(s string, start int, end int) int {
	if start < 0 || start > s.len {
		return -1
	}
	return if end < 0 {
		s.len
	} else {
		if end > s.len || start > end {
			return -1
		}
		end
	}
}

pub fn check_bounds_strict(s string, start int, end int) !int {
	if start < 0 || start > s.len {
		return RangeError{
			msg: 'start ${start} out of range <0; ${end})'
		}
	}
	return if end < 0 {
		s.len
	} else {
		if end > s.len || start > end {
			return RangeError{
				msg: 'end ${end} out of range <${start}; ${s.len})'
			}
		}
		end
	}
}
