#!usr/bin/perl

use strict 'vars';

our $Debug = 1;

my $max = 10000;

my $nonLychrelNums;
my $lychrelNums;

foreach my $num (1,2,3,4,5,6, 196, 4994, 4994) {
    print "$num: " . isNonLychrel($num, 50, 0) . "\n";

    print $nonLychrelNums->{$num} . "\n";
}

#exit;

my $count = 0;
for my $i (1..$max) {
    unless (isNonLychrel($i, 50, 0)) {
	$count++;
	print "Lychrel: $i\n";
    }
}

print "Lychrel Nums: $count\n";

foreach my $num (1,2,3,4,5,6, 196, 4994) {
    print "$num: " . isNonLychrel($num, 50, 0) . "\n";

    print $nonLychrelNums->{$num} . "\n";
}

sub isNonLychrel {
    my $val = shift;
    my $step = shift;
    my $includeSelf = shift;

    if ($step == 0) {
	return 0;
    }

    if ($nonLychrelNums->{$val}) {
	return 1;
    }

    if ($includeSelf) {
	if (isPalindrome($val)) {
	    return 1;
	}
    }

    my $isNonLychrel = isNonLychrel( $val + reverse($val), $step - 1, 1);

    if ($isNonLychrel) {
	$nonLychrelNums->{$val} = 1;
    }

    return $isNonLychrel;
}

sub isPalindrome {
    my $val = shift;

    return $val == reverse($val);
}
