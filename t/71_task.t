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


=== task:1 (simple)
--- input
task:1
--- expected
<p><a href="/task/1/">task:1</a></p>

=== [task:1] (enclosed)
--- input
x[task:1]y
--- expected
<p>x<a href="/task/1/">task:1</a>y</p>

=== task:1:2
--- input
task:1:2
--- expected
<p><a href="/task/1/2">task:1:2</a></p>

=== [task:1:2] (enclosed)
--- input
x[task:1:2]y
--- expected
<p>x<a href="/task/1/2">task:1:2</a>y</p>

=== text
--- input
[task:あいうえお:43]
[task:abc:43]
[task:abc-:43]
[task:abc_:43]
[task:abc_ a:43]
[task:abc_#a:43]
[task:abc_:43ab]
[task:abc%aab:43]
task:44<aa>bb:43
TASK:143:444
task:34"43
task:43&43
[task:abc_:43
TASK:AVC:55
--- expected
<p>[task:&#x3042;&#x3044;&#x3046;&#x3048;&#x304A;:43]<br/>
<a href="/task/abc/43">task:abc:43</a><br/>
<a href="/task/abc-/43">task:abc-:43</a><br/>
<a href="/task/abc_/43">task:abc_:43</a><br/>
<a href="/task/abc_/">task:abc_</a> a:43]<br/>
<a href="/task/abc_/">task:abc_</a>#a:43]<br/>
<a href="/task/abc_/43">task:abc_:43</a>ab]<br/>
<a href="/task/abc/">task:abc</a>%aab:43]<br/>
<a href="/task/44/">task:44</a><aa>bb:43<br/>
<a href="/task/143/444">task:143:444</a><br/>
<a href="/task/34/">task:34</a>"43<br/>
<a href="/task/43/">task:43</a>&43<br/>
<a href="/task/abc_/43">task:abc_:43</a><br/>
<a href="/task/AVC/55">task:AVC:55</a>
</p>
