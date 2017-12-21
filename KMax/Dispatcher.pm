package KMax::Dispatcher;

# use Capability::TextAnalysis;
use KBS::Util;
use Sayer;

use Data::Dumper;

use Class::MethodMaker
  new_with_init => 'new',
  get_set       =>
  [

   qw / MySayer Codes HasBeenInitialized /

  ];

sub init {
  my ($self,%args) = @_;
  # my functions, store them, or at least cache them, in a DB, no?
  $self->MySayer($args{Sayer} || Sayer->new(DBName => $args{DBName} || "kmax"));

  # replace this with the appropriate code (both in terms of finding
  # functions more automatically and also in terms of fixing the file
  # based repository)
  my $functionsfile = $UNIVERSAL::systemdir."/data/functions.pl";
  my $c = `cat "$functionsfile"`;
  my $VAR1;
  eval $c;
  my $data = $VAR1;
  $VAR1 = undef;
  $self->Codes($data);
  $self->HasBeenInitialized({});
}

sub Functions {
  my ($self,%args) = @_;
  return RelationToString
    (
     Type => "Emacs",
     Relation => [keys %{$self->Codes}],
    );
}

sub Execute {
  my ($self,%args) = @_;
  if (exists $args{Key}) {
    my $key = $args{Key};
    if (! exists $self->HasBeenInitialized->{$key}) {
      print "Initializing $key\n";
      if (exists $self->Codes->{$key} and exists $self->Codes->{$key}->{Init}) {
	&{$self->Codes->{$key}->{Init}}();
      }
      $self->HasBeenInitialized->{$key} = 1;
    }
    return [
	    $self->MySayer->ExecuteCodeOnData
	    (
	     CodeRef => $self->Codes->{$key}->{Code},
	     Data => $args{Data},
	     # Overwrite => (exists $overwrite->{$key}),
	     # NoRetrieve => $args{NoRetrieve},
	     # Skip => $args{Skip},
	    )
	   ];

  }
}

1;
