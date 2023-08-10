module strutil

fn test_is_space_empty() {
	assert is_space('')
}

fn test_is_space_1() {
	assert is_space(' ')
}

fn test_is_space_2() {
	assert is_space('  ')
}

fn test_is_space_not() {
	assert !is_space('a')
}

fn test_is_space_not_2() {
	assert !is_space(' a')
}

fn test_is_whitespace_empty() {
	assert is_whitespace('')
}

fn test_is_whitespace_1() {
	assert is_whitespace(' ')
}

fn test_is_whitespace_2() {
	assert is_whitespace(' \t\r\n')
}

fn test_is_whitespace_not() {
	assert !is_whitespace('a')
}

fn test_is_whitespace_not_2() {
	assert !is_whitespace(' \t\r\na')
}
