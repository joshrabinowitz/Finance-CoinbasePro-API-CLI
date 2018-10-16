package Finance::CoinbasePro::API::CLI::Util::Config;

use File::HomeDir;       # my $home     = File::HomeDir->my_home;
use File::Spec::Functions qw(catfile);
use Config::INI::Reader;
use List::Util qw(first);

use base qw(Exporter);
our @EXPORT_OK = qw( get_config_filename get_config );

sub get_config_filename {
    my $user_config = catfile( File::HomeDir->my_home(), ".coinbasepro" );
    my $etc_config = catfile( "/etc/", ".coinbasepro" );
    my $config = first { -f $_ } ( $user_config, $etc_config );
}

sub get_config {
    my $filename = shift;
    my $config_hash = Config::INI::Reader->read_file( $filename );
    return $config_hash;
}

1;
