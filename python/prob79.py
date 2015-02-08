from itertools import combinations, permutations

x = """319
680
180
690
129
620
762
689
762
318
368
710
720
710
629
168
160
689
716
731
736
729
316
729
729
710
769
290
719
680
318
389
162
289
162
718
729
319
790
680
890
362
319
760
316
729
380
319
728
716""".split("\n")

print x

a = '012356789'

for i in range(3,20):
    combos = permutations(a, i)
    for c in combos:
        valid = True
        for k in x:
            if valid and not (k[0] in c and k[1] in c and k[2] in c and c.index(k[0]) < c.index(k[1]) and c.index(k[1]) < c.index(k[2])):
                valid = False
        if valid:
            print ''.join(c)
