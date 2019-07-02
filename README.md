# git_deps example

A minimal example how to use the [git_deps](https://github.com/EsGeh/git_deps) repository to manage dependencies between git repositories.

## Usage

To install dependencies, issue:

	$ ./scripts/init.fish

If you changed "versions" (= git hashes) in your `dependencies.fish`, you might have to delete `dependencies/` and run your init script again!

	$ rm -rf dependencies/
	$ ./scripts/init.fish

## Details

In order to use git_deps in your project, you'll just need to add 2 files (you can start by copying them from this repository):

- `scripts/init.fish` (or similar): the init script of your repo does the following:
	- create a `dependencies/` directory if not yet existing
	- download [git_deps.fish](https://github.com/EsGeh/git_deps/raw/$get_deps_version/get_deps.fish) and execute it. This will download all the dependencies listed in `dependencies.fish` into `dependencies/`
- `dependencies.fish`: enter the dependencies you need in your repository here!

That's all you need to know to start using git_deps.
It's easy!

# Q & A

- running my init script reports a version conflict. What can I do?

	Just remove the `dependencies/` dir and run the init script again!

		$ rm -rf dependencies/
		$ ./scripts/init.fish

	If this doesn't help, see section "Solving version conflicts"

# Advanced Usage

## Dependencies of Dependencies

If a repository you depend on has itself dependencies and also uses [git_deps.fish](https://github.com/EsGeh/git_deps/raw/$get_deps_version/get_deps.fish) to manage them, git_deps can be configured to do the right thing, e.g. automatically download indirect dependencies, and each dependency just once.

Consider:

	"Your Repo" -> "Repo A" -> "Repo B"

If configured correctly, calling the init script of "Your Repo" will download "Repo A" AND automatically execute the init script of "Repo A", which will in turn download and initialize "Repo B".

Furthermore, consider this situation:

	"Your Repo" -> "Repo A" -> "Repo B"
	                 |            |
	                 |           \|/
	                 --------> "Repo C"

If configured correctly, running the init script in "Your Repo" will only download each dependency ("Repo A", "Repo B", "Repo C") just once.

Attention!: If configured this way, there can only be one version of "Repo C". If "Repo A" and "Repo B" depend on different versions of "Repo C" the running the init script will lead to a "version conflict" message.
("version" in this context means commit hash)

## Solving version conflicts

- Preferred solution: take care for all two dependencies `A`, `B` with the same dependency `C`, they depend on the same version of `C`.
When you are done remove the `dependencies/` dir and run the init script again!

- Alternative solution: you can also configure your dependencies in a way that `A` and `B` don\'t share dependencies. In this case `C` must be downloaded and compiled twice!

# Improvements, Pull Requests

Suggestions, improvements and pull requests welcome!
