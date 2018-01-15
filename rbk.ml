module Rb = Rbset.Make (Int)

let show t =
  Notty_unix.output_image_endline (Rb.show t)

let of_list ?(trace=false) l =
  let f t x =
    let t' = Rb.add x t in
    if trace then (
      print_endline @@ "added " ^ string_of_int x;
      show t'
    );
    t'
  in
  List.fold_left f Rb.empty l
