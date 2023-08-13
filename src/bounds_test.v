module strutil

fn test_error() {
	err := RangeError{
		msg: 'test'
	}
	assert err.msg() == 'test'
}

fn test_incl_empty() {
	assert check_bounds_incl('', 0, 0) == -1
}

fn test_incl_yes() {
	assert check_bounds_incl('a', 0, 1) == 1
}

fn test_incl_yes_autolen() {
	assert check_bounds_incl('a', 0, -1) == 1
}

fn test_incl_no_start() {
	assert check_bounds_incl('a', 0, 0) == -1
}

fn test_incl_no_end() {
	assert check_bounds_incl('a', 1, 1) == -1
}

fn test_incl_no_under() {
	assert check_bounds_incl('a', -1, 1) == -1
}

fn test_incl_no_over() {
	assert check_bounds_incl('a', 0, 2) == -1
}

fn test_excl_empty() {
	assert check_bounds_excl('', 0, 0) == 0
}

fn test_excl_yes() {
	assert check_bounds_excl('a', 0, 1) == 1
}

fn test_excl_yes_autolen() {
	assert check_bounds_excl('a', 0, -1) == 1
}

fn test_excl_no_start() {
	assert check_bounds_excl('a', 0, 0) == 0
}

fn test_excl_no_end() {
	assert check_bounds_excl('a', 1, 1) == 1
}

fn test_excl_no_under() {
	assert check_bounds_excl('a', -1, 1) == -1
}

fn test_excl_no_over() {
	assert check_bounds_excl('a', 0, 2) == -1
}

fn test_strict_empty() {
	assert check_bounds_strict('', 0, 0)! == 0
}

fn test_strict_yes() {
	assert check_bounds_strict('a', 0, 1)! == 1
}

fn test_strict_yes_autolen() {
	assert check_bounds_strict('a', 0, -1)! == 1
}

fn test_strict_no_start() {
	assert check_bounds_strict('a', 0, 0)! == 0
}

fn test_strict_no_end() {
	assert check_bounds_strict('a', 1, 1)! == 1
}

fn test_strict_no_under() {
	check_bounds_strict('a', -1, 1) or {
		assert err is RangeError
		assert err.msg() == 'start -1 out of range <0; 1)'
		return
	}
	assert false
}

fn test_strict_no_over() {
	check_bounds_strict('a', 0, 2) or {
		assert err is RangeError
		assert err.msg() == 'end 2 out of range <0; 1)'
		return
	}
	assert false
}
