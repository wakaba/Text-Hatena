package Text::Hatena::Inline::Embed;
use utf8;
use strict;
use warnings;

# twitter shortcode
# [tweet https://twitter.com/motemen/status/170055613668274177]

use Text::Hatena::Util;
use Text::Hatena::Inline::DSL;

build_inlines {
    syntax qr{
        \[
        (?:embed|tweet|twitter)
        [:\s]
        (?<uri>
            (?:https?)://[^\]]+?
        )
        \]
    }ix => sub {
        my ($context, $attr) = @_;
        my ($uri) = map {
            $attr->{$_} // $+{$_}
        } qw/uri/;

        my $attrs = ' data-hatena-embed=""';

        # [tweet http://... lang='ja'] 用
        my $lang;
        if ($uri =~ s{ lang='(\w+)'$}{}) {
            $lang = $1;
            $attrs .= ' data-hatena-lang="'.escape_html($lang).'"';
        }

        my $link_target = $context->link_target;

        return do {
            if ($context->network_enabled) {
                  require Text::Hatena::Embed;
                  my $embed = Text::Hatena::Embed->new({
                      cache => $context->cache,
                      lang  => $lang || $context->lang,
                  });
                  $embed->render($uri);
              } else {
                  undef;
              }
        } || sprintf(
            '<a href="%s"%s%s>%s</a>',
            $uri,
            $link_target,
            $attrs,
            $uri,
        );
    };
};

1;
__END__
