if(exists("current_compiler"))
	finish
endif
let current_compiler = "c_make"

set makeprg=c\ make
