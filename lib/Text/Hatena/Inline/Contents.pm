package Text::Hatena::Inline::Contents;
use utf8;
use strict;
use warnings;

use Text::Hatena::Inline::DSL;

build_inlines {
    # [:contents]
    syntax qr{\[:contents\]}ix => sub {
        my ($context, $id) = @_;
        return q{<hatena-contents></hatena-contents>};
    };
};

1;
__END__
