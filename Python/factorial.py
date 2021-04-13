from functools import reduce
print(reduce(lambda acc, cur: acc* cur, [x for x in range(1,11)], 1))
