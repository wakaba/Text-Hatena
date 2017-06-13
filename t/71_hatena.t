use utf8;
use strict;
use warnings;
use lib 't/lib';
use Test::Most;
use Text::Hatena::Test;
$Text::Hatena::Test::options = { keyword_url_prefix => q<https://hatena.g.hatena.ne.jp/keyword/> };

plan tests => 1 * blocks();

run_html;

done_testing;

__END__


=== <hatena>
--- input
ab<hatena name="clock">cd
--- expected
<p>ab<hatena-hatena name="clock"></hatena-hatena>cd</p>
