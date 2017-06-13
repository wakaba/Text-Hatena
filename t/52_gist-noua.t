use utf8;
use strict;
use warnings;
use lib 't/lib';
use Test::Most;
use Text::Hatena::Test;
$Text::Hatena::Test::options = { ua => undef };

plan tests => 1 * blocks();

run_html;

done_testing;


__END__


=== embed source code from gist.
--- input
[gist:1]
--- expected
<p><a data-hatena-embed="" href="https://gist.github.com/1" target="_blank">https://gist.github.com/1</a></p>
