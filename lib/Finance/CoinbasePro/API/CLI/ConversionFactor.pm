package Finance::CoinbasePro::API::CLI::ConversionFactor;
use Mouse;
use Finance::CoinbasePro::API::CLI::Value;

has 'from_currency'  => ( is=>'rw', isa=>"Str", required=>1 );
has 'to_currency'    => ( is=>'rw', isa=>"Str", required=>1 );
has 'factor'         => ( is=>'rw', isa=>"Num", required=>1 );

1;
