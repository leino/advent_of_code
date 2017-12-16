import System.Exit
import qualified AdventOfCode.Solution03Part1 as S01P1

main :: IO ()
main = do
  let correct =
        and [
        S01P1.solution 277678 == 475
        ]
      exitCode = if correct then ExitSuccess else ExitFailure 1
  exitWith exitCode
