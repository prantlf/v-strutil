module strutil

fn test_avoid_space_within_empty() {
	s, e := avoid_space_within('', 0, 0)
	assert s == 0
	assert e == 0
}

fn test_avoid_space_within_0() {
	s, e := avoid_space_within('a', 0, 1)
	assert s == 0
	assert e == 1
}

fn test_avoid_space_within_1() {
	s, e := avoid_space_within(' ', 0, 1)
	assert s == 1
	assert e == 1
}

fn test_avoid_space_within_1_autolen() {
	s, e := avoid_space_within(' ', 0, -1)
	assert s == 1
	assert e == 1
}

fn test_avoid_space_within_2() {
	s, e := avoid_space_within('  ', 0, -1)
	assert s == 2
	assert e == 2
}

fn test_avoid_space_within_3() {
	s, e := avoid_space_within('  a', 0, -1)
	assert s == 2
	assert e == 3
}

fn test_avoid_whitespace_within_empty() {
	s, e := avoid_whitespace_within('', 0, 0)
	assert s == 0
	assert e == 0
}

fn test_avoid_whitespace_within_0() {
	s, e := avoid_whitespace_within('a', 0, 1)
	assert s == 0
	assert e == 1
}

fn test_avoid_whitespace_within_1() {
	s, e := avoid_whitespace_within(' \t\r\n', 0, 4)
	assert s == 4
	assert e == 4
}

fn test_avoid_whitespace_within_1_autolen() {
	s, e := avoid_whitespace_within(' \t\r\n', 0, -1)
	assert s == 4
	assert e == 4
}

fn test_avoid_whitespace_within_2() {
	s, e := avoid_whitespace_within(' \t\r\na', 0, -1)
	assert s == 4
	assert e == 5
}
