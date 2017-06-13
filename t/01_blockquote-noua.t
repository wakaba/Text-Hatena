use strict;
use warnings;
use lib 't/lib';
use Text::Hatena::Test;
$Text::Hatena::Test::options = { ua => undef };

plan tests => 1 * blocks;

run_html;


__END__

=== test
--- input
>http://example.com/>
quote
<<
--- expected
<figure class=hatena-blockquote>
<blockquote cite="http://example.com/">
	<p>quote</p>
</blockquote>
<figcaption><a href="http://example.com/" target="_blank">http://example.com/</a></figcaption>
</figure>

=== http
--- input
>http://example.com/:title>
quote
<<
--- expected
<figure class=hatena-blockquote>
<blockquote cite="http://example.com/">
	<p>quote</p>
</blockquote>
<figcaption><a href="http://example.com/" target="_blank" data-hatena-embed="title">http://example.com/</a></figcaption>
</figure>
