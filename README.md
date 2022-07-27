The elements in `lang.json` are ordered alphabetically.

JSON schema is:

* **id**: Unique string identifier.
* **name**: Human-readable name.
* **keys**: All possible values that can reference a language when used as
  an argument to <code>--lang</code>; should be non-empty;
  keys must map one-to-one to languages.
* **exts**: File extensions that Semgrep scans for this 
language; should be non-empty.
* **excluded_exts**: File extensions that Semgrep skips even if one of exts is a
  suffix.
* **example_ext**: Specify example_ext if the language has more than one exts.
  Must represent the most idiomatic extension of the example language.
  Must start with a period.
* **reverse_exts**: If present, overrides exts when determining _what_ language a
  file is, otherwise defaults to exts; reverse_exts must be a one-to-one
  mapping to languages.
* **maturity**: One of "ga", "beta", "alpha", or "develop"; "alpha" displays as "Experimental"
  in documentation; "develop" is not displayed in documentation.
* **shebangs**: Programs that execute scripts written in this language. May be empty.
* **tags**: An arbitrary list of string tags; useful to replace
  a hard-coded switch on languages in a program.
