use strict;

print "\\def\\qr\@set\@alignments{%\n";
print "\t\\edef\\qr\@alignments{%\n\t\t\\ifcase\\qr\@ver\n";
while (<>) {
	chop;
	my @arr = split /\s/;
	my $ver = shift @arr;
	print "\t\t\\or @arr % $ver\n";
}
print "\t\t\\fi\n\t}%\n}\n";
