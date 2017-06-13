package Text::Hatena::Inline::HatenaKeyword;
use utf8;
use strict;
use warnings;

use Text::Hatena::Inline::DSL;
use Text::Hatena::Constants qw($UNAME_PATTERN);
use Text::Hatena::Util;
use URI::Escape qw(uri_escape_utf8);

build_inlines {
    <hatena:graph />;
    syntax qr{
        (?<syntax>
            \[?
                (?<![[:alnum:]])
                k:id:(?<name>$UNAME_PATTERN)
            \]?
        )
    }ix => sub {
        my ($context, $attr) = @_;
        my ($syntax, $name) = map { $attr->{$_} // $+{$_} } qw/syntax name/;
        $syntax =~ s{^\[(.+)\]$}{$1};
        my $link_target = $context->link_target;
        return qq|<a href="http://k.hatena.ne.jp/$name/"$link_target>$syntax</a>|;
    };

    # [[___]]
    syntax qr{\[\[([^\]]+)\]\]}ix => sub {
        my ($context, $keyword) = @_;
        my $escaped_keyword = uri_escape_utf8($keyword);
        my $link_target = $context->link_target;
        my $prefix = $context->{keyword_url_prefix} || q{https://d.hatena.ne.jp/keyword/};
        return sprintf(
            qq{<a href="%s%s" data-hatena-keyword="%s"%s>%s</a>},
            $prefix,
            $escaped_keyword,
            escape_html($keyword),
            $link_target,
            $keyword,
        );
    };

    # [keyword:___]
    syntax qr{\[keyword:([^\]]+)\]}ix => sub {
        my ($context, $keyword) = @_;
        my $text = 'keyword:' . $keyword;
        my $attrs = '';
        my $suffix = '';
        if ($keyword =~ s/:map(?::(satellite|hybrid)|)\z//) {
            $attrs .= qq{ data-hatena-embed="map"};
            $attrs .= qq{ data-hatena-map-type="$1"} if $1;
        } elsif ($keyword =~ s/:detail\z//) {
            $attrs .= qq{ data-hatena-embed="keyworddetail"};
        } elsif ($keyword =~ s/:presentation(?::(mouse)|)\z//) {
            $attrs .= qq{ data-hatena-presentation="@{[$1 || '']}"};
            $suffix = '?mode=presentation';
            $suffix .= '&mouse=true' if $1;
        }
        my $escaped_keyword = uri_escape_utf8($keyword);
        my $link_target = $context->link_target;
        my $prefix = $context->{keyword_url_prefix} || q{https://d.hatena.ne.jp/keyword/};
        return sprintf(
            qq{<a href="%s%s%s" data-hatena-keyword="%s"%s%s>%s</a>},
            $prefix,
            $escaped_keyword,
            $suffix,
            escape_html($keyword),
            $link_target,
            $attrs,
            escape_html($text),
        );
    };

};

1;
