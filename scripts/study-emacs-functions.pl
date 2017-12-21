#!/usr/bin/perl -w

use Data::Dumper;

my $outputfile = "/home/andrewd/clear/emacs-analysis.perl";
my $symbols;
if (! -f $outputfile) {
  foreach my $file (split /\n/, `locate el | grep '\.el\$'`) {
    if (-f $file and `file $file` =~ /Lisp\/Scheme program text/) {
      my $al;
      foreach my $l (split /\n/,`cat $file`) {
	$l =~ s/\;.*//;
	# print $l."\n";
	$al .= $l;
      }
      foreach my $symbol (split /[^\w-]+/,$al) {
	$symbols->{$symbol}++;
      }
    }
  }

  my $OUT; open(OUT, ">/tmp/out") or die "ouch\n"; 
  print OUT Dumper($symbols);
  close(OUT);

  if (1) {
    foreach my $symbol (sort {$symbols->{$b} <=> $symbols->{$a}} keys %$symbols) {
      print $symbols->{$symbol} ."\t\t".$symbol."\n";
    }
  }
} else {
  my $c = `cat $outputfile`;
  $symbols = eval $c;
}

# now define these entries
