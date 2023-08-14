module strutil

fn test_1_empty() {
	assert compare_str_within('', '', 0, 0) == 0
}

fn test_1_left_empty() {
	assert compare_str_within('', 'a', 0, 1) == -1
}

fn test_1_right_empty() {
	assert compare_str_within('a', '', 0, 0) == 1
}

fn test_1_less() {
	assert compare_str_within('a', 'b', 0, 1) == -1
}

fn test_1_equal() {
	assert compare_str_within('a', 'a', 0, -1) == 0
}

fn test_1_greater() {
	assert compare_str_within('b', 'a', 0, 1) == 1
}

fn test_1_before() {
	assert compare_str_within('a', ' a', 1, 2) == 0
}

fn test_1_after() {
	assert compare_str_within('a', 'a ', 0, 1) == 0
}

fn test_2_empty() {
	assert compare_str2_within('', 0, 0, '', 0, 0) == 0
}

fn test_2_left_empty() {
	assert compare_str2_within('', 0, 0, 'a', 0, 1) == -1
}

fn test_2_right_empty() {
	assert compare_str2_within('a', 0, 1, '', 0, 0) == 1
}

fn test_2_less() {
	assert compare_str2_within('a', 0, 1, 'b', 0, 1) == -1
}

fn test_2_equal() {
	assert compare_str2_within('a', 0, -1, 'a', 0, -1) == 0
}

fn test_2_greater() {
	assert compare_str2_within('b', 0, 1, 'a', 0, 1) == 1
}

fn test_2_before() {
	assert compare_str2_within(' a', 1, 2, 'a', 0, 1) == 0
}

fn test_2_after() {
	assert compare_str2_within('a ', 0, 1, 'a', 0, 1) == 0
}
