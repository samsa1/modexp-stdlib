

module type Coerce = sig
  type t1
  type t2
  val coerce : t1 -> t2
end

val coerce : (module C : Coerce) -> C.t1 -> C.t2

module IntToFloat : Coerce with type t1 = int and type t2 = float
module IntToBool : Coerce with type t1 = int and type t2 = bool
module IntToString : Coerce with type t1 = int and type t2 = string

module FloatToInt : Coerce with type t1 = float and type t2 = int
module FloatToBool : Coerce with type t1 = float and type t2 = bool
module FloatToString : Coerce with type t1 = float and type t2 = string

module BoolToInt : Coerce with type t1 = bool and type t2 = int
module BoolToFloat : Coerce with type t1 = bool and type t2 = float
module BoolToString : Coerce with type t1 = bool and type t2 = string

module StringToInt : Coerce with type t1 = string and type t2 = int
module StringToFloat : Coerce with type t1 = string and type t2 = float
module StringToBool : Coerce with type t1 = string and type t2 = bool

module ListToString : functor (X : Coerce with type t2 = string) ->
                        Coerce with type t1 = X.t1 list and type t2 = string

module LiftList : functor (X : Coerce) ->
                        Coerce with type t1 = X.t1 list and type t2 = X.t2 list

module PairToString : functor (A : Coerce with type t2 = string) ->
                        functor (B : Coerce with type t2 = string) ->
                            Coerce with type t1 = A.t1 * B.t1 and type t2 = string
