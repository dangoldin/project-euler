#!/usr/bin/perl

use strict 'vars';

#use Math::Prime::TiedArray;
use Math::Big::Factors;

#my $wheel = Math::Big::Factors::wheel(4);

#print $wheel->[0], $wheel->[1], $wheel->[2], $wheel->[3], "\n";

our $Debug = 0;

my $seenNumbers = {};
my $factorHash = {};

my ($min, $max) = (2,100);

foreach my $a ($min..$max) {
    my $factors = [ Math::Big::Factors::factors_wheel($a, 4) ];

    $factorHash->{$a} = $factors;

    print "$a " . join (", ", @$factors);
    print "\n";

    foreach my $b ($min..$max) {
	my $newArray = [];
	foreach my $i (1..$b) {
	    push (@$newArray, @$factors)
	}
	$newArray = [ sort @$newArray ];
	my $key = join("-", @$newArray);
	print "$key\n" if $Debug;
	$seenNumbers->{ $key } = 1;
    }
}

print "Seen nums: " . join(", ", keys(%$seenNumbers)) . "\n" if $Debug;

print "Unique nums: " . scalar(keys(%$seenNumbers)) . "\n";
