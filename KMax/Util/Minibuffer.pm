package KMax::Util::Minibuffer;

use Manager::Dialog qw(Choose2);

use PerlLib::SwissArmyKnife;

use Class::MethodMaker
  new_with_init => 'new',
  get_set       =>
  [

   qw / Name Frame /

  ];

sub init {
  my ($self,%args) = @_;
  my $frame2 = $args{Frame}->Frame();
  my $height = $args{Height} || 1;
  my $width = $args{Width} || 300;
  $self->Name
    ($frame2->Text
     (
      -relief       => 'sunken',
      -borderwidth  => 2,
      -height        => $height,
      -width         => $width,
     ));

  $self->Name->Contents("");

  my %nameargs =
    (
     -side => 'right',
     -fill => 'x',
    );
  if (exists $args{NameArgs}) {
    %nameargs = %{$args{NameArgs}};
    print Dumper(\%nameargs);
  }
  $self->Name->pack
    (
     %nameargs,
    );
  # $self->Name->focus;
  my %frameargs =
    (
     -side => 'bottom',
     -fill => 'x',
    );
  if (exists $args{FrameArgs}) {
    %frameargs = %{$args{FrameArgs}};
    print Dumper(\%frameargs);
  }
  $frame2->pack
    (
     %frameargs,
    );
  $self->Frame($frame2);
}

sub Contents {
  my ($self,%args) = @_;
  $self->Name->Contents($args{Contents});
}

sub TemporarilyEnlarge {
  my ($self,%args) = @_;
  # $self->Name->configure(-height => 5);
}

sub CompletingRead {
  my ($self,%args) = @_;
  # go ahead and take everything and as characters are typed, narrow
  # the results
  # so for instance we want to run this on the set of all of the contexts
  # for now let's just use a choose
  my $res = Choose2
    (
     Title => "Please choose context",
     List => $args{Collection},
     Cancel => 1,
    );
  if (defined $res) {
    return {
	    Success => 1,
	    Result => $res,
	   };
  } else {
    return {
	    Success => 0,
	   };
  }
}

1;
