use utf8;
use strict;
use warnings;
use lib 't/lib';
use Test::Most;
use Text::Hatena::Test;
$Text::Hatena::Test::options = { expand_map => 0 };

plan tests => 1 * blocks();

run_html;


done_testing;


__END__
=== map
--- input
map:x139.6980y35.6514:map
--- expected
<p><hatena-map lat="35.6514" lon="139.6980" type="map" width="200" height="150"></hatena-map></p>

=== map satellite
--- input
map:x139.6980y35.6514:satellite
--- expected
<p><hatena-map lat="35.6514" lon="139.6980" type="satellite" width="200" height="150"></hatena-map></p>

=== map size(w)
--- input
map:x139.6980y35.6514:map:w400
--- expected
<p><hatena-map lat="35.6514" lon="139.6980" type="map" width="400" height="300"></hatena-map></p>

=== map size(h)
--- input
map:x139.6980y35.6514:satellite:h300
--- expected
<p><hatena-map lat="35.6514" lon="139.6980" type="satellite" width="400" height="300"></hatena-map></p>

=== map (compatible haiku)
--- input
map:35.6514:139.6980
--- expected
<p><hatena-map lat="35.6514" lon="139.6980"></hatena-map></p>

=== map word
--- input
[map:札幌駅]
--- expected
<p><a href="http://maps.google.co.jp/maps?q=%E6%9C%AD%E5%B9%8C%E9%A7%85" target="_blank">map:札幌駅</a></p>

=== map:t (deprecated)
--- input
[map:t:札幌駅]
--- expected
<p><a href="http://map.hatena.ne.jp/t/%E6%9C%AD%E5%B9%8C%E9%A7%85">map:t:札幌駅</a></p>
