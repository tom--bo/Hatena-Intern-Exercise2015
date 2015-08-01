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
