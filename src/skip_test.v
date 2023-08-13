module strutil

fn test_skip_space_within_empty() {
	assert skip_space_within('', 0, 0) == 0
}

fn test_skip_space_within_0() {
	assert skip_space_within('a', 0, 1) == 0
}

fn test_skip_space_within_1() {
	assert skip_space_within(' ', 0, 1) == 1
}

fn test_skip_space_within_1_autolen() {
	assert skip_space_within(' ', 0, -1) == 1
}

fn test_skip_space_within_2() {
	assert skip_space_within('  ', 0, -1) == 2
}

fn test_skip_space_within_3() {
	assert skip_space_within('  a', 0, -1) == 2
}

fn test_skip_whitespace_within_empty() {
	assert skip_whitespace_within('', 0, 0) == 0
}

fn test_skip_whitespace_within_0() {
	assert skip_whitespace_within('a', 0, 1) == 0
}

fn test_skip_whitespace_within_1() {
	assert skip_whitespace_within(' ', 0, 1) == 1
}

fn test_skip_whitespace_within_1_autolen() {
	assert skip_whitespace_within(' ', 0, -1) == 1
}

fn test_skip_whitespace_within_2() {
	assert skip_whitespace_within(' \t\r\n', 0, -1) == 4
}

fn test_skip_whitespace_within_3() {
	assert skip_whitespace_within(' \t\r\na', 0, -1) == 4
}
