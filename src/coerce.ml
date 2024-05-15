
module type Coerce = sig
  type t1
  type t2
  val coerce : t1 -> t2
end

let coerce (module C : Coerce) = C.coerce

module IntToFloat = struct
  type t1 = int
  type t2 = float
  let coerce = float_of_int
end

module IntToBool = struct
  type t1 = int
  type t2 = bool
  let coerce x = x <> 0
end

module IntToString = struct
  type t1 = int
  type t2 = string
  let coerce = string_of_int
end

module FloatToInt = struct
  type t1 = float
  type t2 = int
  let coerce = int_of_float
end

module FloatToBool = struct
  type t1 = float
  type t2 = bool
  let coerce x = x <> 0.
end

module FloatToString = struct
  type t1 = float
  type t2 = string
  let coerce = string_of_float
end

module BoolToInt = struct
  type t1 = bool
  type t2 = int
  let coerce x = if x then 1 else 0
end

module BoolToFloat = struct
  type t1 = bool
  type t2 = float
  let coerce x = if x then 1. else 0.
end

module BoolToString = struct
  type t1 = bool
  type t2 = string
  let coerce = string_of_bool
end

module StringToInt = struct
  type t1 = string
  type t2 = int
  let coerce = int_of_string
end

module StringToFloat = struct
  type t1 = string
  type t2 = float
  let coerce = float_of_string
end

module StringToBool = struct
  type t1 = string
  type t2 = bool
  let coerce = bool_of_string
end

module ListToString (X : Coerce with type t2 = string) = struct
  type t1 = X.t1 list
  type t2 = string
  let coerce l =
    let rec aux = function
      | [] -> "]"
      | hd :: tl ->
          ", " ^ X.coerce hd ^ aux tl
    in match l with
      | [] -> "[]"
      | hd :: tl ->
          "[" ^ X.coerce hd ^ aux tl
end

module LiftList (X : Coerce) = struct
  type t1 = X.t1 list
  type t2 = X.t2 list
  let coerce l = List.map X.coerce l
end

module PairToString (A : Coerce with type t2 = string)
                    (B : Coerce with type t2 = string) = struct
    type t1 = A.t1 * B.t1
    type t2 = string
    let coerce (a, b) = "(" ^ A.coerce a ^ ", " ^ B.coerce b ^ ")"
end
