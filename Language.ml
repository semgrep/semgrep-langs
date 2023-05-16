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

let list = [

{
  id = Apex;
  name = "Apex";
  keys = [{|apex|}];
  exts = [{|.cls|}];
  maturity = Develop;
  example_ext = None;
  excluded_exts = [];
  reverse_exts = [];
  shebangs = [];
  tags = [{|is_proprietary|}];
};

{
  id = Bash;
  name = "Bash";
  keys = [{|bash|}; {|sh|}];
  exts = [{|.bash|}; {|.sh|}];
  maturity = Alpha;
  example_ext = Some {|.sh|};
  excluded_exts = [];
  reverse_exts = [];
  shebangs = [{|bash|}; {|sh|}];
  tags = [];
};

{
  id = C;
  name = "C";
  keys = [{|c|}];
  exts = [{|.c|}];
  maturity = Alpha;
  example_ext = None;
  excluded_exts = [];
  reverse_exts = [];
  shebangs = [];
  tags = [];
};

{
  id = Cairo;
  name = "Cairo";
  keys = [{|cairo|}];
  exts = [{|.cairo|}];
  maturity = Develop;
  example_ext = None;
  excluded_exts = [];
  reverse_exts = [];
  shebangs = [];
  tags = [];
};

{
  id = Clojure;
  name = "Clojure";
  keys = [{|clojure|}];
  exts = [{|.clj|}; {|.cljs|}; {|.cljc|}; {|.edn|}];
  maturity = Alpha;
  example_ext = None;
  excluded_exts = [];
  reverse_exts = [];
  shebangs = [];
  tags = [];
};

{
  id = Cpp;
  name = "C++";
  keys = [{|cpp|}; {|c++|}];
  exts = [{|.cc|}; {|.cpp|}];
  maturity = Alpha;
  example_ext = Some {|.cpp|};
  excluded_exts = [];
  reverse_exts = [];
  shebangs = [];
  tags = [];
};

{
  id = Csharp;
  name = "C#";
  keys = [{|csharp|}; {|c#|}];
  exts = [{|.cs|}];
  maturity = Ga;
  example_ext = None;
  excluded_exts = [];
  reverse_exts = [];
  shebangs = [];
  tags = [];
};

{
  id = Dart;
  name = "Dart";
  keys = [{|dart|}];
  exts = [{|.dart|}];
  maturity = Develop;
  example_ext = None;
  excluded_exts = [];
  reverse_exts = [];
  shebangs = [];
  tags = [];
};

{
  id = Dockerfile;
  name = "Dockerfile";
  keys = [{|dockerfile|}; {|docker|}];
  exts = [{|.dockerfile|}; {|.Dockerfile|}; {|Dockerfile|}];
  maturity = Alpha;
  example_ext = Some {|.dockerfile|};
  excluded_exts = [];
  reverse_exts = [];
  shebangs = [];
  tags = [];
};

{
  id = Elixir;
  name = "Elixir";
  keys = [{|ex|}; {|elixir|}];
  exts = [{|.ex|}; {|.exs|}];
  maturity = Alpha;
  example_ext = None;
  excluded_exts = [];
  reverse_exts = [];
  shebangs = [];
  tags = [];
};

{
  id = Generic;
  name = "Generic";
  keys = [{|generic|}];
  exts = [{||}];
  maturity = Alpha;
  example_ext = Some {|.generic|};
  excluded_exts = [];
  reverse_exts = [];
  shebangs = [];
  tags = [];
};

{
  id = Go;
  name = "Go";
  keys = [{|go|}; {|golang|}];
  exts = [{|.go|}];
  maturity = Ga;
  example_ext = None;
  excluded_exts = [];
  reverse_exts = [];
  shebangs = [];
  tags = [];
};

{
  id = Hack;
  name = "Hack";
  keys = [{|hack|}];
  exts = [{|.hack|}; {|.hck|}; {|.hh|}];
  maturity = Develop;
  example_ext = Some {|.hack|};
  excluded_exts = [];
  reverse_exts = [];
  shebangs = [{|hhvm|}];
  tags = [];
};

{
  id = Html;
  name = "HTML";
  keys = [{|html|}];
  exts = [{|.htm|}; {|.html|}];
  maturity = Alpha;
  example_ext = Some {|.html|};
  excluded_exts = [];
  reverse_exts = [];
  shebangs = [];
  tags = [];
};

{
  id = Java;
  name = "Java";
  keys = [{|java|}];
  exts = [{|.java|}];
  maturity = Ga;
  example_ext = None;
  excluded_exts = [];
  reverse_exts = [];
  shebangs = [];
  tags = [];
};

{
  id = Js;
  name = "JavaScript";
  keys = [{|js|}; {|javascript|}];
  exts = [{|.js|}; {|.jsx|}];
  maturity = Ga;
  example_ext = Some {|.jsx|};
  excluded_exts = [{|.min.js|}];
  reverse_exts = [];
  shebangs = [{|node|}; {|js|}; {|nodejs|}];
  tags = [{|is_js|}];
};

{
  id = Json;
  name = "JSON";
  keys = [{|json|}];
  exts = [{|.json|}; {|.ipynb|}];
  maturity = Ga;
  example_ext = None;
  excluded_exts = [];
  reverse_exts = [];
  shebangs = [];
  tags = [];
};

{
  id = Jsonnet;
  name = "Jsonnet";
  keys = [{|jsonnet|}];
  exts = [{|.jsonnet|}; {|.libsonnet|}];
  maturity = Alpha;
  example_ext = None;
  excluded_exts = [];
  reverse_exts = [];
  shebangs = [];
  tags = [];
};

{
  id = Julia;
  name = "Julia";
  keys = [{|julia|}];
  exts = [{|.jl|}];
  maturity = Alpha;
  example_ext = None;
  excluded_exts = [];
  reverse_exts = [];
  shebangs = [];
  tags = [];
};

{
  id = Kotlin;
  name = "Kotlin";
  keys = [{|kt|}; {|kotlin|}];
  exts = [{|.kt|}; {|.kts|}; {|.ktm|}];
  maturity = Beta;
  example_ext = Some {|.kt|};
  excluded_exts = [];
  reverse_exts = [];
  shebangs = [];
  tags = [];
};

{
  id = Lisp;
  name = "Lisp";
  keys = [{|lisp|}];
  exts = [{|.lisp|}; {|.cl|}; {|.el|}];
  maturity = Alpha;
  example_ext = None;
  excluded_exts = [];
  reverse_exts = [];
  shebangs = [];
  tags = [];
};

{
  id = Lua;
  name = "Lua";
  keys = [{|lua|}];
  exts = [{|.lua|}];
  maturity = Alpha;
  example_ext = None;
  excluded_exts = [];
  reverse_exts = [];
  shebangs = [{|lua|}];
  tags = [];
};

{
  id = Ocaml;
  name = "OCaml";
  keys = [{|ocaml|}];
  exts = [{|.ml|}; {|.mli|}];
  maturity = Alpha;
  example_ext = Some {|.ml|};
  excluded_exts = [];
  reverse_exts = [];
  shebangs = [{|ocaml|}; {|ocamlscript|}];
  tags = [];
};

{
  id = Php;
  name = "PHP";
  keys = [{|php|}];
  exts = [{|.php|}; {|.tpl|}];
  maturity = Ga;
  example_ext = None;
  excluded_exts = [];
  reverse_exts = [];
  shebangs = [{|php|}];
  tags = [];
};

{
  id = Python2;
  name = "Python 2";
  keys = [{|python2|}];
  exts = [{|.py|}; {|.pyi|}];
  maturity = Develop;
  example_ext = Some {|.py|};
  excluded_exts = [];
  reverse_exts = [];
  shebangs = [{|python|}; {|python2|}];
  tags = [{|is_python|}];
};

{
  id = Python3;
  name = "Python 3";
  keys = [{|python3|}];
  exts = [{|.py|}; {|.pyi|}];
  maturity = Develop;
  example_ext = Some {|.py|};
  excluded_exts = [];
  reverse_exts = [];
  shebangs = [{|python|}; {|python3|}];
  tags = [{|is_python|}];
};

{
  id = Python;
  name = "Python";
  keys = [{|py|}; {|python|}];
  exts = [{|.py|}; {|.pyi|}];
  maturity = Ga;
  example_ext = Some {|.py|};
  excluded_exts = [];
  reverse_exts = [];
  shebangs = [{|python|}; {|python2|}; {|python3|}];
  tags = [{|is_python|}];
};

{
  id = R;
  name = "R";
  keys = [{|r|}];
  exts = [{|.r|}; {|.R|}];
  maturity = Alpha;
  example_ext = Some {|.R|};
  excluded_exts = [];
  reverse_exts = [];
  shebangs = [];
  tags = [];
};

{
  id = Regex;
  name = "regex";
  keys = [{|regex|}; {|none|}];
  exts = [{||}];
  maturity = Develop;
  example_ext = None;
  excluded_exts = [];
  reverse_exts = [];
  shebangs = [];
  tags = [];
};

{
  id = Ruby;
  name = "Ruby";
  keys = [{|ruby|}];
  exts = [{|.rb|}];
  maturity = Ga;
  example_ext = None;
  excluded_exts = [];
  reverse_exts = [];
  shebangs = [{|ruby|}];
  tags = [];
};

{
  id = Rust;
  name = "Rust";
  keys = [{|rust|}];
  exts = [{|.rs|}];
  maturity = Alpha;
  example_ext = None;
  excluded_exts = [];
  reverse_exts = [];
  shebangs = [{|run-cargo-script|}];
  tags = [];
};

{
  id = Scala;
  name = "Scala";
  keys = [{|scala|}];
  exts = [{|.scala|}];
  maturity = Ga;
  example_ext = None;
  excluded_exts = [];
  reverse_exts = [];
  shebangs = [{|scala|}];
  tags = [];
};

{
  id = Scheme;
  name = "Scheme";
  keys = [{|scheme|}];
  exts = [{|.scm|}; {|.ss|}];
  maturity = Alpha;
  example_ext = None;
  excluded_exts = [];
  reverse_exts = [];
  shebangs = [];
  tags = [];
};

{
  id = Solidity;
  name = "Solidity";
  keys = [{|solidity|}; {|sol|}];
  exts = [{|.sol|}];
  maturity = Alpha;
  example_ext = None;
  excluded_exts = [];
  reverse_exts = [];
  shebangs = [];
  tags = [];
};

{
  id = Swift;
  name = "Swift";
  keys = [{|swift|}];
  exts = [{|.swift|}];
  maturity = Alpha;
  example_ext = None;
  excluded_exts = [];
  reverse_exts = [];
  shebangs = [];
  tags = [];
};

{
  id = Terraform;
  name = "Terraform";
  keys = [{|tf|}; {|hcl|}; {|terraform|}];
  exts = [{|.tf|}; {|.hcl|}];
  maturity = Ga;
  example_ext = None;
  excluded_exts = [];
  reverse_exts = [];
  shebangs = [];
  tags = [];
};

{
  id = Ts;
  name = "TypeScript";
  keys = [{|ts|}; {|typescript|}];
  exts = [{|.ts|}; {|.tsx|}];
  maturity = Ga;
  example_ext = Some {|.tsx|};
  excluded_exts = [{|.d.ts|}];
  reverse_exts = [];
  shebangs = [{|ts-node|}];
  tags = [{|is_js|}];
};

{
  id = Vue;
  name = "Vue";
  keys = [{|vue|}];
  exts = [{|.vue|}];
  maturity = Develop;
  example_ext = None;
  excluded_exts = [];
  reverse_exts = [];
  shebangs = [];
  tags = [];
};

{
  id = Xml;
  name = "XML";
  keys = [{|xml|}];
  exts = [{|.xml|}];
  maturity = Alpha;
  example_ext = Some {|.xml|};
  excluded_exts = [];
  reverse_exts = [];
  shebangs = [];
  tags = [];
};

{
  id = Yaml;
  name = "YAML";
  keys = [{|yaml|}];
  exts = [{|.yml|}; {|.yaml|}];
  maturity = Alpha;
  example_ext = Some {|.yaml|};
  excluded_exts = [];
  reverse_exts = [];
  shebangs = [];
  tags = [];
};

]
