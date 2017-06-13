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
=== presentation
--- input
[:presentation]
--- expected
<p><hatena-presentation></hatena-presentation></p>

=== presentation
--- input
abc[:presentation]def
--- expected
<p>abc<hatena-presentation></hatena-presentation>def</p>
