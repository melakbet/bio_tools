#! /usr/bin/env perl
use strict;
use warnings;

my $in_dir="vcf_step2";
my $out_dir="vcf_step3";
my $script="filter_dp_qual.pl";
`mkdir $out_dir` if(!-e $out_dir);
my @vcf=<$in_dir/*.gz>;

open O,"> $0.sh";
foreach my $vcf(@vcf){
    $vcf=~/([^\/]+)$/;
    my $id=$1;
    my $out="$out_dir/$id";
    print O "perl $script $vcf $out\n";
}
close O;
