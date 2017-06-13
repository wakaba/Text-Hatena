use strict;
use warnings;
use lib 't/lib';
use Text::Hatena::Test;

plan tests => 3 * blocks;

local $Text::Hatena::Test::options = {
  %$Text::Hatena::Test::options,
  available_langs => [qw/perl/],
};

run_html;
run_html linefeed => "\r\n";
run_html linefeed => "\r";


__END__

=== test
--- input
* This is a head

foobar

barbaz

:foo:bar
:foo:bar

- list1
- list1
- list1

>|perl|
test code
||<

ok?
--- expected
<section class="section">
    <h1>This is a head</h1>
    <p>foobar</p>
    <p>barbaz</p>
    <dl>
      <div>
        <dt>foo</dt>
        <dd>bar</dd>
      </div>
      <div>
        <dt>foo</dt>
        <dd>bar</dd>
      </div>
    </dl>
    <ul>
        <li>list1</li>
        <li>list1</li>
        <li>list1</li>
    </ul>
    <pre class="code lang-perl" data-lang="perl">test code</pre>
    <p>ok?</p>
</section>


=== test
--- input
>||
<!--
test
-->
||<

--- expected
<pre class="code">
&lt;!--
test
--&gt;
</pre>

=== test
--- input
<!--

>||
test
||<

-->

--- expected
<!-- -->

