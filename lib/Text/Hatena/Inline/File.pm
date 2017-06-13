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
            file:([^\]<>]+)
        \]
    }ix => sub {
        my ($context, $value) = @_;
        my ($user, $filename, $id);
        my $type = '';
        if ($value =~ s/:(movie|image(?::w[0-9]+|:h[0-9]+)*|sound(?::(?:[0-9]+h|)(?:[0-9]+m|)(?:[0-9]+s|)|))\z//) {
            $type = $1;
        }
        if ($value =~ s/\A($UNAME_PATTERN)://o) {
            $user = $1;
            $filename = $value;
        } else {
            $id = $value;
        }
        my $url = defined $id ? '' : sprintf(
            "https://d.hatena.ne.jp/%s/files/%s",
            $user,
            uri_escape_utf8($filename),
        );
        my $content;
        my $attrs = '';
        my $image_attrs = '';
        if ($type =~ /^image/) {
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
            $image_attrs .= ' width="'.escape_html($w).'"' if defined $w;
            $image_attrs .= ' height="'.escape_html($h).'"' if defined $h;
            $content = sprintf(
                '<img src="%s" alt="%s"%s class=http-image>',
                $url,
                $url,
                $image_attrs,
            );
        } elsif ($type =~ /^sound:(?:([0-9]+)h|)(?:([0-9]+)m|)(?:([0-9]+)s|)$/) {
            $attrs .= ' data-hatena-embed="sound"';
            my $seconds = (($1 || 0) * 60 + ($2 || 0)) * 60 + ($3 || 0);
            $attrs .= qq{ data-hatena-t="$seconds"};
        } elsif ($type) {
            $attrs .= ' data-hatena-embed="'.$type.'"';
        }
        my $link_target = $context->link_target;
        if (defined $id) {
            $attrs =~ s/data-hatena-embed=/type=/;
            $attrs =~ s/class="http-image"/type="image"/;
            $attrs =~ s/data-hatena-t=/t=/;
            return sprintf(
                qq|<hatena-file fileid="%s"%s%s></hatena-file>|,
                escape_html($id),
                $link_target,
                $attrs,
                $image_attrs,
            );
        } else {
            return sprintf(
                qq|<a href="%s"%s%s>%s</a>|,
                $url,
                $link_target,
                $attrs,
                $content || escape_html($filename),
            );
        }
    };
};

1;
