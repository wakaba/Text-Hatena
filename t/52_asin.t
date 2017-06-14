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
=== asin:
--- input
[asin:4086185156]:
--- expected
<p><hatena-asin asin="4086185156" target="_blank"></hatena-asin>:</p>

=== asin:
--- input
[asin:B00DFLNVOI]:
--- expected
<p><hatena-asin asin="B00DFLNVOI" target="_blank"></hatena-asin>:</p>

=== asin: :detail
--- input
[asin:4086185156:detail]:
--- expected
<p><hatena-asin asin="4086185156" type="detail" target="_blank"></hatena-asin>:</p>

=== ASIN: :detail
--- input
[ASIN:4086185156:detail]:
--- expected
<p><hatena-asin asin="4086185156" type="detail" target="_blank"></hatena-asin>:</p>

=== ASIN: :detail
--- input
ASIN:4086185156:detail:
--- expected
<p><hatena-asin asin="4086185156" type="detail" target="_blank"></hatena-asin>:</p>

=== NOTASIN: :detail
--- input
NOTASIN:4086185156:detail:
--- expected
<p>NOTASIN:4086185156:detail:</p>
