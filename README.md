Order of elements in `lang.json` is order they are displayed on editor.

JSON schema is:

```
id: Unique string identifier
name: Human-readable name
keys: All possible values that can reference this language when used as an
  argument to `--lang`; should be non-empty; keys must be a one-to-one
  mapping to languages
exts: File extensions that Semgrep will scan for this language; should be
  non-empty
excluded_exts: File extensions that Semgrep will skip even if one of exts is a
  suffix
example_ext: This language's example file's extension; should be specified if
  length of exts is greater than one
reverse_exts: If present, overrides exts when determining _what_ language a
  file is, otherwise defaults to exts; reverse_exts must be a one-to-one
  mapping to languages
maturity: One of "ga", "beta", "alpha", or "develop"; "develop" is hidden in
  the UI
shebangs: Programs that execute scripts written in this language; may be empty
tags: An arbitrary list of string tags; these are useful to replace
  a hard-coded switch on languages in a program
```
