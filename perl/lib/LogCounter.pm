package LogCounter;
use strict;
use warnings;

use Parser;

my $logsCount = 0;

sub new {
    my ($class, $logs) = @_;
    $logsCount = @$logs;
    return bless { logs => $logs }, $class;
};

# ユーザ名をキーにして、ログを配列に持つハッシュを返す 
sub group_by_user {
    my $self = shift;
    my @ret;
    my %user;

    foreach my $i (0..$logsCount - 1) {
        if(defined $self->{logs}->[$i]->user) {
            if(defined @user{$self->{logs}->[$i]->user}){
                push @user{$self->{logs}->[$i]->user}, $self->{logs}->[$i] 
            } else {
                $user{$self->{logs}->[$i]->user} = [$self->{logs}->[$i]];
            }
        }else{
            if(defined $user{'guest'}){
                push $user{'guest'}, $self->{logs}->[$i] 
            } else {
                $user{'guest'} = [$self->{logs}->[$i]];
            }
        }
    }
    
    return \%user;
    #return $self->{logs}->[0];
}

# 集計結果の$cntを返す.
sub count_error {
    my $self = shift;
    my $cnt = 0;
    foreach my $i (0..$logsCount - 1) {
        $cnt++ if  $self->{logs}->[$i]->status >= 500;
    }

    return $cnt;
}

1;
