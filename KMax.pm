package KMax;

use BOSS::Config;
use KMax::Dispatcher;
use MyFRDCSA;

use Data::Dumper;

use Class::MethodMaker
  new_with_init => 'new',
  get_set       =>
  [

   qw / Config MyDispatcher /

  ];

sub init {
  my ($self,%args) = @_;
  $specification = "
	-u [<host> <port>]	Run as a UniLang agent

	-w			Require user input before exiting
";
  $UNIVERSAL::systemdir = ConcatDir(Dir("internal codebases"),"kmax");
  $UNIVERSAL::agent->DoNotDaemonize(1);
  $self->Config(BOSS::Config->new
		(Spec => $specification,
		 ConfFile => ""));
  my $conf = $self->Config->CLIConfig;
  if (exists $conf->{'-u'}) {
    $UNIVERSAL::agent->Register
      (Host => defined $conf->{-u}->{'<host>'} ?
       $conf->{-u}->{'<host>'} : "localhost",
       Port => defined $conf->{-u}->{'<port>'} ?
       $conf->{-u}->{'<port>'} : "9000");
  }
  $self->MyDispatcher
    (KMax::Dispatcher->new);
}

sub Execute {
  my ($self,%args) = @_;
  my $conf = $self->Config->CLIConfig;
  if (exists $conf->{'-u'}) {
    # enter in to a listening loop
    while (1) {
      $UNIVERSAL::agent->Listen(TimeOut => 10);
    }
  }
  if (exists $conf->{'-w'}) {
    Message(Message => "Press any key to quit...");
    my $t = <STDIN>;
  }
}

sub ProcessMessage {
  my ($self,%args) = @_;
  my $m = $args{Message};
  my $it = $m->Contents;
  if ($it) {
    if ($it =~ /^functions$/) {
      $UNIVERSAL::agent->SendContents
	(Contents => $self->MyDispatcher->Functions,
	 Receiver => $m->{Sender});
    } elsif ($it =~ /^execute$/) {
      $UNIVERSAL::agent->SendContents
	(Data => {
		  _Result => $self->MyDispatcher->Execute
		  (
		   Key => $m->Data->{Key},
		   Data => $m->Data->{Data},
		  ),
		 },
	 Receiver => $m->{Sender});
    } elsif ($it =~ /^(quit|exit)$/i) {
      $UNIVERSAL::agent->Deregister;
      exit(0);
    }
  }
}

1;
