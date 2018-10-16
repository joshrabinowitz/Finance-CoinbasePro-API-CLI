package Finance::CoinbasePro::API::CLI::Fill;
# this knows about Finance::GDAX::Fill objects and can display them
use Mouse;
use Finance::CoinbasePro::API::CLI::Util::CurrencyUtil qw(format_currency);
use Finance::CoinbasePro::API::CLI::Util::DateUtil qw(getdatetime convert_seconds_to_human_time my_str2time);
use Finance::CoinbasePro::API::CLI::Value;

has 'created_at' => (is=>'rw', isa=>'Str', required=>1 ); # created_at => "2017-10-31T20:34:14.675Z",
has 'fee' => (is=>'rw', isa=>'Num', required=>1 ); # fee => 0.0044347376379036,
has 'liquidity' => (is=>'rw', isa=>'Str', required=>1 ); # liquidity => "T",
has 'order_id' => (is=>'rw', isa=>'Str', required=>1 ); # order_id => "45eb4883-ed4f-4df5-bf0d-fde87dad2339",
has 'price' => (is=>'rw', isa=>'Num', required=>1 ); # price => "0.04804000",
has 'product_id' => (is=>'rw', isa=>'Str', required=>1 ); # product_id => "ETH-BTC",
has 'profile_id' => (is=>'rw', isa=>'Str', required=>1 ); # profile_id => "18f975e3-6d43-4127-aca5-7d2c13b2ea31",
has 'settled' => (is=>'rw', isa=>'Bool', required=>1 ); # settled => '0',
has 'side' => (is=>'rw', isa=>'Str', required=>1 ); # side => "sell",
has 'size' => (is=>'rw', isa=>'Num', required=>1 ); # size => 30.77114653,
has 'trade_id' => (is=>'rw', isa=>'Num', required=>1 ); # trade_id => 1736807,
has 'volume' => (is=>'rw', isa=>'Maybe[Num]', ); # usd_volume => undef,
has 'user_id' => (is=>'rw', isa=>'Str', required=>1 ); # user_id => "513378df5210ff660900002b",

sub source_offset {
    my $self = shift;
    my $offset = $self->{size};
    if ($self->{side} eq "sell") { $offset = -$offset }
    return Finance::CoinbasePro::API::CLI::Value->new( num=>$offset, currency=>$self->source_currency() );
}
sub source_currency {
    my $self = shift;
    my (@n) = split(/-/, $self->{product_id}, 2);
    return $n[0];
}
sub destination_offset {
    my $self = shift;
    my $offset = $self->{size} * $self->{price};
    if ($self->{side} eq "buy") { $offset = -$offset }
    return Finance::CoinbasePro::API::CLI::Value->new( currency=>$self->destination_currency, num=>$offset );
}
sub destination_currency {
    my $self = shift;
    my (@n) = split(/-/, $self->{product_id}, 2);
    return $n[1];
}


# returns a string like '2018-06-13 11:14:11: buy BTC-USD: 10.00000000 BTC at $7,000.00, cost $70,000.00'
sub to_str {
    my $self = shift;
    my ($from_currency, $to_currency) = split(/-/, $self->{product_id});
    my $offset = $self->{size} * $self->{price};
    if ($self->{side} eq "buy") { $offset = -$offset }
    my $str = sprintf( "%s: %s %s: %s at %s, offset %s",
        #ago( $self->{created_at} ), 
        reformat_datetime( $self->{created_at} ),
        $self->{side}, # buy/sell
        $self->{product_id}, 
        format_currency($self->{size}, $from_currency),
        format_currency($self->{price}, $to_currency), 
        format_currency($offset, $to_currency) 
    );

    return $str;
}
sub reformat_datetime {
    my $s = shift;
    print "$0: converting time $s\n";
    
    my $t ; #= my_str2time( $s );
    if (! $t) {
        $t = my_str2time( $s );
       # my $dt = DateTime::Format::ISO8601->parse_datetime( $s );
       # $t = $dt->datetime();
    }

    print " to epoch $t\n";
    return getdatetime( $t );
}
sub ago {
    my $date = shift;
    return convert_seconds_to_human_time( time() - my_str2time( $date )  ) . " ago";
}

1;
__END__
created_at => "2017-10-31T20:34:14.675Z",
fee => 0.0044347376379036,
liquidity => "T",
order_id => "45eb4883-ed4f-4df5-bf0d-fde87dad2339",
price => "0.04804000",
product_id => "ETH-BTC",
profile_id => "18f975e3-6d43-4127-aca5-7d2c13b2ea31",
settled => bless(do{\(my $o = 1)}, "JSON::PP::Boolean"),
side => "sell",
size => 30.77114653,
trade_id => 1736807,
usd_volume => undef,
user_id => "513378df5210ff660900002b",




#################### pod generated by Pod::Autopod - keep this line to make pod updates possible ####################

=head1 NAME

Finance::CoinbasePro::API::CLI::Fill


=head1 DESCRIPTION

this knows about Finance::GDAX::Fill objects and can display them


=head1 REQUIRES

L<Finance::CoinbasePro::API::CLI::Value> 

L<Finance::CoinbasePro::API::CLI::Util::DateUtil> 

L<Finance::CoinbasePro::API::CLI::Util::CurrencyUtil> 

L<Mouse> 


=head1 METHODS

=head2 ago

 ago();

=head2 destination_currency

 destination_currency();

=head2 destination_offset

 destination_offset();

=head2 reformat_datetime

 reformat_datetime();

=head2 source_currency

 source_currency();

=head2 source_offset

 source_offset();

=head2 to_str

 to_str();

returns a string like '2018-06-13 11:14:11: buy BTC-USD: 10.00000000 BTC at $7,000.00, cost $70,000.00'



=cut

