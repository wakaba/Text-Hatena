use utf8;
use strict;
use warnings;
use lib 't/lib';
use Test::Most;
use Text::Hatena::Test;

plan tests => 1 * blocks();

run_html;


done_testing;

__END__
=== contents
--- input
[:contents]
--- expected
<p><hatena-contents></hatena-contents></p>

=== contents
--- input
abc[:contents]def
--- expected
<p>abc<hatena-contents></hatena-contents>def</p>
