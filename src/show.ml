
module type Show = sig
  type t
  val show : Format.formatter -> t -> unit
end

let show (module S : Show) = S.show

let print (module S : Show) x = Format.printf "%a%!" S.show x

module SInt = struct
  type t = int
  let show fmt x = Format.fprintf fmt "%d" x
end

module SBool = struct
  type t = bool
  let show fmt x = Format.fprintf fmt "%b" x
end

module SFloat = struct
  type t = float
  let show fmt x = Format.fprintf fmt "%f" x
end

module SString = struct
  type t = string
  let show fmt x = Format.fprintf fmt "\"%s\"" x
end

module SList (X : Show) = struct
  type t = X.t list

  let show fmt l =
    let rec aux fmt = function
      | [] -> Format.fprintf fmt "]"
      | hd :: tl ->
          Format.fprintf fmt ", %a%a" (show (module X)) hd aux tl
    in match l with
    | [] -> Format.fprintf fmt "[]"
    | hd :: tl ->
        Format.fprintf fmt "[%a%a"
          (show (module X)) hd
          aux tl
end

module SPair (A : Show) (B : Show) = struct
  type t = A.t * B.t
  let show fmt (a, b) =
    Format.fprintf fmt "(%a, %a)" A.show a B.show b
end

    