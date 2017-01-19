Style/MethodCallParentheses:
  Enabled: false
  Description: Do not use parentheses for method calls with no arguments.
  StyleGuide: https://github.com/bbatsov/ruby-style-guide#no-args-no-parens

Style/MutableConstant:
  Enabled: false
  Description: Freeze mutable constants.

Style/GuardClause:
  Description: Check for conditionals that can be replaced with guard clauses.
  StyleGuide: https://github.com/bbatsov/ruby-style-guide#no-nested-conditionals
  Enabled: false
  MinBodyLength: 1

Style/BracesAroundHashParameters:
  Enabled: false
  EnforcedStyle: no_braces
  SupportedStyles:
  # The `braces` style enforces braces around all method parameters that are
  # hashes.
  - braces
  # The `no_braces` style checks that the last parameter doesn't have braces
  # around it.
  - no_braces
  # The `context_dependent` style checks that the last parameter doesn't have
  # braces around it, but requires braces if the second to last parameter is
  # also a hash literal.
  - context_dependent

Style/CommentAnnotation:
  Description: >-
    Checks formatting of special comments
    (TODO, FIXME, OPTIMIZE, HACK, REVIEW).
  StyleGuide: 'https://github.com/bbatsov/ruby-style-guide#annotate-keywords'
  Enabled: false

Style/StringLiterals:
  Enabled: false
  EnforcedStyle: single_quotes
  SupportedStyles:
  - single_quotes
  - double_quotes

Style/FrozenStringLiteralComment:
  Enabled: false
  Description: Require the addition of the frozen string literal comment.

Metrics/LineLength:
  Description: Limit lines to 80 characters.
  StyleGuide: https://github.com/bbatsov/ruby-style-guide#80-character-limits
  Enabled: true
  Max: 80
  AllowURI: true
  URISchemes:
  - http
  - https