src_files = $(wildcard fnl/**/*.fnl)
out_files = $(src_files:fnl/%.fnl=lua/%.lua)
