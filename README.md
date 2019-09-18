# mmudc

Mud (https://github.com/mitsuchi/mud) の言語仕様を最小限まで小さくして、
コンパイラーを作ってみる練習。

最終的には次のコードでフィボナッチ数の計算ができるくらいを目標にする。

```ruby
fun fib : Int -> Int = {
  1 -> 1
  2 -> 1
  n -> fib (n-1) + fib (n-2)
}
puts (fib 10)   #=> 55
```

とはいえ、最初は `42` をコンパイルするところからスタートする。
