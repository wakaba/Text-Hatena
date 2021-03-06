package Text::Hatena::Node::Section;

use strict;
use warnings;
use base qw(Text::Hatena::Node);

use Text::Hatena::Util;

use constant {
    SECTION => qr/^(?:
        (\*\*\*?)([^\*].*)     | # *** or **
        (\*)(?:([\w\-]+)\*)?((?!\*\*?[^\*]).*)   # *
    )$/x,
};

sub parse {
    my ($class, $s, $parent, $stack) = @_;
    if ($s->scan(SECTION)) {
        my $level = length($s->matched->[1] || $s->matched->[3]);
        my $title = $s->matched->[2] || $s->matched->[5];
        my $id    = $s->matched->[4];
        $title =~ s/^\s+|\s+$//g;

        my $node = $class->new;
        $node->{level} = $level;
        $node->{title} = $title;
        $node->{id}    = $id;

        pop @$stack while
            ((ref($stack->[-1]) eq $class) && ($stack->[-1]->level >= $level)) ||
            ($level == 1 && ref($stack->[-1]) eq 'Text::Hatena::Node::SeeMore' && !$stack->[-1]->{is_super});

        $parent = $stack->[-1];

        push @$parent, $node;
        push @$stack, $node;
        return 1;
    }
}

sub level { $_[0]->{level} }
sub title { $_[0]->{title} }
sub id    { $_[0]->{id} }

## NOT COMPATIBLE WITH Hatena Syntax
sub as_html {
    my ($self, $context, %opts) = @_;
    my $level = $self->level;
    my $id = $self->id ? sprintf(' id="%s"', escape_html($self->id)) : '';
    if ($self->id and $self->id =~ /\A([0-9]+)\z/) {
        $id .= ' data-hatena-timestamp="'.$1.'"';
    }
    my $title = $self->title;
    my $tags = '';
    while ($title =~ s/^\[([^\[\]]+)\]//) {
        my $escaped_tag = escape_html($1);
        $tags .= sprintf(
            q{<hatena-category name="%s">[%s]</hatena-category>},
            $escaped_tag,
            $escaped_tag,
        );
    }
    $context->_tmpl(__PACKAGE__, q[
        <section class="section">
            <h1{{= $id }}>{{= $tags . $title }}</h1>
            {{= $content }}
        </section>
    ], {
        tags    => $tags,
        title   => $context->inline->format($title),
        level   => $level,
        id      => $id,
        content => $self->SUPER::as_html($context, %opts),
    });
}

1;
__END__
