package Text::Hatena::Node;

use strict;
use warnings;
use overload
    '@{}' => \&children,
    fallback => 1;

use Text::Hatena::Util;
use Text::Hatena::Node::Parser;

sub new {
    my ($class, $children) = @_;
    bless {
        children => $children || [],
    }, $class;
}

sub children { $_[0]->{children} };

sub as_html {
    my ($self, $context, %opts) = @_;
    my $ret = "";

    my $children = $_[0]->{children};
    my @texts;
    for my $child (@$children) {
        if (ref($child)) {
            $ret .= $self->as_html_paragraph($context, join("\n", @texts), %opts) if join '', @texts;
            @texts = ();
            $ret .= $child->as_html($context, %opts);
        } else {
            push @texts, $child;
        }
    }
    $ret .= $self->as_html_paragraph($context, join("\n", @texts), %opts) if join '', @texts;

    $ret;
}

## NOT COMPATIBLE WITH Hatena Syntax: Auto br insertation as \n
sub as_html_paragraph {
    my ($self, $context, $text, %opts) = @_;
    $text =~ s/\n+\z//;
    $text = $context->inline->format($text, $context);

    if ($opts{stopp}) {
        $text;
    } else {
        Text::Hatena::Node::Parser->new->format($text);
    }
}

1;
__END__



