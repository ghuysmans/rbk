open Rbk

let demo trace remove l =
  let t = of_list ~trace:(trace || remove=[]) l in
  match remove with
  | [] -> ()
  | _ ->
    if not trace then (
      print_endline "initial state";
      show t
    );
    let f' t x =
      print_endline @@ "removed " ^ string_of_int x;
      let t' = Rb.remove x t in
      show t';
      t'
    in
    ignore (List.fold_left f' t remove)


open Cmdliner

let elements =
  let doc = "integer element" in
  Arg.(value & pos_all int [] & info [] ~doc ~docv:"N")

let trace =
  let doc = "pretty-print the RBT after each step" in
  Arg.(value & flag & info ["t"; "trace"] ~doc)

let remove =
  let doc = "remove comma-separated elements" in
  Arg.(value & opt (list int) [] & info ["r"; "remove"] ~doc)

let () =
  if not !Sys.interactive then (
    let term = Term.(const demo $ trace $ remove $ elements) in
    let info = Term.info "redblack" ~doc:"Red-Black tree colorful demo" in
    Term.exit @@ Term.eval (term, info)
  )
