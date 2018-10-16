use Test::More;

{
    use_ok( 'Finance::CoinbasePro::API::CLI::Account' );
    my $client= Finance::CoinbasePro::API::CLI::Account->new( 
      available => "3468.65944081011515", balance => "3468.6594408101151500", currency => "USD", hold => "0.0000000000000000",
      id => "2b81d28b-249b-416d-9ade-720301443d82", #  profile_id => "18f975e3-6d43-4127-aca5-7d2c13b2ea31",
    );
    is( $client->balance(), "3468.6594408101151500", 'account balance' );
    is( $client->to_str(), '$3,469', 'account as string' );
    is( $client->to_str_with_usd(), '$3,469', 'account as string with usd' );
}

{
    use_ok( 'Finance::CoinbasePro::API::CLI::ConversionFactor' );
    use_ok( 'Finance::CoinbasePro::API::CLI::Converter' );
    my @factors = (
        { from_currency => "BTC", to_currency => "USD", factor=>7500 },
        { from_currency => "ETH", to_currency => "USD", factor=> 250 },
    );
    my $converter = Finance::CoinbasePro::API::CLI::Converter->new( 
        conversions => [
            map { Finance::CoinbasePro::API::CLI::ConversionFactor->new($_) } @factors
        ]
    );
    
    # convert BTC to USD
    my $usd_value = $converter->convert( Finance::CoinbasePro::API::CLI::Value->new( num=>'1', currency=>'BTC' ), 'USD' );
    is( $usd_value->num, 7500, 'BTC to USD price' );
    is( $usd_value->currency, "USD", 'BTC price to USD currency' );

    # convert USD to BTC
    my $btc_value = $converter->convert( Finance::CoinbasePro::API::CLI::Value->new( num=>'1', currency=>'USD' ), 'BTC' );
    is( $btc_value->num, 1/7500, 'USD to BTC price' );
    is( $btc_value->currency, "BTC", 'USD to BTC currency' );
}

{
    use_ok( 'Finance::CoinbasePro::API::CLI::Fill' );
    my $fill = Finance::CoinbasePro::API::CLI::Fill->new( 
        created_at => "2017-09-31T08:34:14.605Z",
        fee => 0.0044311111111111,
        liquidity => "T",
        order_id => "4bbbbbbb-ed4f-4df5-bf0d-faaaaaaaaaaa",
        price => "0.04804000",
        product_id => "ETH-BTC",
        profile_id => "1bbbbbbb-6d43-4127-aca5-7aaaaaaaaaaa",
        settled => 1,
        side => "sell",
        size => 30.11111111,
        trade_id => 1111111,
        usd_volume => undef,
        user_id => "51111111111111111111111z",
    );
}

{
    use_ok( 'Finance::CoinbasePro::API::CLI::Trade' );
}

{
    use_ok( 'Finance::CoinbasePro::API::CLI::Value' );
}

done_testing();

