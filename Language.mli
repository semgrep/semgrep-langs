(* Generated file. Do not edit. *)

(* All the programming languages for which Semgrep has dedicated support. *)
type t =
| Apex
| Bash
| C
| Cairo
| Clojure
| Cpp
| Csharp
| Dart
| Dockerfile
| Elixir
| Generic
| Go
| Hack
| Html
| Java
| Js
| Json
| Jsonnet
| Julia
| Kotlin
| Lisp
| Lua
| Ocaml
| Php
| Python2
| Python3
| Python
| R
| Regex
| Ruby
| Rust
| Scala
| Scheme
| Solidity
| Swift
| Terraform
| Ts
| Vue
| Xml
| Yaml

(*
   Maturity of the support for the programming language as shown to the
   public.
*)
type maturity =
| Alpha
| Beta
| Develop
| Ga

(*
   Information about a supported programming language for which we have
   a dedicated parser (target analyzer). Some of this information can also be
   used for the purpose of target selection.
*)
type info = {
  id: t;
  name: string;
  keys: string list;
  exts: string list;
  maturity: maturity;
  example_ext: string option;
  excluded_exts: string list;
  reverse_exts: string list;
  shebangs: string list;
  tags: string list;
}

(* List of all the programming languages for which Semgrep has dedicated
   support. *)
val list : info list
