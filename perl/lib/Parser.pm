package Parser;
use strict;
use warnings;

use Log;

sub new {
    my ($class, %args) = @_;
    return bless \%args, $class;
}

sub parse {
    my $self = shift;
    my $fileName = $self->{filename};
    my $File = open LTSV, $fileName;
    if ( !$File ) {
        die "miss!: $!";
    }
    my @ret;
    while(<LTSV>){
        chomp;
        my @tmp = split(/\t+/, $_);
        my %obj;
        foreach my $val (@tmp){
            $val =~ /([a-z]*):(.*)/;
            $obj{$1} = $2 unless $2 eq '-';
        }
        push(@ret, Log->new(%obj));
    }
    return \@ret;
}

1;
