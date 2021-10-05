#!/usr/bin/perl -w

use Getopt::Std;
my %options=();
getopts("hc", \%options);

if (defined $options{h}) {
    print "List memory and CPU usage per user
Usage: usage_per_user.pl [-c]
-c sort by CPU (sort by memory is the default)\n";
exit;
}
$sort_cmd = "sort -rnk 5";
$sort_cmd = "sort -rnk 3" if $options{c};

## Collect ps output
open(A, "ps -e xo pcpu,pmem,tty,ruser |");
my %stats;
while (<A>){
    ## Ignore 1st line
    next if $.==1;
    ## Remove new line character (\n)
    chomp;
    ## Get the CPU% and TTY and USER
    /\s*(\S+)\s+(\S+)\s+(\S+)\s+(\S+)$/;
    ## Add the CPU% ($1) and MEM% ($2) for each TTY ($3) and collect USER ($4), which should be the same per pty
    $stats{$4}{CPU}+=$1;
    $stats{$4}{MEM}+=$2;
}
close(A);

## Sort output. Use 'sort -rnk 3' for CPU% Use 'sort -rnk 5' for MEM%
open(A, "| $sort_cmd");
## The keys of the %stats hash are the different
## TTYs (including '?'). Cycle through and print
foreach (keys(%stats)) {
    printf A "%12s CPU%%: %7.2f  MEM%%: %7.2f\n", $_, $stats{$_}{CPU}, $stats{$_}{MEM};
}
