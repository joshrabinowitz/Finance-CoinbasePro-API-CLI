package Finance::CoinbasePro::API::CLI::Account; # this knows about Finance::GDAX::Fill objects and can display them
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

1;




#################### pod generated by Pod::Autopod - keep this line to make pod updates possible ####################

=head1 NAME

Finance::CoinbasePro::API::CLI::Account


=head1 DESCRIPTION

this knows about Finance::GDAX::Fill objects and can display them


=head1 REQUIRES

L<Finance::CoinbasePro::API::CLI::Util::CurrencyUtil> 

L<Data::Dump> 

L<Mouse> 


=head1 METHODS

=head2 balance

 balance();

=head2 hold

 hold();

=head2 to_str

 to_str();

=head2 to_str_with_usd

 to_str_with_usd();

=cut

