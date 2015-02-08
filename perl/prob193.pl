#!/usr/bin/perl

use strict 'vars';

use Math::Prime::TiedArray;

my @primes;
tie @primes, "Math::Prime::TiedArray";

if (0) {
    print join ", ", @primes[0..99];

    print "\n" . $primes[199];

    while ((my $prime = shift @primes) < 500) {
	print "$prime, ";
    }

    print "\n";
}

my ($maxNum, $countBad) = (2**50, 0);
my $maxPrime = $maxNum**0.5;

my @goodPrimes;
while ((my $prime = shift @primes) <= $maxPrime) {
    push @goodPrimes, $prime;
}

print "Testing out " . scalar(@goodPrimes) . " primes\n";

my $badCount = 0;
foreach my $prime (@goodPrimes) {
    $badCount += int($maxNum / $prime**2);
}

my $finalNum = $maxNum - $badCount;

print "Final: $finalNum\n";
