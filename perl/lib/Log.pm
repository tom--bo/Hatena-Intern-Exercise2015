package Log;
use strict;
use warnings;

use DateTime;

sub new {
    my ($class, %args) = @_;
    return bless \%args, $class;
}

sub protocol {
    my $self = shift;
    my $ret = (split(/ /, $self->{req}))[2];
    return $ret;
}

sub method {
    my $self = shift;
    my $ret = (split(/ /, $self->{req}))[0];
    return $ret;
}

sub path {
    my $self = shift;
    my $ret = (split(/ /, $self->{req}))[1];
    return $ret;
}

sub uri {
    my $self = shift;
    my $u = "";
    my $p = (split(/ /, $self->{req}))[1];
    $self->{referer} =~ m{(.*//)};
    $u .= $1.$self->{host}.$p;

    return $u;
}

sub time {
    my $self = shift;
    my $dt = DateTime->from_epoch(epoch => $self->{epoch}, time_zone => 'UTC'); 
    # GMT == UTC
    return $dt->ymd('-')."T".$dt->hms(':');
}

1;
