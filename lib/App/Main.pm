package App::Main;
use Mojo::Base 'Mojolicious::Controller';

sub index {
  my $self = shift;
  $self->render('main/index');
}
