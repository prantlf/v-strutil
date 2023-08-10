module strutil

fn test_replace_u8_empty() {
	assert replace_u8('', `a`, `b`) == ''
}

fn test_replace_u8_other() {
	assert replace_u8('c', `a`, `b`) == 'c'
}

fn test_replace_u8_other_2() {
	assert replace_u8('cd', `a`, `b`) == 'cd'
}

fn test_replace_u8_1() {
	assert replace_u8('a', `a`, `b`) == 'b'
}

fn test_replace_u8_2() {
	assert replace_u8('aa', `a`, `b`) == 'bb'
}

fn test_replace_u8_some() {
	assert replace_u8('aca', `a`, `b`) == 'bcb'
}
