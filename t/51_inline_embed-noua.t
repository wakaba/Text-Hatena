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

=== embed
--- input
[embed:https://gist.github.com/1833407]
--- expected
<p><a href=https://gist.github.com/1833407 data-hatena-embed="" target=_blank>https://gist.github.com/1833407</a></p>

=== tweet
--- input
[tweet https://gist.github.com/1833407]
--- expected
<p><a href=https://gist.github.com/1833407 data-hatena-embed="" target=_blank>https://gist.github.com/1833407</a></p>

=== tweet lang
--- input
[tweet https://twitter.com/Nintendo/status/172278808970412032 lang='ja']
--- expected
<p><a data-hatena-embed="" data-hatena-lang=ja href="https://twitter.com/Nintendo/status/172278808970412032" target="_blank">https://twitter.com/Nintendo/status/172278808970412032</a></p>
