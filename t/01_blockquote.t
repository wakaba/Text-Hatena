use strict;
use warnings;
use lib 't/lib';
use Text::Hatena::Test;
use Cache::MemoryCache;
use LWP::UserAgent;
use LWP::Simple;
local $Text::Hatena::Test::INLINE = "Text::Hatena::Inline::Aggressive";
local $Text::Hatena::Test::INLINE_ARGS = [ cache => Cache::MemoryCache->new ];
{
    no warnings 'redefine';
    *LWP::UserAgent::get = sub {
        my ($self, $uri) = @_;
        local $_ = $uri;
        if (qr|http://example.com/|) {
            HTTP::Response->new(200, "OK", [], "<title>Example Web Page</title>");
        } else {
            die "unknown url";
        }
    };
};

plan tests => 1 * blocks;

run_html;


__END__

=== test
--- input
>>
quote
<<
--- expected
<blockquote>
<p>quote</p>
</blockquote>

=== test
--- input
>>
quote1
>>
quote2
<<
<<
--- expected
<blockquote>
    <p>quote1</p>
    <blockquote>
        <p>quote2</p>
    </blockquote>
</blockquote>

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
<figcaption><a href="http://example.com/" target="_blank">Example Web Page</a></figcaption>
</figure>


=== test
--- input
>>
quote
<<
test
--- expected
<blockquote>
<p>quote</p>
</blockquote>
<p>test</p>

=== bug1
--- input
>>
* hoge1
hoge2
<<
hoge3
--- expected
<blockquote>
    <div class="section">
        <h3>hoge1</h3>
        <p>hoge2</p>
    </div>
</blockquote>
<p>hoge3</p>
