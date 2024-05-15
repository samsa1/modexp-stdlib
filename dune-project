(lang dune 3.10)

(generate_opam_files true)

(name modexp_lib)
(version dev)
(license MIT)
(authors "Samuel Vivien")
(maintainers "samuel.aime.vivien@free.fr")
(source (github samsa1/modexp-stdlib))

(package
 (name modexp_lib)
 (synopsis "Library for using modular explicits")
 (description "\| This library defines a basis
              "\| to utilise modular explicts
 )
 (depends
  (ocaml (= 5.2.0))
 )
)