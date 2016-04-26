use strict;

my %params;
my $lastver;
<>;
while (<>) {
	chop;
	die "no match: $_" unless /(\d+)?\s([LMQH])\s(\d+)\s(\d+)\s(\d+)\s\d+/;
	my $ver = $1 || $lastver;
	my $ecl = $2;
	$lastver = $ver;

	$ver = "$ver-$ecl";
	$params{'numeric'}{$ver} = $3;
	$params{'alphanum'}{$ver} = $4;
	$params{'byte'}{$ver} = $5;
}
for my $mode ("numeric", "alphanum", "byte") {
	print "\\def\\qr\@select\@version\@$mode\@mode{%\n";
	for my $ver (reverse(1 .. 40)) {
		my $l = $params{$mode}{"$ver-L"} + 1;
		my $m = $params{$mode}{"$ver-M"} + 1;
		my $q = $params{$mode}{"$ver-Q"} + 1;
		my $h = $params{$mode}{"$ver-H"} + 1;
		print "\t\\qr\@v $ver $l $m $q $h.\%\n";
	}
	print "}\n\n";
}
