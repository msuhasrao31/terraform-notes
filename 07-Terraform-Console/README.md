```
# terraform console
> 2 + 4
6
> 10 - 7
3
> 5 * 3
15
> 30 / 5
6
> contains(tolist(["orange","mango","apple"]), "kiwi")
false
> contains(tolist(["orange","mango","apple"]), "apple")
true
>

>

> length("a,b,c")
5
> length(split(",", "a,b,c"))
3
>

>

> length(tomap({"key"="val"}))
1
>

>

> merge(tomap({"key"="val"}), tomap({"test"="abc"}))
tomap({
  "key" = "val"
  "test" = "abc"
})
>

>

>

> element(["a", "b", "c"], 0)
"a"
> element(["a", "b", "c"], 1)
"b"
> element(["a", "b", "c"], 2)
"c"
> element(["a", "b", "c"], 3)
"a"
> element(["a", "b", "c"], 7)
"b"
>

>

>

> lookup({a="Hey", b="Amit"},"a", "Please use the right key")
"Hey"
> lookup({a="Hey", b="Amit"},"b", "Please use the right key")
"Amit"
> lookup({a="Hey", b="Amit"},"c", "Please use the right key")
"Please use the right key"
> lookup({a="Hey", b="Amit"},"e", "Please use the right key")
"Please use the right key"
> lookup({a="Hey", b="Amit"},"1", "Please use the right key")
"Please use the right key"
>
```
