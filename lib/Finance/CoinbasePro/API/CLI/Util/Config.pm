package Finance::CoinbasePro::API::CLI::Util::Config;
use strict;

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




#################### pod generated by Pod::Autopod - keep this line to make pod updates possible ####################

=head1 NAME

Finance::CoinbasePro::API::CLI::Util::Config


=head1 DESCRIPTION

pod generated by Pod::Autopod - keep this line to make pod updates possible ####################


=head1 REQUIRES

L<List::Util> 

L<Config::INI::Reader> 

L<File::Spec::Functions> 

L<File::HomeDir> my $home     = File::HomeDir->my_home;


=head1 IMPLEMENTS

L<Exporter> 


=head1 METHODS

=head2 get_config

 $self->get_config();

=head2 get_config_filename

 $self->get_config_filename();

=cut

