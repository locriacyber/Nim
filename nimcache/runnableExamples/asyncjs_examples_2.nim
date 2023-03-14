#[
autogenerated by docgen
loc: /home/runner/work/Nim/Nim/lib/js/asyncjs.nim(249, 21)
rdoccmd: -r:off
]#
import "/home/runner/work/Nim/Nim/lib/js/asyncjs.nim"
{.line: ("/home/runner/work/Nim/Nim/lib/js/asyncjs.nim", 249, 21).}:
  from std/sugar import `=>`
  from std/strutils import contains

  proc fn(n: int): Future[int] {.async.} =
    if n >= 7: raise newException(ValueError, "foobar: " & $n)
    else: result = n * 2

  proc main() {.async.} =
    var reason: Error
    await fn(6).catch((r: Error) => (reason = r)) # note: `()` are needed, `=> reason = r` would not work
    assert reason == nil
    await fn(7).catch((r: Error) => (reason = r))
    assert reason != nil
    assert  "foobar: 7" in $reason.message

  discard main()

