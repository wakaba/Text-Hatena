use utf8;
use strict;
use warnings;
use lib 't/lib';
use Test::Most;
use Text::Hatena::Test;
$Text::Hatena::Test::options = { use_google_chart => 0 };

plan tests => 1 * blocks();

run_html;

done_testing;


__END__

=== [tex:]
--- input
[tex:e^{i\pi} = -1]
--- expected
<p><hatena-tex>e^{i\pi} = -1</hatena-tex></p>

=== [tex:] escape
--- input
[tex:\sqrt\[3\]{4}]
--- expected
<p><hatena-tex>\sqrt[3]{4}</hatena-tex></p>

=== [tex:] マルチバイト
--- input
[tex:ほげ]
--- expected
<p><hatena-tex>ほげ</hatena-tex></p>
