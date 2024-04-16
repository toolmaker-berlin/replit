import time, sys

text=sys.version.split(" ")
text="\033c"+"Harry's SI 4.2 Replit (Python: "+text[0]+")"
print(text)
print("-"*(len(text)-1))

ms_total = 0
ms_einzel = 0

core = 0


def timeit(method):

  def timed(*args, **kw):
    ts = time.time()
    result = method(*args, **kw)
    te = time.time()
    global ms_total, ms_einzel
    ms_einzel = (te - ts) * 1000
    ms_total += ms_einzel
    return result

  return timed


# Floatingpointtest (Simple)
@timeit
def test1():
  x = 0
  for i in range(10_000_00):
    x += i / 1000

test1()
core+=ms_einzel


# Interger/List Test (Glücksscheine)
@timeit
def gscheine(Stellen):
  alt = [1] * 10
  for N in range(2, Stellen // 2 + 1):
    neu = [1]
    for i in range(9):
      neu.append(neu[i] + alt[i + 1])
    if N > 2:
      for i in range((N - 2) * 5):
        t = alt[i + 10] - alt[i]
        if t >= 0:
          neu.append(neu[i + 9] + t)
    alt = neu + neu[N * 9 // 2 - 1::-1]
  return sum(map(lambda x: x**2, alt))

gscheine(500)
core+=ms_einzel


# Noch ein Integer/Prime-Test
@timeit
def count_primes(max_num: int):
  count: int = 0
  for num in range(max_num * 1000 + 1):
    if num > 1:
      for i in range(2, num):
        if num % i == 0:
          break
        else:
          count += 1
  return count

count_primes(1)
core+=ms_einzel

def result(text,core):
  punkte1=(1000/core)+0.05

  print("\n"+text)
  print("Core-Index: %3.1f" % punkte1)

result("This System",core)
result("MPro TrashCan",131)
result("MBA M1",90)
result("Replit free",375)
result("Replit upgraded",170)

core=int(core+.5)
print(f"\nNOW: {core=}ms\n")

sys.exit(0)

