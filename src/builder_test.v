module strutil

import strings { new_builder }

fn test_within_empty() {
	mut b := new_builder(0)
	assert str_within(mut b, 0, 0) == ''
}

fn test_within_below() {
	mut b := new_builder(0)
	assert str_within(mut b, -1, 0) == ''
}

fn test_within_above() {
	mut b := new_builder(0)
	assert str_within(mut b, 1, 0) == ''
}

fn test_within() {
	mut b := new_builder(3)
	b.write_string(' a ')
	assert str_within(mut b, 1, 2) == 'a'
}

fn test_empty() {
	mut b := new_builder(0)
	assert str_without_whitespace(mut b) == ''
}

fn test_only_whitespace() {
	mut b := new_builder(1)
	b.write_u8(` `)
	assert str_without_whitespace(mut b) == ''
}

fn test_whitespace_around() {
	mut b := new_builder(3)
	b.write_string(' a ')
	assert str_without_whitespace(mut b) == 'a'
}

fn test_leading_empty() {
	mut b := new_builder(0)
	assert str_without_leading_whitespace(mut b) == ''
}

fn test_leading_only_whitespace() {
	mut b := new_builder(1)
	b.write_u8(` `)
	assert str_without_leading_whitespace(mut b) == ''
}

fn test_leading_whitespace_around() {
	mut b := new_builder(3)
	b.write_string(' a ')
	assert str_without_leading_whitespace(mut b) == 'a '
}

fn test_trailing_empty() {
	mut b := new_builder(0)
	assert str_without_trailing_whitespace(mut b) == ''
}

fn test_trailing_only_whitespace() {
	mut b := new_builder(1)
	b.write_u8(` `)
	assert str_without_trailing_whitespace(mut b) == ''
}

fn test_trailing_whitespace_around() {
	mut b := new_builder(3)
	b.write_string(' a ')
	assert str_without_trailing_whitespace(mut b) == ' a'
}
