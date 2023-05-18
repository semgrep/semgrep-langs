# Generate code representing the list of target languages supported
# by Semgrep.
#

.PHONY: build
build:
	mypy generate
	./generate
	# Check syntax and types of the generated OCaml files
	ocamlc -o Language Language.mli Language.ml

.PHONY: clean
clean:
	git clean -dfX
