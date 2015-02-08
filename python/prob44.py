from itertools import combinations

def pentagonal(n):
    return n * (3 * n - 1)/2

pentagonals = set(pentagonal(n) for n in range(1,10000))

for x,y in combinations(pentagonals, 2):
    if (x + y) in pentagonals and abs(x - y) in pentagonals:
        print 'Both',x,y,'Diff',abs(x-y)
        exit()
