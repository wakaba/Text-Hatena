use strict;
use warnings;
use lib 't/lib';
use Text::Hatena::Test;

plan tests => 1 * blocks;

run_html;


__END__

=== test
--- input
test
test
--- expected
<p>test<br/>
test</p>

=== test
--- input
test
[[test]]
--- expected
<p>test<br/>
<a href="https://d.hatena.ne.jp/keyword/test" data-hatena-keyword=test target=_blank>test</a></p>

=== test
--- input
test
[[test]]
abc
--- expected
<p>test<br/>
<a href="https://d.hatena.ne.jp/keyword/test" data-hatena-keyword=test target=_blank>test</a><br/>
abc</p>

=== test
--- input
test
[[test]]
[[test]]
abc
--- expected
<p>test<br/>
<a href="https://d.hatena.ne.jp/keyword/test" data-hatena-keyword=test target=_blank>test</a><br/>
<a href="https://d.hatena.ne.jp/keyword/test" data-hatena-keyword=test target=_blank>test</a><br/>
abc</p>

=== test
--- input
test
http://a
https://b
abc
--- expected
<p>test<br/>
<a href="http://a" target="_blank">http://a</a><br/>
<a href="https://b" target="_blank">https://b</a><br/>
abc</p>

=== test
--- input
abc
def
[[foo]]
http://ahoge
[[bar]]abc
def
--- expected
<p>abc<br/>
def<br/>
<a href="https://d.hatena.ne.jp/keyword/foo" data-hatena-keyword=foo target=_blank>foo</a><br/>
<a href="http://ahoge" target="_blank">http://ahoge</a><br/>
<a data-hatena-keyword="bar" href="https://d.hatena.ne.jp/keyword/bar" target="_blank">bar</a>abc<br/>
def</p>

=== test
--- input
abc
<a href=x>x</a>
<a href=y>y</a>
def
--- expected
<p>abc<br/>
<a href=x>x</a><br/>
<a href=y>y</a><br/>
def</p>

=== test
--- input
abc
>||

ddd

||<
def
--- expected
<p>abc</p>
<pre class=code>

ddd

</pre>
<p>def</p>

=== test
--- input
abc
-def

-xyz

def
--- expected
<p>abc</p>
<ul><li>def</li></ul>
<ul><li>xyz</li></ul>
<p>def</p>

=== test
--- input
*abc


xyz
f
--- expected
<section class=section>
<h1>abc</h1>
<p><br/>
xyz<br/>
f</p>
</section>
