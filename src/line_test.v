module strutil

fn test_first_line_empty() {
	assert first_line('') == ''
}

fn test_first_line_0_cr() {
	assert first_line('\ra') == ''
}

fn test_first_line_0_lf() {
	assert first_line('\na') == ''
}

fn test_first_line_0_crlf() {
	assert first_line('\r\na') == ''
}

fn test_first_line_1() {
	assert first_line('a') == 'a'
}

fn test_first_line_1_cr() {
	assert first_line('a\r') == 'a'
}

fn test_first_line_1_lf() {
	assert first_line('a\n') == 'a'
}

fn test_first_line_1_crlf() {
	assert first_line('a\r\n') == 'a'
}

fn test_first_line_not_empty_empty() {
	assert first_line_not_empty('') == ''
}

fn test_first_line_not_empty_0_cr() {
	assert first_line_not_empty('\ra') == 'a'
}

fn test_first_line_not_empty_0_lf() {
	assert first_line_not_empty('\na') == 'a'
}

fn test_first_line_not_empty_0_crlf() {
	assert first_line_not_empty('\r\na') == 'a'
}

fn test_first_line_not_empty_1() {
	assert first_line_not_empty('a') == 'a'
}

fn test_first_line_not_empty_1_cr() {
	assert first_line_not_empty('a\r') == 'a'
}

fn test_first_line_not_empty_1_lf() {
	assert first_line_not_empty('a\n') == 'a'
}

fn test_first_line_not_empty_1_crlf() {
	assert first_line_not_empty('a\r\n') == 'a'
}

fn test_last_line_empty() {
	assert last_line('') == ''
}

fn test_last_line_1() {
	assert last_line('a') == 'a'
}

fn test_last_line_0_cr() {
	assert last_line('a\r') == ''
}

fn test_last_line_0_lf() {
	assert last_line('a\n') == ''
}

fn test_last_line_0_crlf() {
	assert last_line('a\r\n') == ''
}

fn test_last_line_1_cr() {
	assert last_line('\ra') == 'a'
}

fn test_last_line_1_lf() {
	assert last_line('\na') == 'a'
}

fn test_last_line_1_crlf() {
	assert last_line('\r\na') == 'a'
}

fn test_last_line_not_empty_empty() {
	assert last_line_not_empty('') == ''
}

fn test_last_line_not_empty_1() {
	assert last_line_not_empty('a') == 'a'
}

fn test_last_line_not_empty_0_cr() {
	assert last_line_not_empty('a\r') == 'a'
}

fn test_last_line_not_empty_0_lf() {
	assert last_line_not_empty('a\n') == 'a'
}

fn test_last_line_not_empty_0_crlf() {
	assert last_line_not_empty('a\r\n') == 'a'
}

fn test_last_line_not_empty_1_cr() {
	assert last_line_not_empty('\ra') == 'a'
}

fn test_last_line_not_empty_1_lf() {
	assert last_line_not_empty('\na') == 'a'
}

fn test_last_line_not_empty_1_crlf() {
	assert last_line_not_empty('\r\na') == 'a'
}
