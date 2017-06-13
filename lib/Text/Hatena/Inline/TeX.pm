package Text::Hatena::Inline::TeX;
use utf8;
use strict;
use warnings;
use URI::Escape;

use Text::Hatena::Util;
use Text::Hatena::Inline::DSL;

build_inlines {
    # [tex:___]
    # \] で ] を escape できる
    syntax qr{
            \[
            tex:
            (
                (?:
                    \\\]
                    |
                    \\
                    |
                    [^\\\]]
                )+
            )
            \]
        }xi => sub {
        my ($context, $tex) = @_;

        $tex =~ s/\\([\[\]])/$1/g;

        if ($context->{use_google_chart}) {
            return sprintf('<img src="https://chart.apis.google.com/chart?cht=tx&chl=%s" alt="%s"/>',
                uri_escape_utf8($tex),
                escape_html($tex)
            );
        } else {
            return sprintf('<hatena-tex>%s</hatena-tex>', escape_html($tex));
        }
    };
};

1;
__END__
