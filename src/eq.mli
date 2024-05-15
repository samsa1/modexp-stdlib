
module type Eq = sig
    type t
    val equal : t -> t -> bool
end

val equal : (module E : Eq) -> E.t -> E.t -> bool

module EInt : Eq with type t = int
module EBool : Eq with type t = bool
module EFloat : Eq with type t = float
module EString : Eq with type t = string
module EList : functor (X : Eq) -> Eq with type t = X.t list
module EPair : functor (A : Eq) -> functor (B : Eq) ->
                Eq with type t = A.t * B.t
