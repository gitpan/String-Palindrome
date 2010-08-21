use warnings;
use strict;

package String::Palindrome;
BEGIN {
  $String::Palindrome::VERSION = '1.000';
}

require Exporter;

use vars qw(@ISA @EXPORT_OK);
@ISA        = qw(Exporter);
@EXPORT_OK  = qw(is_palindrome);  # symbols to export on request


#ABSTRACT: Determine if a string is a palindrome





sub is_palindrome {
    #  Get the args out
    my $arg  =  @_ > 1  ?  \@_
             :             $_[0]
             ;

    #  If no arg was given, then return undef
    if ( !defined $arg ) {
        return;
    }

    #  Check to see if we're dealing with a reference
    elsif  (ref $arg) {
        #  Return immediately if this isn't an array ref or the array ref
        #  contains no values
        return  unless  ref $arg eq 'ARRAY';
        return  unless  @$arg;

        for  (my ($i, $j) = (0, $#{$arg});  $i < $j;  $i++, $j--) {
            my ($a, $b) = @{$arg}[$i, $j];
            if  (!defined $a) {
                return 0  if  !defined $b;
            }
            elsif (!defined $b) {
                return 0;
            }
            else {
                return 0  unless  $arg->[$i] eq $arg->[$j];
            }
        }
        return 1;
    }

    else {
        return  ($arg ne q{}  and  $arg eq reverse $arg)  ?  1  :  0;
    }
}


1; # End of String::Palindrome

__END__
=pod

=head1 NAME

String::Palindrome - Determine if a string is a palindrome

=head1 VERSION

version 1.000

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

Returns true if the string, array_ref, or array is a palindrome.  If more than
one parameter is passed to the function, then it will blindly assume that you
want to treat them as an array to be tested.  This means that you could,
theoretically, pass in a palindrome of array_refs and it would still pass.

If only one arg is passed, then it is first checked to see if it is an array
ref.  If it is an array ref it is treated as a normal array.  If it is a simple
scalar, then it is treated as a string.  If it is any other type of ref, then
undef is returned.  Additionally, a blank array ref also returns undef.

=head1 AUTHOR

Adam Lesperance <lespea@gmail.com>

=for :stopwords CPAN AnnoCPAN RT CPANTS Kwalitee diff

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

  perldoc String::Palindrome

=head2 Websites

=over 4

=item *

Search CPAN

L<http://search.cpan.org/dist/String-Palindrome>

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

RT: CPAN's Bug Tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=String-Palindrome>

=item *

CPANTS Kwalitee

L<http://cpants.perl.org/dist/overview/String-Palindrome>

=item *

CPAN Testers Results

L<http://cpantesters.org/distro/S/String-Palindrome.html>

=item *

CPAN Testers Matrix

L<http://matrix.cpantesters.org/?dist=String-Palindrome>

=item *

Source Code Repository

The code is open to the world, and available for you to hack on. Please feel free to browse it and play
with it, or whatever. If you want to contribute patches, please send me a diff or prod me to pull
from your repository :)

L<git://github.com/lespea/String-Palindrome>

=back

=head2 Bugs

Please report any bugs or feature requests to C<bug-string-palindrome at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=String-Palindrome>.  I will be
notified, and then you'll automatically be notified of progress on your bug as I make changes.

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Adam Lesperance.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

