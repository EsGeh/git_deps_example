#!/bin/fish

set BASE_DIR (dirname (readlink -m (status filename)))/..
set DEP_DIR "$BASE_DIR/dependencies"
set SCRIPTS_DIR (dirname (readlink -m (status filename)))

mkdir -p "$DEP_DIR"

wget \
	--output-document="$DEP_DIR/get_deps.fish" \
	https://github.com/EsGeh/git_deps/raw/44374d316ca88c1aac42ce935d8cb39151be2dae/get_deps.fish
chmod u+x "$DEP_DIR/get_deps.fish"


eval "$SCRIPTS_DIR/get_deps.fish"
