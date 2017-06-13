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


=== file:filename (simple)
--- input
[file:onishi:foobar.txt]
--- expected
<p><a href="https://d.hatena.ne.jp/onishi/files/foobar.txt" target="_blank">foobar.txt</a></p>

=== file:filename (multibyte)
--- input
[file:onishi:てすと.txt]
--- expected
<p><a href="https://d.hatena.ne.jp/onishi/files/%E3%81%A6%E3%81%99%E3%81%A8.txt" target=_blank>てすと.txt</a></p>

=== file:filename (.png, multibyte)
--- input
[file:onishi:ふぉおおお.png:image]
--- expected
<p><a href="https://d.hatena.ne.jp/onishi/files/%E3%81%B5%E3%81%89%E3%81%8A%E3%81%8A%E3%81%8A.png?d=.png" class="http-image" target="_blank"><img src="https://d.hatena.ne.jp/onishi/files/%E3%81%B5%E3%81%89%E3%81%8A%E3%81%8A%E3%81%8A.png?d=.png" class="http-image" alt="https://d.hatena.ne.jp/onishi/files/%E3%81%B5%E3%81%89%E3%81%8A%E3%81%8A%E3%81%8A.png?d=.png"></a></p>

=== file:filename (.png)
--- input
[file:onishi:foobar.png:image:h50]
--- expected
<p><a href="https://d.hatena.ne.jp/onishi/files/foobar.png?d=.png" class="http-image" target="_blank"><img src="https://d.hatena.ne.jp/onishi/files/foobar.png?d=.png" class="http-image" alt="https://d.hatena.ne.jp/onishi/files/foobar.png?d=.png" height="50"></a></p>

=== file:filename (movie)
--- input
[file:onishi:unko.flv:movie]
--- expected
<p><a data-hatena-embed="movie" href="https://d.hatena.ne.jp/onishi/files/unko.flv" target="_blank">unko.flv</a></p>

=== file:filename (evil)
--- input
[file:onishi:<script type="javascript">alert("")</script>]
--- expected
<p>[file:onishi:<script type="javascript">alert("")</script>]</p>

=== file: (group)
--- input
[file:f166680dfed8d9a7]
--- expected
<p><hatena-file fileid="f166680dfed8d9a7" target="_blank"></hatena-file></p>

=== file: :image (group)
--- input
[file:f166680dfed8d9a7:image]
--- expected
<p><hatena-file fileid="f166680dfed8d9a7" target="_blank" type="image"></hatena-file></p>

=== file: :movie (group)
--- input
[file:f166680dfed8d9a7:movie]
--- expected
<p><hatena-file fileid="f166680dfed8d9a7" target="_blank" type="movie"></hatena-file></p>

=== file: :sound (group)
--- input
[file:f166680dfed8d9a7:sound]
--- expected
<p><hatena-file fileid="f166680dfed8d9a7" target="_blank" type="sound"></hatena-file></p>

=== file: :sound (group)
--- input
[file:f166680dfed8d9a7:sound:1m5s]
--- expected
<p><hatena-file fileid="f166680dfed8d9a7" target="_blank" type="sound" t="65"></hatena-file></p>
