package KMax::Util::KeyBindings;

use PerlLib::SwissArmyKnife;
use SPSE2::GUI::Util::TextWindow;

use Class::MethodMaker
  new_with_init => 'new',
  get_set       =>
  [

   qw / KeyBindings State Name HashT2E HashE2T MyGUI NonEvalActions
   MyMainWindow /

  ];

sub init {
  my ($self,%args) = @_;
  $self->MyGUI($args{MyGUI});
  $self->MyMainWindow($args{MainWindow} || $self->MyGUI->MyMainWindow);
  $self->State([]);
  $self->HashE2T({});
  $self->HashT2E
    ({
      "Control" => "C",
      "Alt" => "M",
      "space" => ' ',
      "exclam" => '!',
      "quotedbl" => '"',
      "numbersign" => '#',
      "dollar" => '$',
      "percent" => '%',
      "ampersand" => '&',
      # "quoteright" => '',
      "parenleft" => '(',
      "parenright" => ')',
      "asterisk" => '*',
      "plus" => '+',
      "comma" => ',',
      "minus" => '-',
      "period" => '.',
      "slash" => '/',
      "colon" => ':',
      "semicolon" => ';',
      "less" => '<',
      "equal" => '=',
      "greater" => '>',
      "question" => '?',
      "bracketleft" => '[',
      "backslash" => '\\',
      "bracketright" => ']',
      # "asciicircum" => '',
      "underscore" => '_',
      # "quoteleft" => '',
      "braceleft" => '{',
      "bar" => '|',
      "braceright" => '}',
      "asciitilde" => '~',
     });
  foreach my $key (keys %{$self->HashT2E}) {
    $self->HashE2T->{$self->HashT2E->{$key}} = $key;
  }
  $self->LoadKeyBindings
    (KeyBindingsFile => $args{KeyBindingsFile});
  $self->NonEvalActions
    ({
      "NonEval:Exit" => sub {
	$self->MyGUI->Exit();
      },
     });
}

sub LoadKeyBindings {
  my ($self,%args) = @_;
  die "No KeyBindings File" unless -f $args{KeyBindingsFile};
  my $c = read_file($args{KeyBindingsFile});
  my @lines = split /\n/, $c;
  my $seen = {};
  $self->KeyBindings({});
  while (@lines) {
    my $line = shift @lines;
    if ($line =~ /^\s*#/) {
      next;
    }
    if ($line =~ /^/) {
      shift @lines;
      shift @lines;
      shift @lines;
      shift @lines;
    } elsif ($line =~ /^$/) {

    } elsif ($line =~ /^(.+?)\t+(.+)$/) {
      my $keyseq = $1;
      my $command = $2;
      # print "<$keyseq><$command>\n";

      my $ref = $self->KeyBindings;
      # C-c r l m   thing1
      # C-c r l s   thing2

      my @keys = split /\s+/, $keyseq;
      while (@keys) {
	my $key = shift @keys;
	if (! $seen->{$key}) {
	  $seen->{$key} = $self->ProcessKey(Key => $key);
	}
	if (! exists $ref->{$key}) {
	  if ($command eq "Prefix Command" or $command eq "Control-X-prefix") {
	    $ref->{$key} = {};
	    $ref = $ref->{$key};
	  } else {
	    # if there are additional items, 
	    if (scalar @keys) {
	      $ref->{$key} = {};
	      $ref = $ref->{$key};
	    } else {
	      $ref->{$key} = $command;
	    }
	  }
	} else {
	  if ($command eq "Prefix Command" or $command eq "Control-X-prefix") {
	    $ref = $ref->{$key};
	  } else {
	    # if there are additional items, 
	    if (scalar @keys) {
	      $ref = $ref->{$key};
	    } else {
	      $ref->{$key} = $command;
	    }
	  }
	}
      }
    }
  }
}

sub ProcessKey {
  my ($self,%args) = @_;
  return $args{Key};
}

sub GenerateGUI {
  my ($self,%args) = @_;
  # now use this to develop an application which 
  my $mw = $args{MyMainWindow};
  foreach my $symbol ("A".."Z", "a".."z", "0".."9", qw(! " $ % & * + - . / : ; < = > ? [ ] _ { } ~), "(",")","\\",'#',",","|"," ") {
    foreach my $operator (qw(Control Alt)) {
      my $string = $self->GetTkKeyFromEmacsKey(Operator => $operator, Symbol => $symbol);
      # print Dumper($string);
      $mw->bind
	(
	 'all',
	 $string,
	 sub {
	   $self->IssueKey(Key => $self->GetEmacsKeyFromTkKey(Operator => $operator, Symbol => $symbol));
	 },
	);
    }
    my $string = $self->GetTkKeyFromEmacsKey(Symbol => $symbol);
    # print Dumper($string);
    $mw->bind
      (
       'all',
       $string,
       sub {
	 $self->IssueKey(Key => $self->GetEmacsKeyFromTkKey(Symbol => $symbol));
       },
      );
  }
  $self->Name($args{Minibuffer});
}

sub GetTkKeyFromEmacsKey {
  my ($self,%args) = @_;
  my $response;
  if (defined $args{Operator}) {
    $response .= $args{Operator}."-";
  }
  if (defined $args{Symbol}) {
    if (exists  $self->HashE2T->{$args{Symbol}} and $args{Symbol} !~ /^[A-Z]$/) {
      $response .= $self->HashE2T->{$args{Symbol}};
    } else {
      $response .= $args{Symbol};
    }
  }
  return "<".$response.">";
}

sub GetEmacsKeyFromTkKey {
  my ($self,%args) = @_;
  my $response;
  if (defined $args{Operator}) {
    $response = $self->HashT2E->{$args{Operator}}."-";
  }
  if (defined $args{Symbol}) {
    $response .= $args{Symbol};
  }
  return $response;
}

sub IssueKey {
  my ($self,%args) = @_;
  my $ref = $self->KeyBindings;
  my @keys = @{$self->State};

  # determine if the key press is legal, if it is legal, determine if
  # it is a leaf or not, if it is a leaf, display the command in the
  # text window, otherwise, shift the state

  # we assume that the current state is already legal, test the move
  # for legality

  # first load the hash corresponding to the current state
  while (@keys) {
    my $key = shift @keys;
    if (! exists $ref->{$key}) {
      # error, state is invalid, this shouldn't happen
      print "ERROR: wrong state\n";
    } else {
      my $ref2 = ref $ref->{$key};
      if ($ref2 eq "HASH") {
	# go ahead and set the current hash to this item
	$ref = $ref->{$key};
      } else {
	print "ERROR: should not see a non-hash, state corrupt\n";
      }
    }
  }
  # ref should be loaded

  # now test for legality
  if (! exists $ref->{$args{Key}}) {
    # it is possible that we are issuing a C-g, C-h, etc, handle those here
    if ($args{Key} eq "C-g") {
      $self->State([]);
      $self->Display(Item => "keyboard-quit");
    } elsif ($args{Key} eq "C-h") {
      SPSE2::GUI::Util::TextWindow->new
	  (
	   Height => 400,
	   Width => 1280,
	   MainWindow => $self->MyMainWindow,
	   Title => "Print all keys available here",
	   Contents => $self->GenKeyBindingsSummaryForStateAndKeyBindings(KeyBindings => $ref),
	  );
      # $self->Display(Item => Dumper($ref));
      $self->State([]);
    } else {
      $self->Display(Item => "Unbound key sequence: ".join(" ", @{$self->State},$args{Key}));
      $self->State([]);
    }
  } else {
    # check if it is a leaf node or not
    my $ref2 = ref $ref->{$args{Key}};
    if ($ref2 eq "HASH") {
      # not a leaf node
      # simply advance the state
      push @{$self->State}, $args{Key};
      $self->Display(Item => join(" ", @{$self->State})." -");
    } else {
      # it is a leaf, execute the action
      my $action = $ref->{$args{Key}};
      $self->Display(Item => $action);
      $self->State([]);

      # first, however, determine if it happens to be something that
      # should not be run in an eval loop
      if (exists $self->NonEvalActions->{$action}) {
	$self->NonEvalActions->{$action}->();
      } else {
	eval $action;
      }
    }
  }
  # print "\tState: ".join(" ",@{$self->State})."\n";
}

sub Display {
  my ($self,%args) = @_;
  $self->Name->Contents(Contents => $args{Item});
}

sub GenKeyBindingsSummaryForStateAndKeyBindings {
  my ($self,%args) = @_;
  my $stateprefix = join(" ",@{$self->State});
  my @list;
  foreach my $postfix (@{$self->GenKeyBindingsSummaryForStateAndKeyBindingsRecursive
		       (KeyBindings => $args{KeyBindings})}) {
    push @list, $stateprefix." :: ".$postfix;
  }
  return join("\n", @list);
}

sub GenKeyBindingsSummaryForStateAndKeyBindingsRecursive {
  my ($self,%args) = @_;
  my @return;
  if (ref($args{KeyBindings}) eq 'HASH') {
    foreach my $key (sort keys %{$args{KeyBindings}}) {
      foreach my $listelement (@{$self->GenKeyBindingsSummaryForStateAndKeyBindingsRecursive(KeyBindings => $args{KeyBindings}->{$key})}) {
	push @return, $key." ".$listelement;
      }
    }
  } else {
    push @return, "\t".$args{KeyBindings};
  }
  return \@return;
}

1;
