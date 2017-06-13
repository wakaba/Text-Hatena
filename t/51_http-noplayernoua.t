use utf8;
use strict;
use warnings;
use lib 't/lib';
use Test::Most;
use Text::Hatena::Test;
$Text::Hatena::Test::options = { expand_movie => 0, ua => undef };

plan tests => 1 * blocks();

run_html;

done_testing;

__END__

=== http
--- input
http://www.hatena.ne.jp/
--- expected
<p><a href="http://www.hatena.ne.jp/" target="_blank">http://www.hatena.ne.jp/</a></p>

=== [http]
--- input
[http://www.hatena.ne.jp/]
--- expected
<p><a href="http://www.hatena.ne.jp/" target="_blank">http://www.hatena.ne.jp/</a></p>

=== (http)
--- input
(http://www.hatena.ne.jp/)
--- expected
<p>(<a href="http://www.hatena.ne.jp/" target="_blank">http://www.hatena.ne.jp/</a>)</p>

=== (http)a
--- input
(http://www.hatena.ne.jp/)
--- expected
<p>(<a href="http://www.hatena.ne.jp/" target="_blank">http://www.hatena.ne.jp/</a>)</p>

=== http bookmark
--- input
[http://www.hatena.ne.jp/:bookmark]
--- expected
<p><a href="https://b.hatena.ne.jp/entry/http://www.hatena.ne.jp/" class="http-bookmark" target="_blank"><img src="https://b.hatena.ne.jp/entry/image/http://www.hatena.ne.jp/" alt="" class="http-bookmark" /></a></p>

=== http title
--- input
[http://www.hatena.ne.jp/:title]
--- expected
<p><a href="http://www.hatena.ne.jp/" target="_blank">http://www.hatena.ne.jp/</a></p>

=== http title linebreak
--- input
[http://linebreak.com/:title]
--- expected
<p><a href="http://linebreak.com/" target="_blank">http://linebreak.com/</a></p>

=== http title=
--- input
[http://www.hatena.ne.jp/:title=hatena]
--- expected
<p><a href="http://www.hatena.ne.jp/" target="_blank">hatena</a></p>

=== http title= (blank)
--- input
[http://www.hatena.ne.jp/:title=]
--- expected
<p><a href="http://www.hatena.ne.jp/" target="_blank">http://www.hatena.ne.jp/</a></p>

=== http title=:
--- input
[http://www.hatena.ne.jp/:title=hatena::portal]
--- expected
<p><a href="http://www.hatena.ne.jp/" target="_blank">hatena::portal</a></p>

=== http title + bookmark 1
--- input
[http://www.hatena.ne.jp/:title:bookmark]
--- expected
<p><a href="http://www.hatena.ne.jp/" target="_blank">http://www.hatena.ne.jp/</a><a href="https://b.hatena.ne.jp/entry/http://www.hatena.ne.jp/" class="http-bookmark" target="_blank"><img src="https://b.hatena.ne.jp/entry/image/http://www.hatena.ne.jp/" alt="" class="http-bookmark" /></a></p>

=== http title + bookmark 2
--- input
[http://www.hatena.ne.jp/:title=hatena:bookmark]
--- expected
<p><a href="http://www.hatena.ne.jp/" target="_blank">hatena</a><a href="https://b.hatena.ne.jp/entry/http://www.hatena.ne.jp/" class="http-bookmark" target="_blank"><img src="https://b.hatena.ne.jp/entry/image/http://www.hatena.ne.jp/" alt="" class="http-bookmark" /></a></p>


=== http bookmark + title 1
--- input
[http://www.hatena.ne.jp/:bookmark:title]
--- expected
<p><a href="https://b.hatena.ne.jp/entry/http://www.hatena.ne.jp/" class="http-bookmark" target="_blank"><img src="https://b.hatena.ne.jp/entry/image/http://www.hatena.ne.jp/" alt="" class="http-bookmark" /></a><a href="http://www.hatena.ne.jp/" target="_blank">http://www.hatena.ne.jp/</a></p>

=== http bookmark + title 2
--- input
[http://www.hatena.ne.jp/:bookmark:title=hatena]
--- expected
<p><a href="https://b.hatena.ne.jp/entry/http://www.hatena.ne.jp/" class="http-bookmark" target="_blank"><img src="https://b.hatena.ne.jp/entry/image/http://www.hatena.ne.jp/" alt="" class="http-bookmark" /></a><a href="http://www.hatena.ne.jp/" target="_blank">hatena</a></p>

=== http bookmark 2 (#)
--- input
[http://d.hatena.ne.jp/lionfan/20080723#1216833707:bookmark]
--- expected
<p><a href="https://b.hatena.ne.jp/entry/http://d.hatena.ne.jp/lionfan/20080723%231216833707" class="http-bookmark" target="_blank"><img src="https://b.hatena.ne.jp/entry/image/http://d.hatena.ne.jp/lionfan/20080723%231216833707" alt="" class="http-bookmark"></a></p>

=== http bookmark 3 (?)
--- input
[http://gigazine.net/index.php?/news/comments/20080723_psp_3000/:bookmark]
--- expected
<p><a href="https://b.hatena.ne.jp/entry/http://gigazine.net/index.php?/news/comments/20080723_psp_3000/" class="http-bookmark" target="_blank"><img src="https://b.hatena.ne.jp/entry/image/http://gigazine.net/index.php?/news/comments/20080723_psp_3000/" alt="" class="http-bookmark"></a></p>

=== <>
--- input
<http://www.hatena.ne.jp/>
--- expected
<p><a href="http://www.hatena.ne.jp/" target="_blank">http://www.hatena.ne.jp/</a></p>

=== <> + attr
--- input
<http://www.hatena.ne.jp/ target="_blank">
--- expected
<p><a href="http://www.hatena.ne.jp/" target="_blank">http://www.hatena.ne.jp/</a></p>

=== multi byte
--- input
http://www.hatena.ne.jp/はてな
--- expected
<p><a href="http://www.hatena.ne.jp/" target="_blank">http://www.hatena.ne.jp/</a>はてな</p>

=== multi byte
--- input
[http://www.hatena.ne.jp/はてな]
--- expected
<p><a href="http://www.hatena.ne.jp/はてな" target="_blank">http://www.hatena.ne.jp/はてな</a></p>

=== movie YouTube
--- input
[http://www.youtube.com/watch?v=D5V28l7FyHA:movie]
--- expected
<p><a href="http://www.youtube.com/watch?v=D5V28l7FyHA" target="_blank" data-hatena-embed="movie" data-hatena-height="315" data-hatena-width="420">http://www.youtube.com/watch?v=D5V28l7FyHA</a></p>

=== movie YouTube jp
--- input
[http://jp.youtube.com/watch?v=D5V28l7FyHA:movie]
--- expected
<p><a href="http://jp.youtube.com/watch?v=D5V28l7FyHA" target="_blank" data-hatena-embed="movie" data-hatena-height="315" data-hatena-width="420">http://jp.youtube.com/watch?v=D5V28l7FyHA</a></p>

=== movie YouTube without bracket
--- input
http://www.youtube.com/watch?v=D5V28l7FyHA:movie
--- expected
<p><a href="http://www.youtube.com/watch?v=D5V28l7FyHA" target="_blank" data-hatena-embed="movie" data-hatena-height="315" data-hatena-width="420">http://www.youtube.com/watch?v=D5V28l7FyHA</a></p>

=== movie YouTube + query
--- input
[http://www.youtube.com/watch?v=D5V28l7FyHA&feature=plcp&context=C30f22f1UDOEgsToPDskIBRKR_YtLEXvdxtCEw5nzD:movie]
--- expected
<p><a href="http://www.youtube.com/watch?v=D5V28l7FyHA&feature=plcp&context=C30f22f1UDOEgsToPDskIBRKR_YtLEXvdxtCEw5nzD" target="_blank" data-hatena-embed="movie" data-hatena-height="315" data-hatena-width="420">http://www.youtube.com/watch?v=D5V28l7FyHA&feature=plcp&context=C30f22f1UDOEgsToPDskIBRKR_YtLEXvdxtCEw5nzD</a></p>

=== movie youtube:small
--- input
[http://www.youtube.com/watch?v=D5V28l7FyHA:movie:small]
--- expected
<p><a href="http://www.youtube.com/watch?v=D5V28l7FyHA" target="_blank" data-hatena-embed="movie" data-hatena-height="225" data-hatena-width="300">http://www.youtube.com/watch?v=D5V28l7FyHA</a></p>

=== movie youtube:w
--- input
[http://www.youtube.com/watch?v=D5V28l7FyHA:movie:w480]
--- expected
<p><a href="http://www.youtube.com/watch?v=D5V28l7FyHA" target="_blank" data-hatena-embed="movie" data-hatena-height="360" data-hatena-width="480">http://www.youtube.com/watch?v=D5V28l7FyHA</a></p>

=== movie youtube:h
--- input
[http://www.youtube.com/watch?v=D5V28l7FyHA:movie:h360]
--- expected
<p><a href="http://www.youtube.com/watch?v=D5V28l7FyHA" target="_blank" data-hatena-embed="movie" data-hatena-height="360" data-hatena-width="480">http://www.youtube.com/watch?v=D5V28l7FyHA</a></p>

=== movie youtube:h without bracket
--- input
http://www.youtube.com/watch?v=D5V28l7FyHA:movie:h360
--- expected
<p><a href="http://www.youtube.com/watch?v=D5V28l7FyHA" target="_blank" data-hatena-embed="movie" data-hatena-height="360" data-hatena-width="480">http://www.youtube.com/watch?v=D5V28l7FyHA</a></p>

=== movie YouTube include hyphen
--- input
[http://www.youtube.com/watch?v=9x-XAeRN3NM:movie]
--- expected
<p><a href="http://www.youtube.com/watch?v=9x-XAeRN3NM" target="_blank" data-hatena-embed="movie" data-hatena-height="315" data-hatena-width="420">http://www.youtube.com/watch?v=9x-XAeRN3NM</a></p>

=== movie ugomemo
--- input
[http://ugomemo.hatena.ne.jp/0EB03A80BC7D7DBA@DSi/movie/7DD445_086B8A571518B_000:movie]
--- expected
<p><a href="http://ugomemo.hatena.ne.jp/0EB03A80BC7D7DBA@DSi/movie/7DD445_086B8A571518B_000" target="_blank" data-hatena-embed="movie" data-hatena-height="315" data-hatena-width="420">http://ugomemo.hatena.ne.jp/0EB03A80BC7D7DBA@DSi/movie/7DD445_086B8A571518B_000</a></p>

=== movie flipnote
--- input
[http://flipnote.hatena.com/0EB03A80BC7D7DBA@DSi/movie/7DD445_086B8A571518B_000:movie]
--- expected
<p><a href="http://flipnote.hatena.com/0EB03A80BC7D7DBA@DSi/movie/7DD445_086B8A571518B_000" target="_blank" data-hatena-embed="movie" data-hatena-height="315" data-hatena-width="420">http://flipnote.hatena.com/0EB03A80BC7D7DBA@DSi/movie/7DD445_086B8A571518B_000</a></p>

=== movie niconico
--- input
[http://www.nicovideo.jp/watch/sm1128042:movie]
--- expected
<p><a data-hatena-embed="movie" data-hatena-height="315" data-hatena-width="420" href="http://www.nicovideo.jp/watch/sm1128042" target="_blank">http://www.nicovideo.jp/watch/sm1128042</a></p>

=== movie not implemented
--- input
[http://example.com/:movie]
--- expected
<p><a href="http://example.com/" target="_blank" data-hatena-embed="movie" data-hatena-height="315" data-hatena-width="420">http://example.com/</a></p>


=== embed
--- input
[https://gist.github.com/1833407:embed]
--- expected
<p><a href="https://gist.github.com/1833407" target="_blank">https://gist.github.com/1833407</a></p>

=== embed
--- input
[https://gist.github.com/1833407:embed#ほげほげ]
--- expected
<p><a href="https://gist.github.com/1833407" target="_blank">https://gist.github.com/1833407</a></p>

=== embed
--- input
[https://gist.github.com/1833407:embed#ほげほげ#ふがふが]
--- expected
<p><a href="https://gist.github.com/1833407" target="_blank">https://gist.github.com/1833407</a></p>

=== barcode
--- input
[http://www.hatena.ne.jp/:barcode]
--- expected
<p><a href="http://www.hatena.ne.jp/" class="http-barcode" target="_blank"><img src="https://chart.apis.google.com/chart?chs=150x150&amp;cht=qr&amp;chl=http%3A%2F%2Fwww.hatena.ne.jp%2F" title="http://www.hatena.ne.jp/" /></a></p>

=== detail
--- input
[http://www.hatena.ne.jp/:detail]
--- expected
<p><iframe marginwidth="0" marginheight="0" src="https://b.hatena.ne.jp/entry.parts?url=http%3A%2F%2Fwww.hatena.ne.jp%2F" scrolling="no" frameborder="0" height="230" width="500"><div class="hatena-bookmark-detail-info"><a href="http://www.hatena.ne.jp/">http://www.hatena.ne.jp/</a><a href="https://b.hatena.ne.jp/entry/http%3A%2F%2Fwww.hatena.ne.jp%2F">はてなブックマーク- http://www.hatena.ne.jp/</a></div></iframe></p>

=== detail encoded
--- input
[http://ja.wikipedia.org/wiki/%E3%81%AF%E3%81%A6%E3%81%AA:detail]
--- expected
<p><iframe marginwidth="0" marginheight="0" src="https://b.hatena.ne.jp/entry.parts?url=http%3A%2F%2Fja.wikipedia.org%2Fwiki%2F%25E3%2581%25AF%25E3%2581%25A6%25E3%2581%25AA" scrolling="no" frameborder="0" height="230" width="500"><div class="hatena-bookmark-detail-info"><a href="http://ja.wikipedia.org/wiki/%E3%81%AF%E3%81%A6%E3%81%AA">http://ja.wikipedia.org/wiki/%E3%81%AF%E3%81%A6%E3%81%AA</a><a href="https://b.hatena.ne.jp/entry/http%3A%2F%2Fja.wikipedia.org%2Fwiki%2F%25E3%2581%25AF%25E3%2581%25A6%25E3%2581%25AA">はてなブックマーク- http://ja.wikipedia.org/wiki/%E3%81%AF%E3%81%A6%E3%81%AA</a></div></iframe></p>

=== title linefeed
--- input
[http://www.hatena.ne.jp/:title=foo
bar]
--- expected
<p>[<a href="http://www.hatena.ne.jp/:title=foo" target="_blank">http://www.hatena.ne.jp/:title=foo</a><br/>bar]</p>

=== star
--- input
[http://www.hatena.ne.jp/:star]
--- expected
<p><img alt="" class="http-star" src="https://s.st-hatena.com/entry.count.image?uri=http%3A%2F%2Fwww.hatena.ne.jp%2F" /></p>

=== title:bookmark:star
--- input
[http://www.hatena.ne.jp/:title:bookmark:star]
--- expected
<p>
  <a href="http://www.hatena.ne.jp/" target="_blank">http://www.hatena.ne.jp/</a>
  <a class="http-bookmark" href="https://b.hatena.ne.jp/entry/http://www.hatena.ne.jp/" target="_blank">
    <img alt="" class="http-bookmark" src="https://b.hatena.ne.jp/entry/image/http://www.hatena.ne.jp/" />
  </a>
  <img alt="" class="http-star" src="https://s.st-hatena.com/entry.count.image?uri=http%3A%2F%2Fwww.hatena.ne.jp%2F" />
</p>

=== favicon
--- input
[http://www.hatena.ne.jp/:favicon]
--- expected
<p><a href="http://www.hatena.ne.jp/" target="_blank"><img alt="" class="http-favicon" src="https://cdn-ak.favicon.st-hatena.com/?url=http%3A%2F%2Fwww.hatena.ne.jp%2F" /></a></p>

=== favicon:title:bookmark:star
--- input
[http://www.hatena.ne.jp/:favicon:title:bookmark:star]
--- expected
<p>
  <a href="http://www.hatena.ne.jp/" target="_blank">
    <img alt="" class="http-favicon" src="https://cdn-ak.favicon.st-hatena.com/?url=http%3A%2F%2Fwww.hatena.ne.jp%2F" />
  </a>
  <a href="http://www.hatena.ne.jp/" target="_blank">http://www.hatena.ne.jp/</a>
  <a class="http-bookmark" href="https://b.hatena.ne.jp/entry/http://www.hatena.ne.jp/" target="_blank">
    <img alt="" class="http-bookmark" src="https://b.hatena.ne.jp/entry/image/http://www.hatena.ne.jp/" />
  </a>
  <img alt="" class="http-star" src="https://s.st-hatena.com/entry.count.image?uri=http%3A%2F%2Fwww.hatena.ne.jp%2F" />
</p>
