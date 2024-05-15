# Modular explicits standard library

This library has the goal of defining usefull primitives for testing modular
explicits before it is merged inside the upstream compiler and that the stdlib
adds to this new feature.

No warranty are given 

## Install

This library can be installed using opam.

You must first install the `5.2.0+modular-explicit` compiler variant using :
```
opam repo add modular-variants git+https://github.com/samsa1/modular-compiler-variants.git
opam switch create 5.2.0+modular-explicits --repos modular-variants,default
```

Then you can install this library

```
opam install modexp_lib
```

## Modular explicits

Modular explicits are a type extension of [first-class modules](https://ocaml.org/manual/5.2/firstclassmodules.html) as such the syntax for defining functions and function
application is the same. The main addition is a new type `(module M : S) -> t`
where `M` can appear in `t`.

## Content

This library defines multiple modules containing the useful primitives to
experiment with modular explicits.

Each module is intended to have a similar structure:
- define a signature
- define one of multiple dependent functions using that signature
- define multiple modules of the previous signature for various types

Currently implemented modules are:

* `Eq` defines a function `equal : (module E : Eq) -> E.t -> E.t -> bool`
    (see [src/eq.mli](./src/eq.mli)).
* `Show` defines two functions (see [src/show.mli](./src/show.mli))
    - `show : (module S : Show) -> Format.formatter -> S.t -> unit`,
    - `print : (module S : Show) -> S.t -> unit`.
* `Coerce` defines a function `coerce : (module C : Coerce) -> C.t1 -> C.t2`
    (see [src/coerce.mli](./src/coerce.mli)).

More documentation is unavailable because at the time of writting `odoc` cannot
be compiler on the modular-explicit branch due to the change is the typed AST.

## Contributing

Contributions are welcomed but I don't plan to invest much time on this library
as it is currently intended as a placeholder to help people test a new feature.