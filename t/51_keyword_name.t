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

=== [keyword:sample]
--- input
[keyword:sample]
--- expected
<p><a href="https://hatena.g.hatena.ne.jp/keyword/sample" data-hatena-keyword="sample" target="_blank">keyword:sample</a></p>

=== [keyword:株式会社はてな]
--- input
[keyword:株式会社はてな]
--- expected
<p><a href="https://hatena.g.hatena.ne.jp/keyword/%E6%A0%AA%E5%BC%8F%E4%BC%9A%E7%A4%BE%E3%81%AF%E3%81%A6%E3%81%AA" data-hatena-keyword="株式会社はてな" target="_blank">keyword:株式会社はてな</a></p>

=== :map
--- input
[keyword:はてな:map]
--- expected
<p><a href="https://hatena.g.hatena.ne.jp/keyword/%E3%81%AF%E3%81%A6%E3%81%AA" data-hatena-keyword="はてな" target="_blank" data-hatena-embed="map">keyword:はてな:map</a></p>

=== :map
--- input
[keyword:はてな:map:satellite]
--- expected
<p><a href="https://hatena.g.hatena.ne.jp/keyword/%E3%81%AF%E3%81%A6%E3%81%AA" data-hatena-keyword="はてな" target="_blank" data-hatena-embed="map" data-hatena-map-type="satellite">keyword:はてな:map:satellite</a></p>

=== :map
--- input
[keyword:はてな:map:hybrid]
--- expected
<p><a href="https://hatena.g.hatena.ne.jp/keyword/%E3%81%AF%E3%81%A6%E3%81%AA" data-hatena-keyword="はてな" target="_blank" data-hatena-embed="map" data-hatena-map-type="hybrid">keyword:はてな:map:hybrid</a></p>

=== :detail
--- input
[keyword:はてな:detail]
--- expected
<p><a href="https://hatena.g.hatena.ne.jp/keyword/%E3%81%AF%E3%81%A6%E3%81%AA" data-hatena-keyword="はてな" target="_blank" data-hatena-embed="keyworddetail">keyword:はてな:detail</a></p>

=== :presentation
--- input
[keyword:はてな:presentation]
--- expected
<p><a href="https://hatena.g.hatena.ne.jp/keyword/%E3%81%AF%E3%81%A6%E3%81%AA?mode=presentation" data-hatena-keyword="はてな" target="_blank" data-hatena-presentation="">keyword:はてな:presentation</a></p>

=== :presentation:mouse
--- input
[keyword:はてな:presentation:mouse]
--- expected
<p><a href="https://hatena.g.hatena.ne.jp/keyword/%E3%81%AF%E3%81%A6%E3%81%AA?mode=presentation&mouse=true" data-hatena-keyword="はてな" target="_blank" data-hatena-presentation=mouse>keyword:はてな:presentation:mouse</a></p>
