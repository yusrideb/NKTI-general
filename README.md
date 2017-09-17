# Module NKTI::general version 0.15

The Part of Prototype CellBIS Weh Framework.

## DESCRIPTION :

This module only contains several subroutine to give problem solving
about Perl for web.

## INSTALLATION

Install module from source :

    perl Makefile.PL
    make
    make test
    make install
    make clean

or using cpan:

    cpan -i NKTI::general

or using cpanm:

    cpanm NKTI::general

## DEPENDENCIES

If install this module using `cpan` or `cpanm`, dependencies is automatically install in your system.
However, if you install this module from source you must install following dependencies below :

    cpan -i Test::More JSON DBI \
        Data::Dumper LWP::UserAgent \
        HTTP::Request::Common CGI \
        DateTime HTTP::BrowserDetect

## COPYRIGHT AND LICENCE

Copyright (C) 2017 by Achmad Yusri Afandi

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.12.0 or,
at your option, any later version of Perl 5 you may have available.


