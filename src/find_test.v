module strutil

fn test_contains_at_empty() {
	assert !contains_at('', 'a', 0)
}

fn test_contains_at_0() {
	assert contains_at('a', 'a', 0)
}

fn test_contains_at_0_more() {
	assert contains_at('ab', 'ab', 0)
}

fn test_contains_at_1() {
	assert contains_at(' a', 'a', 1)
}

fn test_contains_at_after() {
	assert !contains_at('a ', 'a', 1)
}

fn test_contains_at_out() {
	assert !contains_at('a', 'a', 1)
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
