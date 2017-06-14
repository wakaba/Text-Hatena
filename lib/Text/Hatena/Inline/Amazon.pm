package Text::Hatena::Inline::Amazon;
use utf8;
use strict;
use warnings;
use URI::Escape;
use Text::Hatena::Inline::DSL;

build_inlines {
    # [amazon:___]
    syntax qr{\[amazon:(.+)\]}i=> sub {
        my ($context, $keyword) = @_;
        my $amazonid = $context->{amazonid} || $context->stash->{affiliateid}->{amazonid} || 'hatena-22';
        my $link_target = $context->link_target;
        my $escaped_keyword = uri_escape_utf8($keyword);
        return qq|<a href="https://www.amazon.co.jp/exec/obidos/external-search?mode=blended&tag=$amazonid&keyword=$escaped_keyword"$link_target>amazon:$keyword</a>|;
    };

    # [asin:___]
    syntax qr{\[asin:([0-9A-Za-z]+)(?::(detail)|)\]}i=> sub {
        my ($context, $asin, $type) = @_;
        my $link_target = $context->link_target;
        $type = defined $type ? qq{ type="$type"} : '';
        return qq|<hatena-asin asin="$asin"$type$link_target></hatena-asin>|;
    };

    # asin:___
    syntax qr{
      (?<![[:alnum:]])
      asin:([0-9A-Za-z]+)(?::(detail)|)
    }ix=> sub {
        my ($context, $asin, $type) = @_;
        my $link_target = $context->link_target;
        $type = defined $type ? qq{ type="$type"} : '';
        return qq|<hatena-asin asin="$asin"$type$link_target></hatena-asin>|;
    };
};

1;
__END__

