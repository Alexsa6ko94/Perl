#!/usr/bin/perl
use strict;
use warnings;
use utf8;
use Data::Dumper;

#About Latin Extended A:
#	https://en.wikipedia.org/wiki/Latin_Extended-A
#
#Major alphabets in Latin Extended A:
#	-Latin
#	-Czech
#	-Dutch
#	-Polish
#	-Turkish

my $str = 'aālaBala';

if($str =~ /\p{InLatin_Extended-A}/) {	    #'\p{In_range}' special regex char(\p) refers to an Unicode_Range
	print 'match', $/						# will print match because of the 'ā' char (U+0101)[Latin Small Letter A with macron]
}else { print 'notMatch', $/ }

#For more details and other ranges in Unicode see also :
#	http://www.regular-expressions.info/unicode.html
