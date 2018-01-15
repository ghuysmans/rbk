OCAMLFLAGS=-use-ocamlfind -pkg notty.unix,cmdliner
all:
	ocamlbuild $(OCAMLFLAGS) redblack.native

clean:
	ocamlbuild -clean
