use warnings;
use strict;
use utf8;

package String::Palindrome;
BEGIN {
  $String::Palindrome::VERSION = '2.000000';
}
BEGIN {
  $String::Palindrome::AUTHORITY = 'cpan:LESPEA';
}

require Exporter;

use vars qw(@EXPORT_OK);
use base qw(Exporter);
@EXPORT_OK = qw(is_palindrome);    # symbols to export on request


# ABSTRACT: Determine if a string is a palindrome




sub is_palindrome {    ## no critic 'Subroutines::RequireArgUnpacking'
                       #  Get the args out
    my $arg =
      @_ > 1
      ? \@_
      : $_[0];

    #  If no arg was given, then return undef
    if ( !defined $arg ) {
        return;
    }

    #  Check to see if we're dealing with a reference
    elsif ( ref $arg ) {

        #  Return immediately if this isn't an array ref or the array ref
        #  contains no values
        return unless ref $arg eq 'ARRAY';
        return unless @$arg;

        for ( my ( $i, $j ) = ( 0, $#{$arg} ) ; $i < $j ; $i++, $j-- )
        {    ## no critic 'ControlStructures::ProhibitCStyleForLoops ValuesAndExpressions::ProhibitCommaSeparatedStatements'
            my ( $a, $b ) = @{$arg}[ $i, $j ];
            if ( !defined $a ) {
                return 0 if defined $b;
            }
            elsif ( !defined $b ) {
                return 0;
            }
            else {
                return 0 unless $a eq $b;
            }
        } ## end for ( my ( $i, $j ) = (...))
        return 1;
    } ## end elsif ( ref $arg )

    else {
        return ( $arg ne q{} and $arg eq reverse $arg ) ? 1 : 0;
    }
} ## end sub is_palindrome


1;    # End of String::Palindrome

__END__
=pod

=head1 NAME

String::Palindrome - Determine if a string is a palindrome

=head1 VERSION

version 2.000000

=head1 SYNOPSIS

    use String::Palindrome qw/ is_palindrome /;


    #  Simple strings

    my $is     = 'abccba';
    my $is_not = 'abcdef';

    is_palindrome( $is      );  # 1

    is_palindrome( $is_not  );  # 0

    is_palindrome( {a => 1} );  # undef
    is_palindrome(          );  # undef



    #  Arrays

    my @is     = qw/ a ab cc ab a /;
    my @is_not = qw/ a ab cc a ba /;

    is_palindrome(  @is     );  # 1
    is_palindrome( \@is     );  # 1

    is_palindrome(  @is_not );  # 0
    is_palindrome( \@is_not );  # 0

    is_palindrome( []       );  # undef

=head1 EXPORTS

=over 4

=item *

is_palindrome

=back

=head1 FUNCTIONS

=head2 is_palindrome

Returns true if the string, array, or array_ref is a palindrome.  If more than
one parameter is passed to the function, then it will blindly assume that you
want to treat them as an array to be tested.  This means that you could,
theoretically, pass in a palindrome of array_refs and it would still pass.

If only one arg is passed, then it is first checked to see if it is an array
ref.  If it is an array ref it is treated as a normal array.  If it is a simple
scalar, then it is treated as a string.  If it is any other type of ref, then
undef is returned.  Additionally, a blank array ref also returns undef.

=encoding utf8

=head1 INSTALLATION

See perlmodinstall for information and options on installing Perl modules.

=head1 AUTHOR

Adam Lesperance <lespea@gmail.com>

=for :stopwords cpan testmatrix url annocpan anno bugtracker rt cpants kwalitee diff irc mailto metadata placeholders

=head1 SUPPORT

=head2 Perldoc

You can find documentation for this module with the perldoc command.

  perldoc String::Palindrome

=head2 Websites

The following websites have more information about this module, and may be of help to you. As always,
in addition to those websites please use your favorite search engine to discover more resources.

=over 4

=item *

Search CPAN

L<http://search.cpan.org/dist/String-Palindrome>

=item *

RT: CPAN's Bug Tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=String-Palindrome>

=item *

AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/String-Palindrome>

=item *

CPAN Ratings

L<http://cpanratings.perl.org/d/String-Palindrome>

=item *

CPAN Forum

L<http://cpanforum.com/dist/String-Palindrome>

=item *

CPANTS Kwalitee

L<http://cpants.perl.org/dist/overview/String-Palindrome>

=item *

CPAN Testers Results

L<http://cpantesters.org/distro/S/String-Palindrome.html>

=item *

CPAN Testers Matrix

L<http://matrix.cpantesters.org/?dist=String-Palindrome>

=back

=head2 Bugs / Feature Requests

Please report any bugs or feature requests by email to C<bug-string-palindrome at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=String-Palindrome>. You will be automatically notified of any
progress on the request by the system.

=head2 Source Code

The code is open to the world, and available for you to hack on. Please feel free to browse it and play
with it, or whatever. If you want to contribute patches, please send me a diff or prod me to pull
from your repository :)

L<https://github.com/lespea/string-palindrome>

  git clone git://github.com/lespea/string-palindrome.git

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Adam Lesperance.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=head1 DISCLAIMER OF WARRANTY

BECAUSE THIS SOFTWARE IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE SOFTWARE, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT
WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER
PARTIES PROVIDE THE SOFTWARE "AS IS" WITHOUT WARRANTY OF ANY KIND,
EITHER EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE
SOFTWARE IS WITH YOU. SHOULD THE SOFTWARE PROVE DEFECTIVE, YOU ASSUME
THE COST OF ALL NECESSARY SERVICING, REPAIR, OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE SOFTWARE AS PERMITTED BY THE ABOVE LICENCE, BE LIABLE
TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE THE
SOFTWARE (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
FAILURE OF THE SOFTWARE TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH
DAMAGES.

=cut
