from itertools import permutations, combinations

def primes(n):
    if n<=2:
        return []
    sieve = [True]*(n+1)
    for x in range(3,int(n**0.5)+1,2):
        for y in range(3,(n//x)+1,2):
            sieve[(x*y)]=False

    return [2]+[i for i in range(3,n,2) if sieve[i]]

pl = set(primes(10000))

p = set([tuple(str(x)) for x in pl if x > 1000])

valid = []

for i in p:
    c = permutations(i,4)
    cnt = 0
    primes = []
    for j in c:
        if j in p:
            cnt += 1
            primes.append ( j )
    if cnt >= 3:
        n = tuple(sorted(set([int(''.join(x)) for x in primes])))
        if n not in valid:
            valid.append( n )

print 'Valid', valid

for x in valid:
    if len(x) >= 3:
        c = list(combinations(x,3))
        for a in c:
            if a[1] - a[0] == a[2] - a[1]:
                print a
