#!usr/bin/perl

use strict 'vars';
use Math::Prime::TiedArray;

our $Debug = 0;

my @primes;
tie @primes, "Math::Prime::TiedArray";

my $max = 1000000;

my $primeHash = {};

while ((my $prime = shift @primes) < $max) {
    $primeHash->{$prime} = 1;
}

my $circularPrimes = [];
my $numCircPrimes = 1; # Include 2
foreach my $prime (keys(%$primeHash)) {
    print "Prime $prime\n" if $Debug;
    next if ($prime =~ /0/ || $prime =~ /2/ || $prime =~ /4/ || $prime =~ /6/ || $prime =~ /8/);

    my $rotatedVals = getRotations( $prime );

    my $isCircularPrime = 1;
    foreach my $rotatedVal (@$rotatedVals) {
	$rotatedVal += 0;
	unless (defined($primeHash->{$rotatedVal})) {
	    $isCircularPrime = 0;
	    last;
	}
    }
    push (@$circularPrimes, $prime) if $isCircularPrime;
    $numCircPrimes += $isCircularPrime;
}

print "Num Circ Primes: $numCircPrimes\n";
print "Circular primes: " . join(", ", sort { $a <=> $b } @$circularPrimes) . "\n";

sub getRotations {
    my $val = shift;

    my $numIter = length($val);

    my $rotatedVals = [];
    my $currVal = $val;
    for (my $i = 1; $i <= $numIter; $i++) {
	$currVal = rotate($currVal);
	push (@$rotatedVals, rotate($currVal));
    }

    print "$val rot: " . join(", ", @$rotatedVals) . "\n" if $Debug;

    return $rotatedVals;
}

sub rotate {
    my $val = shift;
    my $newVal = ($val % 10) . int($val/10);
    return $newVal;
}
