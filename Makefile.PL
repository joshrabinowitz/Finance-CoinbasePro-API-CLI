use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME             => 'Finance::CoinbasePro::API::CLI',
    AUTHOR           => q{Josh Rabinowitz <joshr@joshr.com>},
    VERSION_FROM     => 'lib/Finance/CoinbasePro/API/CLI.pm',
    ABSTRACT_FROM    => 'lib/Finance/CoinbasePro/API/CLI.pm',
    LICENSE          => 'artistic_2',
    PL_FILES         => {},
    MIN_PERL_VERSION => '5.006',
    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => '0',
    },
    BUILD_REQUIRES => {
        'Test::More'         => '0',
    },
    PREREQ_PM => {
        'Finance::GDAX::API' => '0.09',
        'FindBin'           => 0,
        'File::HomeDir'     => 0,
        'Mouse'             => 0,
        'Date::Parse'       => 0,
        'Data::Dump'        => 0,
        'JSON'              => 0,
        'List::Util'        => 0,
        'Number::Format'    => 0,
        'Pod::Autopod'      => 0,
        'Config::INI'       => 0,
        'Mouse'             => 0,
        'Time::Moment'      => 0,
    },
    dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean => { FILES => 'Finance-CoinbasePro-API-CLI-*' },
);
