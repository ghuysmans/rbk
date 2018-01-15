OCAMLFLAGS=-use-ocamlfind -pkg notty.unix,cmdliner
all:
	ocamlbuild $(OCAMLFLAGS) redblack.native
top:
	ocamlbuild $(OCAMLFLAGS) rbk.byte
	ocaml

clean:
	ocamlbuild -clean
