def primes(n):
    if n<=2:
        return []
    sieve = [True]*(n+1)
    for x in range(3,int(n**0.5)+1,2):
        for y in range(3,(n//x)+1,2):
            sieve[(x*y)]=False

    return [2]+[i for i in range(3,n,2) if sieve[i]]

pl = primes(1000000)
#pl = primes(1000)
pls = set(pl)

max_p = 2
max_l = 1

big_sum = sum(pl)

print big_sum

max_l = 1

ss = big_sum
for i in range(0,len(pl)):
    ss = ss - pl[i]
    st = ss
    for j in range(1,len(pl)-i):
        st = st - pl[len(pl)-j]
        if st in pls:
            l = len(pl) - i - j
            if l > max_l:
                print 'Prime',st,'Length',l
                max_l = l

exit()

for i in range(0,len(pl)):
#    print 'i',i
    for j in range(max_l,len(pl)-i-max_l):
#        print 'j',j
        s = sum(pl[i:i+j])
        if s > 1000000:
            continue
        if s in pls and j > max_l:
            print 'S:', s
            max_l = j
            max_p = s

print 'Max:',max_p
