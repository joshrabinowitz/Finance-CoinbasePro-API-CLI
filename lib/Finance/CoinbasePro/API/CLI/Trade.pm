package Finance::CoinbasePro::API::CLI::Trade;  # this knows about Finance::GDAX::Fill objects and can display them
use Mouse;
use Finance::CoinbasePro::API::CLI::Util::DateUtil qw(my_str2time);
use Data::Dump;

use Finance::CoinbasePro::API::CLI::Value;
use Finance::CoinbasePro::API::CLI::Util::DateUtil qw(convert_seconds_to_human_time);

has 'price' => (is=>'rw', isa=>'Num', required=>1); #price    => "6235.00000000",
has 'side' => (is=>'rw', isa=>'Str', required=>1);  #side     => "sell",
has 'size' => (is=>'rw', isa=>'Num', required=>1);  #size     => "0.001", 
has 'time' => (is=>'rw', isa=>'Str', required=>1);  # time     => "2018-10-15T14:15:29.597Z",
has 'trade_id' => (is=>'rw', isa=>'Int', required=>1);  # trade_id => 2164597,

# returns a string 
sub to_str {
    my $self = shift;
    #return Data::Dump::dump($self);
    return "Trade: $self->{time}: $self->{side} $self->{size} units at $self->{price}: trade_id $self->{trade_id}";
}
sub ago {
    my $date = shift;
    return convert_seconds_to_human_time( time() - my_str2time( $date )  ) . " ago";
}

1;






#################### pod generated by Pod::Autopod - keep this line to make pod updates possible ####################

=head1 NAME

Finance::CoinbasePro::API::CLI::Trade - this knows about Finance::GDAX::Fill objects and can display them


=head1 DESCRIPTION

returns a string 


=head1 REQUIRES

L<Finance::CoinbasePro::API::CLI::Util::DateUtil> 

L<Finance::CoinbasePro::API::CLI::Value> 

L<Data::Dump> 

L<Finance::CoinbasePro::API::CLI::Util::DateUtil> 

L<Mouse> 


=head1 METHODS

=head2 ago

 ago();

=head2 to_str

 to_str();

returns a string



=cut

