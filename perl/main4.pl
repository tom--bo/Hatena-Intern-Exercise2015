use strict;
use warnings;

use Data::Dumper;

use Parser;
use AggregationByTime;

my $parser = Parser->new( filename => '../sample_data/large_log.ltsv' );
my $aggregated = AggregationByTime->new($parser->parse);

# my @times = $aggregated->times;
# foreach my $time (@times) {
#     print $time, "\n";
# }

my %times = $aggregated->aggregateByMin;
for my $key (sort keys %times) {
    print "$key: ";
    for (1..$times{$key}) {
        print "=";
    }
    print "\n";
}


