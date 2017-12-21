#!/usr/bin/perl -w

use KBS::Util;

use Data::Dumper;

my $data = {
	    "Thing" => [
			{
			 "basic1" => 1,
			 "basic2" => 2,
			},
			[
			 "hi",
			 "ho",
			],
		       ],
	    "Both" => 1,
	   };

my $data2 = {
	     "_Result" => [
			   "test",
			  ],
	    };

print PerlDataStructureToStringEmacs
   (DataStructure => $data2);
