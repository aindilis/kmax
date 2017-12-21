#!/usr/bin/perl -w

use UniLang::Util::TempAgent;

use Data::Dumper;
use DateTime;

my $tempagent;

LoadTempAgent();
print Dumper
  ($tempagent->MyAgent->QueryAgent
   (
    Receiver => "KMax",
    Contents => "execute",
    Data => {
	     Key => "Tokenization",
	     Data => [{Text => "Andrew Dougherty is an autodidact mathematician
and computer scientist specializing in Artificial Intelligence (AI)
and Algorithmic Information Theory (AIT) . He is the founder of the
FRDCSA project, a practical attempt at weak AI aimed primarily at
collecting and interrelating existing software with theoretical
motivation from AIT. He has made over 90 open source applications, 400
(unofficial) Debian GNU/Linux packages and 800 Perl5 modules (see
http://frdcsa.onshore.net/frdcsa)."}],
	    },
   ));

sub LoadTempAgent {
  if (! defined $tempagent) {
    $tempagent = UniLang::Util::TempAgent->new;
  }
}
