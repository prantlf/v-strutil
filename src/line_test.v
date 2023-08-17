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

fn test_nth_line_empty() {
	assert nth_line('', 0)? == ''
}

fn test_nth_line_negative() {
	nth_line('', -1) or { return }
	assert false
}

fn test_nth_line_beyond() {
	nth_line('a', 1) or { return }
	assert false
}

fn test_nth_line_start_cr() {
	assert nth_line('\ra', 0)? == ''
}

fn test_nth_line_start_lf() {
	assert nth_line('\na', 0)? == ''
}

fn test_nth_line_start_crlf() {
	assert nth_line('\r\na', 0)? == ''
}

fn test_nth_line_first() {
	assert nth_line('a', 0)? == 'a'
}

fn test_nth_line_second_from_two() {
	assert nth_line('a\nb', 1)? == 'b'
}

fn test_nth_line_second_from_three() {
	assert nth_line('a\nb\nc', 1)? == 'b'
}

fn test_nth_line_end_cr() {
	assert nth_line('a\r', 0)? == 'a'
}

fn test_nth_line_end_lf() {
	assert nth_line('a\n', 0)? == 'a'
}

fn test_nth_line_end_crlf() {
	assert nth_line('a\r\n', 0)? == 'a'
}

fn test_nth_line_not_empty_empty() {
	assert nth_line_not_empty('', 0)? == ''
}

fn test_nth_line_not_empty_negative() {
	nth_line_not_empty('', -1) or { return }
	assert false
}

fn test_nth_line_not_empty_beyond() {
	nth_line_not_empty('a', 1) or { return }
	assert false
}

fn test_nth_line_not_empty_start_cr() {
	assert nth_line_not_empty('\ra', 0)? == 'a'
}

fn test_nth_line_not_empty_start_lf() {
	assert nth_line_not_empty('\na', 0)? == 'a'
}

fn test_nth_line_not_empty_start_crlf() {
	assert nth_line_not_empty('\r\na', 0)? == 'a'
}

fn test_nth_line_not_empty_first() {
	assert nth_line_not_empty('a', 0)? == 'a'
}

fn test_nth_line_not_empty_second() {
	assert nth_line_not_empty('a\nb', 1)? == 'b'
}

fn test_nth_line_not_empty_second_with_emty_in_between() {
	assert nth_line_not_empty('a\n\nb', 1)? == 'b'
}

fn test_nth_line_not_empty_end_cr() {
	assert nth_line_not_empty('a\r', 0)? == 'a'
}

fn test_nth_line_not_empty_end_lf() {
	assert nth_line_not_empty('a\n', 0)? == 'a'
}

fn test_nth_line_not_empty_end_crlf() {
	assert nth_line_not_empty('a\r\n', 0)? == 'a'
}

fn test_last_nth_line_empty() {
	assert last_nth_line('', 0)? == ''
}

fn test_last_nth_line_negative() {
	last_nth_line('', -1) or { return }
	assert false
}

fn test_last_nth_line_beyond() {
	last_nth_line('a', 1) or { return }
	assert false
}

fn test_last_nth_line_first() {
	assert last_nth_line('a', 0)? == 'a'
}

fn test_last_nth_line_second_from_two() {
	assert last_nth_line('a\nb', 1)? == 'a'
}

fn test_last_nth_line_second_from_three() {
	assert last_nth_line('a\nb\nc', 1)? == 'b'
}

fn test_last_nth_line_end_cr() {
	assert last_nth_line('a\r', 0)? == ''
}

fn test_last_nth_line_end_lf() {
	assert last_nth_line('a\n', 0)? == ''
}

fn test_last_nth_line_end_crlf() {
	assert last_nth_line('a\r\n', 0)? == ''
}

fn test_last_nth_line_start_cr() {
	assert last_nth_line('\ra', 0)? == 'a'
}

fn test_last_nth_line_start_lf() {
	assert last_nth_line('\na', 0)? == 'a'
}

fn test_last_nth_line_start_crlf() {
	assert last_nth_line('\r\na', 0)? == 'a'
}

fn test_last_nth_line_not_empty_empty() {
	assert last_nth_line_not_empty('', 0)? == ''
}

fn test_last_nth_line_not_empty_negative() {
	last_nth_line_not_empty('', -1) or { return }
	assert false
}

fn test_last_nth_line_not_empty_beyond() {
	last_nth_line_not_empty('a', 1) or { return }
	assert false
}

fn test_last_nth_line_not_empty_first() {
	assert last_nth_line_not_empty('a', 0)? == 'a'
}

fn test_last_nth_line_not_empty_second_from_two() {
	assert last_nth_line_not_empty('a\nb', 1)? == 'a'
}

fn test_last_nth_line_not_empty_second_from_three() {
	assert last_nth_line_not_empty('a\nb\nc', 1)? == 'b'
}

fn test_last_nth_line_not_empty_second_with_emty_in_between() {
	assert last_nth_line_not_empty('a\n\nb', 1)? == 'a'
}

fn test_last_nth_line_not_empty_end_cr() {
	assert last_nth_line_not_empty('a\r', 0)? == 'a'
}

fn test_last_nth_line_not_empty_end_lf() {
	assert last_nth_line_not_empty('a\n', 0)? == 'a'
}

fn test_last_nth_line_not_empty_end_crlf() {
	assert last_nth_line_not_empty('a\r\n', 0)? == 'a'
}

fn test_last_nth_line_not_empty_start_cr() {
	assert last_nth_line_not_empty('\ra', 0)? == 'a'
}

fn test_last_nth_line_not_empty_start_lf() {
	assert last_nth_line_not_empty('\na', 0)? == 'a'
}

fn test_last_nth_line_not_empty_start_crlf() {
	assert last_nth_line_not_empty('\r\na', 0)? == 'a'
}
