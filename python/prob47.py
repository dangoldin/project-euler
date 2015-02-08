prime_map = {}

def primes(n):
    if n<=2:
        return []
    sieve = [True]*(n+1)
    for x in range(3,int(n**0.5)+1,2):
        for y in range(3,(n//x)+1,2):
            sieve[(x*y)]=False

    return [2]+[i for i in range(3,n,2) if sieve[i]]

def factor(n, prime_list):
    if n in prime_map:
        return prime_map[n]

    fac = []
    for i in prime_list:
        if i > n:
            prime_map[n] = fac
            return fac
        cnt = 0
        while n % i == 0:
            cnt += 1
            n /= i
        if cnt > 0:
            fac.append((i, cnt))

pl = primes(10000000)

print 'Done calculating primes'

for n in range(2,1000000):
    if len(factor(n,pl)) == 4 and len(factor(n+1,pl)) == 4 and len(factor(n+2,pl)) == 4 and len(factor(n+3,pl)) == 4:
        print n
