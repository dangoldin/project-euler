#!/usr/bin/perl

use strict 'vars';

use Math::Prime::TiedArray;

our $Debug = 0;

my @primes;
tie @primes, "Math::Prime::TiedArray";

my $count = 0;
my $numValidPrimes = 0;
my $max = 4000;
my $validPrimeHash;
my $sum = 0;
while ($numValidPrimes < 11) {
    my $prime = shift @primes;

    $validPrimeHash->{$prime} = 1;

    my $length = length($prime);

    if ($length > 1) {
	my $numsToCheck = [ @$prime ];
	# Go from left
	map { push(@$numsToCheck, substr($prime, 0, $length-$_) ) } (0..$length-1);

	# Go from right
	map { push(@$numsToCheck, substr($prime, $length-$_, $_)) if $_; } (0..$length-1);
	
	print "$prime Nums to check: " . join(", ", @$numsToCheck) . "\n" if $Debug;
	
	my $validNum = 1;
	foreach my $num (@$numsToCheck) {
	    unless ($validPrimeHash->{$num}) {
		$validNum = 0;
		last;
	    }
	}
	$numValidPrimes += $validNum;
	
	if ($validNum) {
	    $sum += $prime;
	    print "Valid prime: $prime, Sum is $sum\n";
	}
    }
}

print "Sum: $sum\n";
