#!/bin/fish

set BASE_DIR (dirname (readlink -m (status filename)))/..
set SCRIPTS_DIR (dirname (readlink -m (status filename)))
set DEP_DIR "$BASE_DIR/dependencies"

source "$SCRIPTS_DIR/cmd_args.fish"


set name "unknown entity"

# (syntax: short/long/description)
set options_descr \
	"h/help/print help" \
	"n/name=/your name in order for proper greeting. default $name"

function print_help
	echo "usage: "(status -f)" [OPTIONS...]"
	echo "OPTIONS:"
	print_options_descr $options_descr
end


#################################################
# cmd line interface
#################################################

set options (options_descr_to_argparse $options_descr)

# parse command line arguments:
argparse $options -- $argv 2>/dev/null
or begin
	print_help
	exit 1
end
if set -q _flag_h
	print_help
	exit 0
else
	if set -q _flag_name
		set name $_flag_name
	end
end

#################################################
# actual script
#################################################

echo "hello, $name"
