use strict;
use warnings;
use lib 't/lib';
use Text::Hatena::Test;
delimiters '###', ':::';

plan tests => 1 * blocks;

run_html;


__END__
### test
::: input
foobar

>||
superpre
====
||<

====

barbaz

** head

*** head

foo

** head

bar

::: expected
<p>foobar</p>
<pre class="code">superpre
====</pre>
<details class="seemore">
	<p>barbaz</p>
	<section class="section">
		<h1>head</h1>
		<section class="section">
			<h1>head</h1>
			<p>foo</p>
		</section>
	</section>
	<section class="section">
		<h1>head</h1>
		<p>bar</p>
	</section>
</details>

### test
::: input
* head

foobar

====

barbaz

* head

foo

::: expected
<section class="section">
	<h1>head</h1>
	<p>foobar</p>

	<details class="seemore">
		<p>barbaz</p>
	</details>
</section>

<section class="section">
	<h1>head</h1>
	<p>foo</p>
</section>

### super seemore
::: input
* head

foobar

=====

barbaz

* head

foo

::: expected
<section class="section">
	<h1>head</h1>
	<p>foobar</p>

	<details class="seemore">
		<p>barbaz</p>

		<section class="section">
			<h1>head</h1>
			<p>foo</p>
		</section>
	</details>
</section>

### super seemore
::: input
* head

foobar

=====
* head

foo

::: expected
<section class="section">
	<h1>head</h1>
	<p>foobar</p>

	<details class="seemore">
		<section class="section">
			<h1>head</h1>
			<p>foo</p>
		</section>
	</details>
</section>

