module strutil

[direct_array_access]
pub fn is_space(s string) bool {
	for c in s {
		match c {
			` ` {}
			else {
				return false
			}
		}
	}
	return true
}

[direct_array_access]
pub fn is_whitespace(s string) bool {
	for c in s {
		match c {
			` `, `\t`, `\r`, `\n` {}
			else {
				return false
			}
		}
	}
	return true
}
