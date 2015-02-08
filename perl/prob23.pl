#!usr/bin/perl

use strict 'vars';

our $Debug = 0;

my $max = 28123;

my $abundantNumbers;

for my $i (1..$max) {
    my $divisors = getDivisors( $i );
    my $sum = 0;
    map { $sum += $_; } @$divisors;

    push (@$abundantNumbers, $i) if ($sum > $i);
}

if ($Debug) {
    foreach my $abundNum (@$abundantNumbers) {
	print "AB: $abundNum\n";
    }
}

my $numAbundant = scalar(@$abundantNumbers);
print "Num abundant numbers: $numAbundant\n";

my ($allVals, $maxNum) = ({}, 0);
for my $i (0..$numAbundant-1) {
    for my $j ($i..$numAbundant-1) {
	my $sum = $abundantNumbers->[$i] + $abundantNumbers->[$j];
	$allVals->{$sum} = 1;
	$maxNum = $sum if $sum > $maxNum;
    }
}

my $sum = 0;
foreach my $i (0..$max) {
    $sum += $i unless ($allVals->{$i});
}

print "SUM: $sum\n";

sub getDivisors {
    my $val = shift;

    my $max = int ( sqrt( $val ) );

    my $divisors = [1];
    for my $i (2..$max) {
	if ($val % $i == 0) {
	    push (@$divisors, $i);
	    push (@$divisors, $val/$i) if ($val/$i != $i);
	}
    }

    return $divisors;
}
