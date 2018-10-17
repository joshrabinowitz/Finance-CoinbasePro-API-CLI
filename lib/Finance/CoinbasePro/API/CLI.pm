package Finance::CoinbasePro::API::CLI
  ;    # Command-line interface to GDAX / Coinbase Pro

use 5.006;
use strict;
use warnings;

=head1 NAME

Finance::CoinbasePro::API::CLI - Command-line interface to GDAX / Coinbase Pro

=cut

our $VERSION = '0.006';

=head1 SYNOPSIS

Provides a command-line interface to Coinbase Pro (no longer GDAX).

    % bin/coinbasepro.pl
    coinbasepro.pl: first param is action to perform (top|buy|sell|products|accounts|orders|quotes|trades|fills|cancel|cancelall)
    coinbasepro.pl (top|buy|sell|products|accounts|orders|quotes|trades|fills|cancel|cancelall)
       [--verbose] [--dryrun] [--product=BTC-USD] [--price=N] [--size=N] [--cancel]:
       shows data from GDAX/Coinbase Pro
        for example: coinbasepro.pl quotes --product=BTC-USD  or  coinbasepro.pl products


=head1 AUTHOR

joshr, C<< <joshr at joshr.com> >>


=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Finance::CoinbasePro::API::CLI

=over 4

=item * Search CPAN

L<https://metacpan.org/release/Finance-CoinbasePro-API-CLI>

=back

=head1 ACKNOWLEDGEMENTS

=head1 LICENSE AND COPYRIGHT

Copyright 2018 Josh Rabinowitz

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


=cut

1;    # End of Finance::CoinbasePro::API::CLI

#################### pod generated by Pod::Autopod - keep this line to make pod updates possible ####################

=head1 NAME

Finance::CoinbasePro::API::CLI - Command-line interface to GDAX / Coinbase Pro


=head1 DESCRIPTION

pod generated by Pod::Autopod - keep this line to make pod updates possible ####################


=head1 REQUIRES

L<5.006> 


=head1 METHODS


=cut

