package Text::Hatena::Inline::Gist;
use utf8;
use strict;
use warnings;

use Text::Hatena::Inline::DSL;

build_inlines {
    # [gist:___]
    syntax qr{\[gist:([0-9]+)\]}ix => sub {
        my ($context, $id) = @_;
        if ($context->network_enabled) {
            return qq|<script src="https://gist.github.com/$id.js"></script>|;
        } else {
            return sprintf(
                '<a href="https://gist.github.com/%s"%s data-hatena-embed="">https://gist.github.com/%s</a>',
                $id,
                $context->link_target,
                $id,
            );

        }
    };
};

1;
__END__
