#!/bin/fish

set BASE_DIR (dirname (readlink -m (status filename)))/..
set DEP_DIR "$BASE_DIR/dependencies"
set SCRIPTS_DIR (dirname (readlink -m (status filename)))

mkdir -p "$DEP_DIR"

wget \
	--output-document="$DEP_DIR/load_deps.fish" \
	https://github.com/EsGeh/git_deps/raw/master/init.fish
chmod u+x "$DEP_DIR/load_deps.fish"


eval "$SCRIPTS_DIR/load_deps.fish"
