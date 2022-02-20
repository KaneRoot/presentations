#!/usr/bin/perl

use v5.10;

my @list_multiline_cmd = (
	  qr/^\.SUBSECTION$/
	, qr/^\.SECTION_NO_NUMBER$/
	, qr/^\.SUBSUBSECTION$/
	, qr/^\.SUBSUBSUBSECTION$/
	, qr/^\.SECTION$/
	, qr/^\.BULLET$/
	, qr/^\.ENUM$/
	);

my $STACK = "";
my $found_pattern = 0;

while (<>) {
	chomp;
	my $line = $_;

	$found_pattern = 0;

	for (@list_multiline_cmd) {
		if ($line =~ $_) {
			#say "line '$line' matched " . $_;
			$found_pattern = 1;
			$STACK = $line . ' ';
		}
	}

	if ($found_pattern == 1) {
		next;
	}

	say $STACK . $line;
	$STACK = "";
}
