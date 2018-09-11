discard """
cmd: "nim check $file"
errormsg: "type mismatch: got <string, set[char], maxsplits: int literal(1)>"
nimout: '''
proc rsplit(s: string; sep: string; maxsplit: int = -1): seq[string]
  first type mismatch at position: 2
  required type: string
  but expression '{':'}' is of type: set[char]
proc rsplit(s: string; sep: char; maxsplit: int = -1): seq[string]
  first type mismatch at position: 2
  required type: char
  but expression '{':'}' is of type: set[char]
proc rsplit(s: string; seps: set[char] = Whitespace; maxsplit: int = -1): seq[string]
  first type mismatch at position: 3
  unknown named parameter: maxsplits

expression: rsplit("abc:def", {':'}, maxsplits = 1)
'''
"""

# bug #8043

import strutils
"abc:def".rsplit({':'}, maxsplits = 1)
