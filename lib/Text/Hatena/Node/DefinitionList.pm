package Text::Hatena::Node::DefinitionList;

use strict;
use warnings;

use strict;
use warnings;
use base qw(Text::Hatena::Node);
use constant {
    DL => qr/^:([^:]*):(.*)/,
};

sub parse {
    my ($class, $s, $parent, $stack) = @_;
    if ($s->scan(DL)) {
        my $node = $class->new([ $s->matched->[0] ]);
        until ($s->eos || !$s->scan(DL)) {
            push @$node, $s->matched->[0];
        }
        push @$parent, $node;
        return 1;
    }
}

## NOT COMPATIBLE WITH Hatena Syntax
sub as_struct {
    my ($self, $context) = @_;
    my $ret = [];

    my $children = $self->children;

    for my $line (@$children) {
        if (my ($description) = ($line =~ /^::(.+)/)) {
            push @$ret, +{
                prefix  => '',
                suffix  => '',
                name    => 'dd',
                content => $context->inline->format($description),
            };
        } else {
            my ($title, $description) = ($line =~ /^:(\[.*?\]|[^:]+)(?::(.*))?$/);
            push @$ret, +{
                prefix  => '<div>',
                suffix  => '',
                name => 'dt',
                content => $context->inline->format($title),
            };
            push @$ret, +{
                prefix  => '',
                suffix  => '',
                name => 'dd',
                content => $context->inline->format($description),
            } if $description;
        }
    }

    my $last = 'dt';
    for (reverse @$ret) {
        if ($last eq 'dt') {
            $_->{suffix} = '</div>';
        }
        $last = $_->{name};
    }

    $ret;
}

sub as_html {
    my ($self, $context, %opts) = @_;

    $context->_tmpl(__PACKAGE__, q[
        <dl>
        ? for (@$items) {
        {{= $_->{prefix} }}
        <{{= $_->{name} }}>{{= $_->{content} }}</{{= $_->{name} }}>
        {{= $_->{suffix} }}
        ? }
        </dl>
    ], {
        items => $self->as_struct($context),
    });
}



1;
__END__



