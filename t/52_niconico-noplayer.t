use utf8;
use strict;
use warnings;
use lib 't/lib';
use Test::Most;
use Text::Hatena::Test;
$Text::Hatena::Test::options = { expand_movie => 0 };

plan tests => 1 * blocks();

run_html;


done_testing;


__END__
=== http movie (niconico:small)
--- input
[http://www.nicovideo.jp/watch/sm1128042:movie:small]
--- expected
<p><a data-hatena-embed="movie" data-hatena-height="225" data-hatena-width="300" href="http://www.nicovideo.jp/watch/sm1128042" target="_blank">http://www.nicovideo.jp/watch/sm1128042</a></p>

=== niconico:small
--- input
[niconico:sm1128042:small]
--- expected
<p><a data-hatena-embed="movie" data-hatena-height="251" data-hatena-width="300" href="http://www.nicovideo.jp/watch/sm1128042" target="_blank">http://www.nicovideo.jp/watch/sm1128042</a></p>

=== http movie (niconico:w)
--- input
[http://www.nicovideo.jp/watch/sm1128042:movie:w100]
--- expected
<p><a data-hatena-embed="movie" data-hatena-width="100" href="http://www.nicovideo.jp/watch/sm1128042" target="_blank">http://www.nicovideo.jp/watch/sm1128042</a></p>

=== niconico:w
--- input
[niconico:sm1128042:w100]
--- expected
<p><a data-hatena-embed="movie" data-hatena-width="100" href="http://www.nicovideo.jp/watch/sm1128042" target="_blank">http://www.nicovideo.jp/watch/sm1128042</a></p>

=== http movie (niconico:h)
--- input
[http://www.nicovideo.jp/watch/sm1128042:movie:h100]
--- expected
<p><a data-hatena-embed="movie" data-hatena-height="100" href="http://www.nicovideo.jp/watch/sm1128042" target="_blank">http://www.nicovideo.jp/watch/sm1128042</a></p>

=== niconico:h
--- input
[niconico:sm1128042:h100]
--- expected
<p><a data-hatena-embed="movie" data-hatena-height="100" href="http://www.nicovideo.jp/watch/sm1128042" target="_blank">http://www.nicovideo.jp/watch/sm1128042</a></p>

=== http movie (niconico)
--- input
[http://www.nicovideo.jp/watch/sm1128042:movie]
--- expected
<p><a data-hatena-embed="movie" href="http://www.nicovideo.jp/watch/sm1128042" target="_blank">http://www.nicovideo.jp/watch/sm1128042</a></p>

=== niconico
--- input
[niconico:sm1128042]
--- expected
<p><a data-hatena-embed="movie" href="http://www.nicovideo.jp/watch/sm1128042" target="_blank">http://www.nicovideo.jp/watch/sm1128042</a></p>
