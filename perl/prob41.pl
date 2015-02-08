#!usr/bin/perl

use strict 'vars';
use Math::Prime::TiedArray;

our $Debug = 0;

my @primes;
tie @primes, "Math::Prime::TiedArray";

my $max = 1e9;

my $primeHash = {};

while ((my $prime = shift @primes) < $max) {
    print "$prime\n" if isPandigital( $prime );
}

sub isPandigital {
    my $val = shift;

    foreach my $i (1..length($val)) {
	return 0 if !($val =~ /$i/);
    }
    return 1;
}
