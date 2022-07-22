The elements in `lang.json` are ordered alphabetically.

JSON schema is:

<dl>
  <dt>id</dt><dd>Unique string identifier.</dd>
  <dt>name</dt><dd>Human-readable name.</dd>
  <dt>keys</dt><dd>All possible values that can reference a language when used as an
    argument to `--lang`; should be non-empty; keys must map one-to-one
    to languages.</dd>
  <dt>exts</dt><dd>File extensions that Semgrep scans as this language; should be
    non-empty.</dd>
  <dt>excluded_exts</dt><dd>File extensions that Semgrep skips even if one of exts is a
    suffix.</dd>
  <dt>example_ext</dt><dd>File extension of the example language. Specify if
    length of exts is greater than one. Must start with a period.</dd>
  <dt>reverse_exts</dt><dd>If present, overrides exts when determining _what_ language a
    file is, otherwise defaults to exts; reverse_exts must be a one-to-one
    mapping to languages.</dd>
  <dt>maturity</dt><dd>One of "ga", "beta", "alpha", or "develop"; "alpha" displays as "Experimental"
    in documentation; "develop" is not displayed in documentation.</dd>
  <dt>shebangs</dt><dd>Programs that execute scripts written in this language; may be empty</dd>
  <dt>tags</dt><dd>An arbitrary list of string tags; useful to replace
    a hard-coded switch on languages in a program.</dd>
</dl>
