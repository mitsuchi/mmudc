# mmudc

Mud (https://github.com/mitsuchi/mud) の言語仕様を最小限まで小さくして、
x86-64向けコンパイラーを作ってみる練習。

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

## 環境構築手順

手元が macOS(x86-64) なので docker を利用して linux 環境をつくる

```
$ docker build -t mmudc .
$ docker run --name mmudc -v `pwd`:/mmudc -itd mmudc sh
```

コンパイラーの開発は実機で行い、バイナリーの実行とテストは docker上で行う。

## テスト手順

```
./test.sh
```

## 進め方

https://www.sigbus.info/compilerbook
を参考にする