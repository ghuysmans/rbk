module Rb : Rbset.S with type elt = int
val show : Rb.t -> unit
val of_list : ?trace:bool -> int list -> Rb.t
