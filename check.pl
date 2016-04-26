use strict;

my %params = {};
while (<>) {
	chop;
	die "no match: $_" unless /(\d+-[LMQH])\s(\d+)\s(\d+)\s(\d+)\s(\d+)\s(\d+)\s(\d+)/;
	my $ver = $1;
	my $totalWords = $2;
	my $eccPerBlock = $3;
	my $numBlocks1 = $4;
	my $numWords1 = $5;
	my $numBlocks2 = $6;
	my $numWords2 = $7;

	die "total does not add up $ver" unless $totalWords == $numBlocks1*$numWords1 + $numBlocks2*$numWords2;
	die "bad $ver" unless $numWords2 == 0 or $numWords2 == $numWords1+1;

	$params{$ver}="{$2 $3 $4 $5}";
}
print "\\ifcase\\qr\@ver\n";
for my $ver (1 .. 40) {
	my $l = $params{"$ver-L"};
	my $m = $params{"$ver-M"};
	my $q = $params{"$ver-Q"};
	my $h = $params{"$ver-H"};
	print "\\or\\qr\@v$l$m$q$h% $ver\n";
}
print"\\fi\n";
