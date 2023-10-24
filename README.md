# Count chagnes
両替?おつり?の計算処理

Racket,Typed Racketの練習

## TODO
- [x] Racketで実装してみる
- [x] Typed Racketで型を付けてみる
- [ ] main.rktでコマンドラインツール化する
  - [x] 引数(おつり金額)を1つ取り、おつりを計算する機能をとりあえず実装する

## Examples
```terminal
$ racket -I typed/racket -i
Welcome to Racket v8.10 [cs].
> (require  "./src/typed/count-changes.rkt")
> solve
- : (->* (Number)
         ((Listof Nonnegative-Integer))
         (U (Listof (Pairof Nonnegative-Integer Nonnegative-Integer)) Void))
#<procedure:solve>
> ;; 全種類のお釣りが用意できている
> (solve 123456)
- : (U (Listof (Pairof Nonnegative-Integer Nonnegative-Integer)) Void)
'((10000 . 12) (1000 . 3) (100 . 4) (50 . 1) (5 . 1) (1 . 1))

> ;; \1,000札が不足している場合のお釣りの種類
> (define divisors (list 10000 1000 500 100 50 10 5 1))
> (solve 123456 divisors)
- : (U (Listof (Pairof Nonnegative-Integer Nonnegative-Integer)) Void)
'((10000 . 12) (1000 . 3) (100 . 4) (50 . 1) (5 . 1) (1 . 1))

> ;; お釣りが用意できない
> (solve 123446 (list 10000))
- : (U (Listof (Pairof Nonnegative-Integer Nonnegative-Integer)) Void)
> (void? (solve 123446 (list 10000)))
- : Boolean
```
