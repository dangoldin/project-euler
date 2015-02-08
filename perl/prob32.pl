#!usr/bin/perl

use strict 'vars';
use Math::Prime::TiedArray;

our $Debug = 0;

my $max = 9999;

my $panNums;
foreach my $i (1..$max) {
    foreach my $j ($i..$max) {
	my $prod = $i * $j;

	my $num = '' . $prod . $i . $j;

	if (length($num) == 9 && isPandigital($num) ) {
	    $panNums->{$prod} = 1;
	    print "$i $j $prod\n";
	}
    }
}

my $sum = 0;
foreach my $num (keys(%$panNums)) {
    $sum += $num;
    print "$num\n";
}
print "SUM: $sum\n";

sub isPandigital {
    my $val = shift;

    foreach my $i (1..length($val)) {
	return 0 if !($val =~ /$i/);
    }
    return 1;
}
