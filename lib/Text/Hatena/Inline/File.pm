package Text::Hatena::Inline::File;
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
        \[
            (?:
                file:(?<user>$UNAME_PATTERN)
                :(?<filename>[^\]<>"]+?)
                (?:
                    :(?<type>movie|image(?::w[0-9]+|:h[0-9]+)*)
                )?
            )
        \]
    }ix => sub {
        my ($context, $attr) = @_;
        my ($user, $filename, $type)
            = map { $attr->{$_} // $+{$_} } qw/user filename type/;
        my $url = sprintf(
            "https://d.hatena.ne.jp/%s/files/%s",
            $user,
            uri_escape_utf8($filename),
        );
        my $content;
        my $attrs = '';
        if (defined $type and $type eq 'movie') {
            $attrs .= ' data-hatena-embed="movie"';
        } elsif ($type) {
            my $w;
            my $h;
            my @options = split /:/, $type || '';
            for my $option (@options) {
                if ($option =~ /^w(\d+)/) {
                    $w = $1;
                } elsif ($option =~ /^h(\d+)/) {
                    $h = $1;
                }
            }
            if ($url =~ m{(\.[^./?#]+)\z}) {
                $url .= "?d=$1";
            }
            $attrs .= ' class="http-image"';
            my $image_attrs = '';
            $image_attrs .= ' width="'.escape_html($w).'"' if defined $w;
            $image_attrs .= ' height="'.escape_html($h).'"' if defined $h;
            $content = sprintf(
                '<img src="%s" alt="%s"%s class=http-image>',
                $url,
                $url,
                $image_attrs,
            );
        }
        my $link_target = $context->link_target;
        return sprintf(
            qq|<a href="%s"%s%s>%s</a>|,
            $url,
            $link_target,
            $attrs,
            $content || escape_html($filename),
        );
    };
};

1;
