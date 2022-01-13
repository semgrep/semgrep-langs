Order of elements in `lang.json` is order they are displayed on editor.

JSON schema is:

<dl>
  <dt>id</dt><dd>Unique string identifier</dd>
  <dt>name</dt><dd>Human-readable name</dd>
  <dt>keys</dt><dd>All possible values that can reference this language when used as an
    argument to `--lang`; should be non-empty; keys must be a one-to-one
    mapping to languages</dd>
  <dt>exts</dt><dd>File extensions that Semgrep will scan for this language; should be
    non-empty</dd>
  <dt>excluded_exts</dt><dd>File extensions that Semgrep will skip even if one of exts is a
    suffix</dd>
  <dt>example_ext</dt><dd>This language's example file's extension; should be specified if
    length of exts is greater than one</dd>
  <dt>reverse_exts</dt><dd>If present, overrides exts when determining _what_ language a
    file is, otherwise defaults to exts; reverse_exts must be a one-to-one
    mapping to languages</dd>
  <dt>maturity</dt><dd>One of "ga", "beta", "alpha", or "develop"; "alpha" displays as "Experimental"
    in documentation; "develop" is hidden altogether</dd>
  <dt>shebangs</dt><dd>Programs that execute scripts written in this language; may be empty
  <dt>tags</dt><dd>An arbitrary list of string tags; these are useful to replace
    a hard-coded switch on languages in a program</dd>
</dl>
