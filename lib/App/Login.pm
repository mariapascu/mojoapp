package Moblo::Login;
use Mojo::Base 'Mojolicious::Controller';

sub user_exists {
  my ($username, $password) = @_;

  return ($username eq 'foo' && $password eq 'bar');
}

sub on_user_login {
  my $self = shift;

  my $username = $self->param('uername');
  my $password = $self->param('password');

  return $self->render(text => 'Logged in!')
  if (user_exists($username, $password));

  return $self->render(text => 'Worng username/password', status => 403);
}

sub is_logged_in {
    my $self = shift;

    return 1 if $self->session('logged_in');

    $self->render(
        inline => "<h2>Forbidden</h2><p>You're not logged in. <%= link_to 'Go to login page.' => 'login_form' %>",
        status => 403
    );
}


1;
