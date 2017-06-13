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
	<div class="section">
		<h4>head</h4>
		<div class="section">
			<h5>head</h5>
			<p>foo</p>
		</div>
	</div>
	<div class="section">
		<h4>head</h4>
		<p>bar</p>
	</div>
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
<div class="section">
	<h3>head</h3>
	<p>foobar</p>

	<details class="seemore">
		<p>barbaz</p>
	</details>
</div>

<div class="section">
	<h3>head</h3>
	<p>foo</p>
</div>

### super seemore
::: input
* head

foobar

=====

barbaz

* head

foo

::: expected
<div class="section">
	<h3>head</h3>
	<p>foobar</p>

	<details class="seemore">
		<p>barbaz</p>

		<div class="section">
			<h3>head</h3>
			<p>foo</p>
		</div>
	</details>
</div>

### super seemore
::: input
* head

foobar

=====
* head

foo

::: expected
<div class="section">
	<h3>head</h3>
	<p>foobar</p>

	<details class="seemore">
		<div class="section">
			<h3>head</h3>
			<p>foo</p>
		</div>
	</details>
</div>

