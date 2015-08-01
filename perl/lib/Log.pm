package Log; use strict;
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

sub timeToMin {
    my $self = shift;
    my $dt = DateTime->from_epoch(epoch => $self->{epoch}, time_zone => 'UTC'); 
    return $dt->strftime('%Y-%m-%d %H:%M');
}

sub to_hash {
    my $self = shift;
    my %h;
    $h{'time'} = $self->time if $self->{epoch};
    $h{'method'} = $self->method if $self->{req};
    $h{'status'} = $self->{status} if $self->{status};
    $h{'user'} = $self->{user} if $self->{user};
    $h{'referer'} = $self->{referer} if $self->{referer};
    $h{'size'} = $self->{size} if $self->{size};
    $h{'uri'} = $self->uri if $self->{size} && $self->{referer} && $self->{host};
    return \%h;
}

sub status {
    my $self = shift;
    my $ret = $self->{status};
    return $ret;
}

sub user {
    my $self = shift;
    my $ret = $self->{user};
    return $ret;
}

1;
