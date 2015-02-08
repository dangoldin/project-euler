import math;

print math.pi;

def isprime(n):
    for x in range(2, int(n**0.5)+1):
        if n % x == 0:
            return False
        return True
 
print isprime(29) # True
print isprime(345) # False
print isprime(8951) # True

a, b = 0, 1
while b < 1000:
    print b,
    a, b = b, a+b
