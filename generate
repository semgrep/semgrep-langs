#!/usr/bin/env python3
#
# Generate JSON and OCaml code describing the list of programming
# languages supported by Semgrep.
#
# Edit this file to add or modify a language, then run 'make' to
# update the files used by our various git projects.
#

from dataclasses import dataclass, field
from enum import Enum
from typing import List, Optional, TextIO
import json
import re


# Level of support for a language in Semgrep. Refer to external documents
# for their exact meaning e.g. https://semgrep.dev/docs/supported-languages/
#
class Maturity(Enum):
    # "alpha" is now displayed as "experimental"
    ALPHA = "alpha"
    BETA = "beta"
    # "develop" is not displayed in documentation
    DEVELOP = "develop"
    # GA means "general availability"
    GA = "ga"

    def to_json(self):
        return self.value


@dataclass
class Language():
    ##################################################################
    # Properties of the language as understood by a user
    ##################################################################

    # Machine-friendly unique language identifier
    id_: str

    # Human-readable name
    name: str

    # Names by which the language or analyzer can be referred to in
    # Semgrep (rules, command line, etc.)
    keys: List[str]
    maturity: Maturity

    # Comment for programmers who will read the generated code.
    comment: Optional[str] = None

    # Extension used when generating temporary or downloable files from
    # code snippets, hinting at what the file contains.
    example_ext: Optional[str] = None

    ##################################################################
    # Properties used to guess the language of a file.
    ##################################################################
    # This is useful for guessing purposes.
    # However, these properties are too simplistic to fully determine
    # target filtering as done by 'semgrep scan'.

    # File extensions that are commonly used for the language, including
    # the period.
    # Several languages may share an extension.
    # TODO: document what qualifies as an extension since don't seem to
    # they have to start with a ".".
    # TODO: document if they're case-sensitive.
    exts: List[str] = field(default_factory=lambda: [""])

    # File extensions that semgrep skips even if one of exts is a suffix,
    # such as ".min.js".
    excluded_exts: List[str] = field(default_factory=list)

    # If present, overrides exts when determining what language a
    # file is, otherwise defaults to exts; reverse_exts must be a one-to-one
    # mapping to languages.
    # TODO: clarify, give examples, and explain in which context it's usable.
    reverse_exts: Optional[List[str]] = None

    # Programs that execute scripts written in this language. May be empty.
    # TODO: this should not be defined here but where target
    # filtering takes place because target filtering is complicated.
    # Alternatively, explain your use case outside of 'semgrep scan'.
    shebangs: List[str] = field(default_factory=list)

    # Some "languages" are general-purpose text analyzers that aren't
    # programming languages or data formats. These include "regex" and
    # "aliengrep" which are not target languages. They do however have
    # their own pattern syntax and engine for matching patterns
    # against targets.
    is_target_language: bool = True

    # Mixed bag of tags used to select a subset of the languages.
    # Prefer boolean properties with a default value.
    # Current tags include:
    # - "is_proprietary" - for languages like Apex that not supported by
    #   the open-source version of Semgrep.
    # - "is_js" - for Javascript and Typescript
    # - "is_python" - for Python, Python2, Python3
    tags: List[str] = field(default_factory=list)

    def to_json(self):
        if self.comment:
            # Remove indentation from comment lines
            comment = re.sub("\n +", "\n", self.comment)
        else:
            comment = ""
        # eww
        res = {
            "comment": comment,
            "id": self.id_,
            "name": self.name,
            "keys": self.keys,
            "maturity": self.maturity.to_json(),
            "exts": self.exts,
            "example_ext": self.example_ext,
            "excluded_exts": self.excluded_exts,
            "reverse_exts": self.reverse_exts,
            "shebangs": self.shebangs,
            "is_target_language": self.is_target_language,
            "tags": self.tags,
        }
        if not self.comment:
            res.pop("comment", None)
        return res


LANGUAGES : List[Language] = [
    Language(
        comment="",
        id_="apex",
        name="Apex",
        keys=["apex"],
        exts=[".cls"],
        maturity=Maturity.DEVELOP,
        shebangs=[],
        tags=["is_proprietary"]
    ),
    Language(
        comment="",
        id_="bash",
        name="Bash",
        keys=["bash", "sh"],
        exts=[".bash", ".sh"],
        example_ext=".sh",
        maturity=Maturity.ALPHA,
        shebangs=["bash", "sh"]
    ),
    Language(
        comment="",
        id_="c",
        name="C",
        keys=["c"],
        exts=[".c"],
        maturity=Maturity.ALPHA,
        shebangs=[]
    ),
    Language(
        comment="",
        id_="cairo",
        name="Cairo",
        keys=["cairo"],
        exts=[".cairo"],
        maturity=Maturity.DEVELOP,
        shebangs=[]
    ),
    Language(
        comment="",
        id_="clojure",
        name="Clojure",
        keys=["clojure"],
        exts=[".clj", ".cljs", ".cljc", ".edn" ],
        maturity=Maturity.ALPHA,
        shebangs=[]
    ),
    Language(
        comment="",
        id_="cpp",
        name="C++",
        keys=["cpp", "c++"],
        exts=[".cc", ".cpp"],
        example_ext=".cpp",
        maturity=Maturity.ALPHA,
        shebangs=[]
    ),
    Language(
        comment="",
        id_="csharp",
        name="C#",
        keys=["csharp", "c#"],
        exts=[".cs"],
        maturity=Maturity.GA,
        shebangs=[]
    ),
    Language(
        id_="dart",
        name="Dart",
        keys=["dart"],
        exts=[".dart"],
        maturity=Maturity.DEVELOP,
        shebangs=[]
    ),
    Language(
        comment="",
        id_="dockerfile",
        name="Dockerfile",
        keys=["dockerfile", "docker"],
        # Extensions don't need start with a "."?
        exts=[".dockerfile", ".Dockerfile", "Dockerfile"],
        example_ext=".dockerfile",
        maturity=Maturity.ALPHA,
        shebangs=[]
    ),
    Language(
        comment="",
        id_="elixir",
        name="Elixir",
        keys=["ex", "elixir"],
        exts=[".ex", ".exs"],
        maturity=Maturity.ALPHA,
        shebangs=[]
    ),
    Language(
        comment="",
        id_="go",
        name="Go",
        keys=["go", "golang"],
        exts=[".go"],
        maturity=Maturity.GA,
        shebangs=[]
    ),
    Language(
        comment="",
        id_="hack",
        name="Hack",
        keys=["hack"],
        exts=[".hack", ".hck", ".hh"],
        example_ext=".hack",
        maturity=Maturity.DEVELOP,
        shebangs=["hhvm"]
    ),
    Language(
        comment="",
        id_="html",
        name="HTML",
        keys=["html"],
        exts=[".htm", ".html"],
        example_ext=".html",
        maturity=Maturity.ALPHA,
        shebangs=[]
    ),
    Language(
        comment="",
        id_="java",
        name="Java",
        keys=["java"],
        exts=[".java"],
        maturity=Maturity.GA,
        shebangs=[]
    ),
    Language(
        comment="",
        id_="js",
        name="JavaScript",
        keys=["js", "javascript"],
        exts=[".js", ".jsx"],
        excluded_exts=[".min.js"],
        example_ext=".jsx",
        maturity=Maturity.GA,
        shebangs=["node", "js", "nodejs"],
        tags=["is_js"]
    ),
    Language(
        comment="",
        id_="json",
        name="JSON",
        keys=["json"],
        exts=[".json", ".ipynb"],
        maturity=Maturity.GA,
        shebangs=[]
    ),
    Language(
        comment="",
        id_="jsonnet",
        name="Jsonnet",
        keys=["jsonnet"],
        exts=[".jsonnet", ".libsonnet"],
        maturity=Maturity.ALPHA,
        shebangs=[]
    ),
    Language(
        comment="",
        id_="julia",
        name="Julia",
        keys=["julia"],
        exts=[".jl"],
        maturity=Maturity.ALPHA,
        shebangs=[]
    ),
    Language(
        comment="",
        id_="kotlin",
        name="Kotlin",
        keys=["kt", "kotlin"],
        exts=[".kt", ".kts", ".ktm"],
        example_ext=".kt",
        maturity=Maturity.BETA,
        shebangs=[]
    ),
    Language(
        comment="",
        id_="lisp",
        name="Lisp",
        keys=["lisp"],
        exts=[".lisp", ".cl", ".el"],
        maturity=Maturity.ALPHA,
        shebangs=[]
    ),
    Language(
        comment="",
        id_="lua",
        name="Lua",
        keys=["lua"],
        exts=[".lua"],
        maturity=Maturity.ALPHA,
        shebangs=["lua"]
    ),
    Language(
        comment="",
        id_="ocaml",
        name="OCaml",
        keys=["ocaml"],
        exts=[".ml", ".mli"],
        example_ext=".ml",
        maturity=Maturity.ALPHA,
        shebangs=["ocaml", "ocamlscript"]
    ),
    Language(
        comment="",
        id_="php",
        name="PHP",
        keys=["php"],
        exts=[".php", ".tpl"],
        maturity=Maturity.GA,
        shebangs=["php"]
    ),
    Language(
        comment="",
        id_="python2",
        name="Python 2",
        keys=["python2"],
        exts=[".py", ".pyi"],
        reverse_exts=None,
        example_ext=".py",
        maturity=Maturity.DEVELOP,
        shebangs=["python", "python2"],
        tags=["is_python"]
    ),
    Language(
        comment="",
        id_="python3",
        name="Python 3",
        keys=["python3"],
        exts=[".py", ".pyi"],
        reverse_exts=None,
        example_ext=".py",
        maturity=Maturity.DEVELOP,
        shebangs=["python", "python3"],
        tags=["is_python"]
    ),
    Language(
        comment="",
        id_="python",
        name="Python",
        keys=["py", "python"],
        exts=[".py", ".pyi"],
        example_ext=".py",
        maturity=Maturity.GA,
        shebangs=["python", "python2", "python3"],
        tags=["is_python"]
    ),
    Language(
        comment="",
        id_="r",
        name="R",
        keys=["r"],
        exts=[".r", ".R"],
        example_ext=".R",
        maturity=Maturity.ALPHA
    ),
    Language(
        comment="",
        id_="ruby",
        name="Ruby",
        keys=["ruby"],
        exts=[".rb"],
        maturity=Maturity.GA,
        shebangs=["ruby"]
    ),
    Language(
        comment="",
        id_="rust",
        name="Rust",
        keys=["rust"],
        exts=[".rs"],
        maturity=Maturity.ALPHA,
        shebangs=["run-cargo-script"]
    ),
    Language(
        comment="",
        id_="scala",
        name="Scala",
        keys=["scala"],
        exts=[".scala"],
        maturity=Maturity.GA,
        shebangs=["scala"]
    ),
    Language(
        comment="",
        id_="scheme",
        name="Scheme",
        keys=["scheme"],
        exts=[".scm", ".ss"],
        maturity=Maturity.ALPHA,
        shebangs=[]
    ),
    Language(
        comment="",
        id_="solidity",
        name="Solidity",
        keys=["solidity", "sol"],
        exts=[".sol"],
        maturity=Maturity.ALPHA,
        shebangs=[]
    ),
    Language(
        comment="",
        id_="swift",
        name="Swift",
        keys=["swift"],
        exts=[".swift"],
        maturity=Maturity.ALPHA,
        shebangs=[]
    ),
    Language(
        comment="",
        id_="terraform",
        name="Terraform",
        keys=["tf", "hcl", "terraform"],
        exts=[".tf", ".hcl"],
        maturity=Maturity.GA,
        shebangs=[]
    ),
    Language(
        comment="",
        id_="ts",
        name="TypeScript",
        keys=["ts", "typescript"],
        exts=[".ts", ".tsx"],
        excluded_exts=[".d.ts"],
        example_ext=".tsx",
        maturity=Maturity.GA,
        shebangs=["ts-node"],
        tags=["is_js"]
    ),
    Language(
        comment="",
        id_="vue",
        name="Vue",
        keys=["vue"],
        exts=[".vue"],
        maturity=Maturity.DEVELOP,
        shebangs=[]
    ),
    Language(
        comment="",
        id_="xml",
        name="XML",
        keys=["xml"],
        exts=[".xml"],
        example_ext=".xml",
        maturity=Maturity.ALPHA,
        shebangs=[]
    ),
    Language(
        comment="",
        id_="yaml",
        name="YAML",
        keys=["yaml"],
        exts=[".yml", ".yaml"],
        example_ext=".yaml",
        maturity=Maturity.ALPHA,
        shebangs=[]
    ),
    ########################################################################
    # Entries that are not programming languages or data formats
    ########################################################################
    #
    # They're included here for legacy reasons.
    #
    Language(
        comment="""This can be used in rules as a target selector that selects
        all the files regardless of their extension or contents.
        When no target analyzer is specified, the spacegrep engine shall
        be used.
        """,
        id_="generic",
        name="Generic",
        is_target_language=False,
        keys=["generic"],
        # Since "generic" is not a target selector, it doesn't
        # make sense to specify this 'exts' field. Specifying an empty
        # extension shouldn't be needed. We should remove it when once we're
        # confident that no implementation relies on it.
        exts=[""],
        example_ext=".generic",
        maturity=Maturity.ALPHA,
        shebangs=[]
    ),
    Language(
        comment="""This can be used in rules as a target selector that selects
        all the files regardless of their extension or contents.
        When no target analyzer is specified, the regex engine shall be used.
        """,
        id_="regex",
        name="regex",
        is_target_language=False,
        keys=["regex", "none"],
        exts=[""],
        reverse_exts=None,
        maturity=Maturity.DEVELOP
    ),
]


def write_ocaml_type_definitions(languages: List[Language], out: TextIO) -> None:
    out.write("""
(* All the programming languages for which Semgrep has dedicated support. *)
type t =
""")
    for x in languages:
        # OCaml syntax requires this format: [A-Z][A-Za-z0-9_]*
        variant_name = x.id_.capitalize()
        out.write(f"| {variant_name}\n")
    out.write("""
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
  id_string: string;
  name: string;
  keys: string list;
  exts: string list;
  maturity: maturity;
  example_ext: string option;
  excluded_exts: string list;
  reverse_exts: string list option;
  shebangs: string list;
  tags: string list;
}
""")


# Warning: not proper escaping but will work as long as the input string
# doesn't contain '|}'.
def ocaml_string(x: str) -> str:
    return "{|" + x + "|}"


def ocaml_string_option(x: Optional[str]) -> str:
    if x is None:
        return "None"
    else:
        return f"Some {ocaml_string(x)}"


def ocaml_string_list(xs: List[str]) -> str:
    quoted = [ ocaml_string(x) for x in xs ]
    return f"""[{"; ".join(quoted)}]"""


# There should be a way to get this by combining ocaml_string, ocaml_list,
# and ocaml_option but it's just too much for me right now.
def ocaml_string_list_option(x: Optional[List[str]]) -> str:
    if x is None:
        return "None"
    else:
        return f"Some {ocaml_string_list(x)}"


# Used by semgrep-core and osemgrep
def generate_ocaml(languages: List[Language], outfile_no_ext: str) -> None:
    mli = f"{outfile_no_ext}.mli"
    ml = f"{outfile_no_ext}.ml"
    langs = [ x for x in languages if x.is_target_language ]
    with open(mli, "w") as out:
        out.write("(* Generated file. Do not edit. *)\n")
        write_ocaml_type_definitions(langs, out)
        out.write("""
(*
   List of all the programming languages for which Semgrep has dedicated
   support. This list is sufficient to produce fast lookup tables implementing
   to_string, of_string, etc.
*)
val list : info list
""")
    with open(ml, "w") as out:
        out.write("(* Generated file. Do not edit. *)\n")
        write_ocaml_type_definitions(langs, out)
        out.write("""
let list = [
""")
        for x in langs:
            if x.comment:
                comment_lines = x.comment.splitlines()
                out.write("(*\n")
                for line in comment_lines:
                    out.write(f"  {line.strip()}\n")
                out.write("*)\n")
            out.write(f"""{{
  id = {x.id_.capitalize()};
  id_string = "{x.id_}";
  name = "{x.name}";
  keys = {ocaml_string_list(x.keys)};
  exts = {ocaml_string_list(x.exts)};
  maturity = {x.maturity.value.capitalize()};
  example_ext = {ocaml_string_option(x.example_ext)};
  excluded_exts = {ocaml_string_list(x.excluded_exts)};
  reverse_exts = {ocaml_string_list_option(x.reverse_exts)};
  shebangs = {ocaml_string_list(x.shebangs)};
  tags = {ocaml_string_list(x.tags)};
}};
""")
        out.write("]\n")


# Used by (py)semgrep and by semgrep-app
def generate_json(languages: List[Language], outfile: str) -> None:
    dicts = [ x.to_json() for x in languages ]
    with open(outfile, "w") as out:
        json.dump(dicts, out, indent=2)


def main() -> None:
    generate_ocaml(LANGUAGES, "Language")
    generate_json(LANGUAGES, "lang.json")


# En voiture Simone
main()
