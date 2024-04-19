Stand 13. März 2024

# Sticker Codon

```
codon run -release fib2.codon
codon run -release fib2.py

pypy3 fib2.py
codon build -release fib2.py

fib2
```

# Beispiel

```python
def decorator_timer(some_function):
    from time import time

    def wrapper(*args, **kwargs):
        t1 = time()
        result = some_function(*args, **kwargs)
        end = round((time()-t1)*1000,6)
        return result, end
    return wrapper


@decorator_timer
def fib(n):
    a, b = 0, 1
    while a < n:
        print(a, end=' ')
        a, b = b, a+b
#    print()

result, exec_time = fib(1000000000)
print()
print(exec_time,"ms")
print(result)

```

# Dokumentation

https://docs.exaloop.io/codon




