package Finance::CoinbasePro::API::CLI::Trade;
# this knows about Finance::GDAX::Fill objects and can display them
use Mouse;
use Finance::CoinbasePro::API::CLI::Util::CurrencyUtil qw(format_currency);
use Finance::CoinbasePro::API::CLI::Util::DateUtil qw(getdatetime);
use Date::Parse qw(str2time);
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
    return Data::Dump::dump($self);
}
sub ago {
    my $date = shift;
    return convert_seconds_to_human_time( time() - str2time( $date )  ) . " ago";
}

1;
