use strict;
use warnings;
use lib 't/lib';
use Text::Hatena::Test;

plan tests => 1 * blocks;

run_html;


__END__

=== test
--- input
* test1

foo

* test2

bar
--- expected
<section class="section">
<h1>test1</h1>
<p>foo</p>
</section>

<section class="section">
<h1>test2</h1>
<p>bar</p>
</section>


=== test
--- input
* test1

foo

** test1.1

foo!

** test1.2

foo!

*** test1.2.1

foo!

* test2

bar
--- expected
<section class="section">
<h1>test1</h1>
<p>foo</p>

<section class="section">
<h1>test1.1</h1>
<p>foo!</p>
</section>

<section class="section">
<h1>test1.2</h1>
<p>foo!</p>

<section class="section">
<h1>test1.2.1</h1>
<p>foo!</p>
</section>
</section>
</section>

<section class="section">
<h1>test2</h1>
<p>bar</p>
</section>


=== test
--- input
* http://example.com/
foo
--- expected
<section class="section">
<h1><a href="http://example.com/" target="_blank">http://example.com/</a></h1>
<p>foo</p>
</section>

=== heading
--- input
* ***
foobar
--- expected
<section class="section">
	<h1>***</h1>
	<p>foobar</p>
</section>

=== very complex heading
--- input
****foobar
foobar
--- expected
<section class="section">
	<h1>***foobar</h1>
	<p>foobar</p>
</section>

=== very complex heading
--- input
* 
trailing space

** 
trailing space

*** 
trailing space

*
no spaces

**
no spaces

***
no spaces
--- expected
<section class="section">
	<h1></h1>
	<p>trailing space</p>
	<section class="section">
		<h1></h1>
		<p>trailing space</p>

		<section class="section">
			<h1></h1>
			<p>trailing space</p>
		</section>
	</section>
</section>

<section class="section">
	<h1></h1>
	<p>no spaces</p>
</section>

<section class="section">
	<h1>*</h1>
	<p>no spaces</p>
</section>

<section class="section">
	<h1>**</h1>
	<p>no spaces</p>
</section>


=== named
--- input
*hoge_fuga* test1

foo

*123-456* test2

bar

*a.b* test3
baz
--- expected
<section class="section">
<h1 id="hoge_fuga">test1</h1>
<p>foo</p>
</section>

<section class="section">
<h1 id="123-456">test2</h1>
<p>bar</p>
</section>

<section class="section">
<h1>a.b* test3</h1>
<p>baz</p>
</section>
