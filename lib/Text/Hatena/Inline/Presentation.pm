package Text::Hatena::Inline::Presentation;
use utf8;
use strict;
use warnings;

use Text::Hatena::Inline::DSL;

build_inlines {
    # [:presentation]
    syntax qr{\[:presentation\]}ix => sub {
        my ($context, $id) = @_;
        return q{<hatena-presentation></hatena-presentation>};
    };
};

1;
__END__
