
module type Eq = sig
  type t
  val equal : t -> t -> bool
end

let equal (module E : Eq) = E.equal

module EInt = struct
  type t = int
  let equal (x : t) (y : t) = x = y
end

module EBool = struct
  type t = bool
  let equal (x : t) (y : t) = x = y
end

module EFloat = struct
  type t = float
  let equal (x : t) (y : t) = x = y
end

module EString = struct
  type t = string
  let equal (x : t) (y : t) = x = y
end

module EList (X : Eq) = struct
  type t = X.t list
  let equal = List.equal (X.equal)
end

module EPair (A : Eq) (B : Eq) = struct
  type t = A.t * B.t
  let equal (a1, b1) (a2, b2) =
    A.equal a1 a2 && B.equal b1 b2
end
