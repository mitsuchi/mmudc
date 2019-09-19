module Main where

import Data.Char
import Lib

main :: IO ()
main = do
  line <- getLine
  putStrLn ".intel_syntax noprefix"
  putStrLn ".global main"
  putStrLn "main:"
  let (num, rest) = parseNum line
  putStrLn ("  mov rax, " ++ num)
  parseTerms rest
  putStrLn "  ret"

parseNum :: String -> (String, String)
parseNum = span (\c -> 48 <= ord c && ord c <= 57)

parseTerms :: String -> IO ()
parseTerms text = if text == ""
  then pure ()
  else do
        let (op, num, rest) = parseTerm text
        putStrLn ("  " ++ inst op ++ " rax, " ++ num)
        parseTerms rest

parseTerm :: String -> (Char, String, String)
parseTerm text = let (num, rest) = parseNum $ tail text
                 in (head text, num, rest)

inst :: Char -> String
inst '+' = "add"
inst '-' = "sub"