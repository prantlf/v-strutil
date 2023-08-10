module strutil

fn test_skip_space_empty() {
	assert skip_space('', 0, 0) == 0
}

fn test_skip_space_0() {
	assert skip_space('a', 0, 1) == 0
}

fn test_skip_space_1() {
	assert skip_space(' ', 0, 1) == 1
}

fn test_skip_space_1_autolen() {
	assert skip_space(' ', 0, -1) == 1
}

fn test_skip_space_2() {
	assert skip_space('  ', 0, -1) == 2
}

fn test_skip_space_3() {
	assert skip_space('  a', 0, -1) == 2
}

fn test_skip_whitespace_empty() {
	assert skip_whitespace('', 0, 0) == 0
}

fn test_skip_whitespace_0() {
	assert skip_whitespace('a', 0, 1) == 0
}

fn test_skip_whitespace_1() {
	assert skip_whitespace(' ', 0, 1) == 1
}

fn test_skip_whitespace_1_autolen() {
	assert skip_whitespace(' ', 0, -1) == 1
}

fn test_skip_whitespace_2() {
	assert skip_whitespace(' \t\r\n', 0, -1) == 4
}

fn test_skip_whitespace_3() {
	assert skip_whitespace(' \t\r\na', 0, -1) == 4
}
