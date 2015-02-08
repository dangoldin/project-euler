#!/usr/bin/perl

use strict 'vars';

our $Debug = 0;

my ($max, $num) = (20, 1000);

# Generate pythagorean triplets
my $triples;
for my $n (1..$max-1) {
    for my $m ($n+1..$max) {
	for my $k (1..$max) {
	    my $an = $k * ($m * $m - $n * $n);
	    my $bn = $k * (2 * $m * $n);
	    my $cn = $k * ($m * $m + $n * $n);
	    print "Triple: $an $bn $cn\n";
	    my $triple = [ $an, $bn, $cn, $an + $bn + $cn ];
	    $triple = [ sort { $a <=> $b } @$triple ];
	    push (@$triples, $triple);
	}
    }
}

my ($maxNumSoFar, $maxTriples) = (0, 0);
foreach my $i (10..$num) {
    my $usedTriples;
    foreach my $triple (@$triples) {
	my ($a, $b, $c, $d) = @$triple;
	
	my $val = $i/$d;
	if (int($val) == $val) {
	    my $newTriple = [ $a * $val, $b * $val, $c * $val ]; 
	    $usedTriples->{ join("-", @$newTriple) } = 1;
	}
    }

    if (scalar(keys(%$usedTriples))) {
	my $numTriples = scalar( keys(%$usedTriples) );
	print "$i: " . join(", ", keys(%$usedTriples)) . "\n";

	if ($numTriples > $maxTriples) {
	    $maxTriples = $numTriples;
	    $maxNumSoFar = $i;
	}
    }
}

print "FINAL: $maxNumSoFar $maxTriples\n";
