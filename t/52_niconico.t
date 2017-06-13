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
=== http movie (niconico:small)
--- input
[http://www.nicovideo.jp/watch/sm1128042:movie:small]
--- expected
<p><script src="http://ext.nicovideo.jp/thumb_watch/sm1128042"></script></p>

=== niconico:small
--- input
[niconico:sm1128042:small]
--- expected
<p><script src="http://ext.nicovideo.jp/thumb_watch/sm1128042?w=300&h=251" charset="utf-8"></script>
<a href="https://d.hatena.ne.jp/video/niconico/sm1128042" alt="この動画を含む日記"><img src="https://d.hatena.ne.jp/images/d_entry.gif" alt="D" border="0" style="vertical-align: bottom;" title="この動画を含む日記"></a></p>

=== http movie (niconico:w)
--- input
[http://www.nicovideo.jp/watch/sm1128042:movie:w100]
--- expected
<p><script src="http://ext.nicovideo.jp/thumb_watch/sm1128042"></script></p>

=== niconico:w
--- input
[niconico:sm1128042:w100]
--- expected
<p><script src="http://ext.nicovideo.jp/thumb_watch/sm1128042?w=100&h=107" charset="utf-8"></script>
<a href="https://d.hatena.ne.jp/video/niconico/sm1128042" alt="この動画を含む日記"><img src="https://d.hatena.ne.jp/images/d_entry.gif" alt="D" border="0" style="vertical-align: bottom;" title="この動画を含む日記"></a></p>

=== http movie (niconico:h)
--- input
[http://www.nicovideo.jp/watch/sm1128042:movie:h100]
--- expected
<p><script src="http://ext.nicovideo.jp/thumb_watch/sm1128042"></script></p>

=== niconico:h
--- input
[niconico:sm1128042:h100]
--- expected
<p><script src="http://ext.nicovideo.jp/thumb_watch/sm1128042?w=81&h=100" charset="utf-8"></script>
<a href="https://d.hatena.ne.jp/video/niconico/sm1128042" alt="この動画を含む日記"><img src="https://d.hatena.ne.jp/images/d_entry.gif" alt="D" border="0" style="vertical-align: bottom;" title="この動画を含む日記"></a></p>

=== http movie (niconico)
--- input
[http://www.nicovideo.jp/watch/sm1128042:movie]
--- expected
<p><script src="http://ext.nicovideo.jp/thumb_watch/sm1128042"></script></p>

=== niconico
--- input
[niconico:sm1128042]
--- expected
<p><script src="http://ext.nicovideo.jp/thumb_watch/sm1128042" charset="utf-8"></script>
<a href="https://d.hatena.ne.jp/video/niconico/sm1128042" alt="この動画を含む日記"><img src="https://d.hatena.ne.jp/images/d_entry.gif" alt="D" border="0" style="vertical-align: bottom;" title="この動画を含む日記"></a></p>
