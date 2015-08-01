package AggregationByTime;
use strict;
use warnings;

use Parser;
use DateTime;

my $logsCount = 0;

sub new {
    my ($class, $logs) = @_;
    $logsCount = @$logs;
    return bless { logs => $logs }, $class;
};

# サンプルのログの時間を列挙
sub times {
    my $self = shift;
    my @times;
    foreach my $i (0..$logsCount - 1) {
        push @times, $self->{logs}->[$i]->timeToMin;
    }

    return @times;
}

sub aggregateByMin {
    my $self = shift;
    my %ret;

    foreach my $i (0..$logsCount - 1) {
        if(defined $ret{$self->{logs}->[$i]->timeToMin}) {
            $ret{$self->{logs}->[$i]->timeToMin}++;
        } else {
            $ret{$self->{logs}->[$i]->timeToMin} = 0;
        }
    }

    return %ret;
}

1;
