
module type Show = sig
    type t
    val show : Format.formatter -> t -> unit
end

val show : (module S : Show) -> Format.formatter -> S.t -> unit

val print : (module S : Show) -> S.t -> unit
    (* Printing on stdout *)

module SInt : Show with type t = int
module SBool : Show with type t = bool
module SFloat : Show with type t = float
module SString : Show with type t = string

module SList : functor (X : Show) -> Show with type t = X.t list
module SPair : functor (A : Show) -> functor (B : Show) ->
    Show with type t = A.t * B.t
