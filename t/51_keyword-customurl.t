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

=== [[sample]]
--- input
[[sample]]
--- expected
<p><a href="https://hatena.g.hatena.ne.jp/keyword/sample" data-hatena-keyword="sample" target="_blank">sample</a></p>

=== [[株式会社はてな]]
--- input
[[株式会社はてな]]
--- expected
<p><a href="https://hatena.g.hatena.ne.jp/keyword/%E6%A0%AA%E5%BC%8F%E4%BC%9A%E7%A4%BE%E3%81%AF%E3%81%A6%E3%81%AA" data-hatena-keyword="株式会社はてな" target="_blank">株式会社はてな</a></p>
