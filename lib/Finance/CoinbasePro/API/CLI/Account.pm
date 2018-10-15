package Finance::CoinbasePro::API::CLI::Account;
# this knows about Finance::GDAX::Fill objects and can display them
use Mouse;
use Data::Dump qw(dump);
use Finance::CoinbasePro::API::CLI::Util::CurrencyUtil qw(format_usd format_currency );

has 'balance'    => ( is=>'rw', isa=>"Num", required=>1 );
has 'currency'   => ( is=>'rw', isa=>"Str", required=>1 );
has 'available'  => ( is=>'rw', isa=>"Num", required=>1 );
has 'hold'       => ( is=>'rw', isa=>"Num", required=>1 );
has 'id'         => ( is=>'rw', isa=>"Str", default=>'' );
has 'profile_id' => ( is=>'rw', isa=>"Str", default=>'' );

sub balance {
    my $self = shift;
    return Finance::CoinbasePro::API::CLI::Value->new( num => $self->{balance}, currency => $self->{currency} );
}
sub hold {
    my $self = shift;
    return $self->{hold} || 0;
}
sub to_str {
    my $self = shift;
    my $balance = $self->balance(); 
    my $str = format_currency( $self->balance, $self->currency );
    #  available => "3468.65944081011515", balance => "3468.6594408101151500", currency => "USD", hold => "0.0000000000000000",
    #  id => "2b81d28b-249b-416d-9ade-720301443d82", #  profile_id => "18f975e3-6d43-4127-aca5-7d2c13b2ea31",
    if ((my $hold = $self->hold()) > 0) {
        $str .= " ($hold held)";    # should be a J:D:Value
    }
    return $str;
}

sub to_str_with_usd {
    my ($self, $per_usd) = @_;
    my $str = $self->to_str();
    if ($self->{currency} ne "USD") {
        $str .= " " . format_usd( $self->{balance}, $self->{currency}. $per_usd );
    }
    return $str;
}

#    if ($account->{str_with_usdbalance} > 0 || $account->{hold} > 0) {
#        printf( "%s: %s", 
#            $account->{currency}, 
#            $account->{currency} eq "USD" ? format_usd($account->{balance}) : format_crypto_with_usd( $account->{balance}, "BTC", $ticker->{price} ) 
#        );
#        if ($account->{hold} > 0) {
#            printf( " (held: %04.08f)", $account->{hold} );
#        }
#        printf( " " );
#    }
#}
    
1;