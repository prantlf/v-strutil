module strutil

@[direct_array_access]
pub fn replace_u8(s string, rep u8, with u8) string {
	if s.len == 0 {
		return ''
	}

	mut mem := unsafe { malloc_noscan(s.len + 1) }
	unsafe {
		vmemcpy(mem, s.str, s.len)
		mem[s.len] = 0
	}
	mut cur := mem
	end := unsafe { cur + s.len }
	for cur < end {
		if *cur == rep {
			unsafe {
				*cur = with
			}
		}
		unsafe { cur++ }
	}

	return unsafe { tos(mem, s.len) }
}
