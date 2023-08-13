module strutil

fn test_starts_with_within_empty() {
	assert !starts_with_within('', 'a', 0, -1)
}

fn test_starts_with_within_0() {
	assert starts_with_within('a', 'a', 0, -1)
}

fn test_starts_with_within_0_more() {
	assert starts_with_within('ab', 'ab', 0, -1)
}

fn test_starts_with_within_1() {
	assert starts_with_within(' a', 'a', 1, -1)
}

fn test_starts_with_within_after() {
	assert !starts_with_within('a ', 'a', 1, -1)
}

fn test_starts_with_within_out() {
	assert !starts_with_within('a', 'a', 1, -1)
}

fn test_ends_with_within_empty() {
	assert !ends_with_within('', 'a', 0, -1)
}

fn test_ends_with_within_0() {
	assert ends_with_within('a', 'a', 0, -1)
}

fn test_ends_with_within_0_more() {
	assert ends_with_within('ab', 'ab', 0, -1)
}

fn test_ends_with_within_1() {
	assert ends_with_within('a ', 'a', 0, 1)
}

fn test_ends_with_within_after() {
	assert !ends_with_within('a ', 'a', 1, -1)
}

fn test_ends_with_within_out() {
	assert !ends_with_within('a', 'a', 1, -1)
}

fn test_index_u8_within_empty() {
	assert index_u8_within('', `a`, 0, 0) == -1
}

fn test_index_u8_within_0() {
	assert index_u8_within('a', `a`, 0, 1) == 0
}

fn test_index_u8_within_0_autolen() {
	assert index_u8_within('a', `a`, 0, -1) == 0
}

fn test_index_u8_within_1() {
	assert index_u8_within(' a', `a`, 0, -1) == 1
}

fn test_index_u8_after() {
	assert index_u8_within('a ', `a`, 1, -1) == -1
}

fn test_index_u8_out() {
	assert index_u8_within('a', `a`, 1, -1) == -1
}

fn test_last_index_u8_within_empty() {
	assert last_index_u8_within('', `a`, 0, 0) == -1
}

fn test_last_index_u8_within_0() {
	assert last_index_u8_within('a', `a`, 0, 1) == 0
}

fn test_last_index_u8_within_0_autolen() {
	assert last_index_u8_within('a', `a`, 0, -1) == 0
}

fn test_last_index_u8_within_1() {
	assert last_index_u8_within('a ', `a`, 0, -1) == 0
}

fn test_last_index_u8_before() {
	assert last_index_u8_within('a ', `a`, 1, -1) == -1
}

fn test_last_index_u8_out() {
	assert last_index_u8_within('a', `a`, 1, -1) == -1
}
