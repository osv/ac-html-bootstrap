#!/usr/bin/perl

# Parse font-awesome.css and put classes into ./fa-html-stuff/html-attributes-complete/i-class

use strict;
use warnings;
use Data::Dumper;

use Path::Tiny;
use List::MoreUtils qw/ uniq /;

my $nested;                     # regexp for "{ }"
$nested = qr/
                \{
                (
                    [^{}]
                |
                    (??{ $nested })
                )*
                \}
            /x;

sub new {
    my $class = shift;
    return bless ({}, $class);
}

sub _parse_css {
    my ($source, $classes) = @_;

    $source =~s|/\*.*?\*/||gs;      # remove comments

    while ($source =~ m/(.*?)($nested)/gs) {
        my ($selector, $selector_body) = ($1, $2);;

        if ($selector =~/\s*\@media/s) {
            if ($selector_body =~m /\{(.+)\}/s) {
                _parse_css($1, $classes);
            }
            next;
        } elsif ($selector =~/\s*\@/s) {
            # ignore @keyframes, etc @..
            next;
        }
        while ($selector =~m/\.([-\w]+)/gs) {
            push @{$classes}, $1;
        }
    }
}

main: {
    my $fa_css = path('./font-awesome/css/font-awesome.css')->slurp_utf8;

    my @classes;

    _parse_css $fa_css, \@classes;

    # convert classes to hash
    my %c;
    foreach (@classes) {
        $c{$_} = 1;
    }

    # read old stuff file
    my @old = path('./fa-html-stuff/html-attributes-complete/i-class')->touchpath->lines_utf8;

    # remoce selectors that present in old stuff file
    foreach my $oldline (@old) {
        chomp $oldline;
        my ($selector) = $oldline =~m/([-\w]+)/;
        if ($selector && $c{$selector}) {
            delete $c{$selector};
        }
    }

    # save classes that not exists in old stuff
    path('./fa-html-stuff/html-attributes-complete/i-class')->
        append_utf8("\n" . join "\n", sort keys %c);
}
