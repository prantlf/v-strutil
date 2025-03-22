module strutil

pub fn compare_str_within(l string, r string, start_r int, end_r int) int {
	stop_r := check_bounds_incl(r, start_r, end_r)
	if stop_r < 0 {
		return if l == '' {
			0
		} else {
			1
		}
	}
	return unsafe { compare_str_within_nochk(l, r, start_r, stop_r) }
}

pub fn compare_str2_within(l string, start_l int, end_l int, r string, start_r int, end_r int) int {
	stop_l := check_bounds_incl(l, start_l, end_l)
	if stop_l < 0 {
		stop := if end_r < 0 {
			r.len
		} else {
			end_r
		}
		return if start_r == stop {
			0
		} else {
			-1
		}
	}
	stop_r := check_bounds_incl(r, start_r, end_r)
	if stop_r < 0 {
		return 1
	}
	return unsafe { compare_str2_within_nochk(l, start_l, stop_l, r, start_r, stop_r) }
}

@[direct_array_access; inline; unsafe]
pub fn compare_str_within_nochk(l string, r string, start_r int, end_r int) int {
	return unsafe { compare_str2_within_nochk(l, 0, l.len, r, start_r, end_r) }
}

@[direct_array_access; unsafe]
pub fn compare_str2_within_nochk(l string, start_l int, end_l int, r string, start_r int, end_r int) int {
	l_len := end_l - start_l
	r_len := end_r - start_r
	min_is_l := l_len < r_len
	min_len := if min_is_l { l_len } else { r_len }
	for i in 0 .. min_len {
		c1 := l[start_l + i]
		c2 := r[start_r + i]
		if c1 < c2 {
			return -1
		}
		if c1 > c2 {
			return 1
		}
	}
	return if min_is_l {
		-1
	} else if l_len > r_len {
		1
	} else {
		return 0
	}
}
