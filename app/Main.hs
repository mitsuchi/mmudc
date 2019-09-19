module Main where

import Lib

main :: IO ()
main = do
  num <- getLine
  putStrLn ".intel_syntax noprefix"
  putStrLn ".global main"
  putStrLn "main:"
  putStrLn ("  mov rax, " ++ num)
  putStrLn "  ret"
