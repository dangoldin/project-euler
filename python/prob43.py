from itertools import permutations

s = [int(x) for x in list('0123456789')]

def num_sum(x):
    return x[0] * 100 + x[1] * 10 + x[2]

sum = 0
for x in permutations(s):
    if num_sum(x[7:10]) % 17 == 0 and num_sum(x[6:9]) % 13 == 0 and num_sum(x[5:8]) % 11 == 0 and num_sum(x[4:7]) % 7 == 0 and num_sum(x[3:6]) % 5 == 0 and num_sum(x[2:5]) % 3 == 0 and num_sum(x[1:4]) % 2 == 0:
        print x
        sum += int(''.join(str(y) for y in x))
print 'Sum',sum

