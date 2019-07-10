package Text::Hatena::Inline::Task;
use utf8;
use strict;
use warnings;

use Text::Hatena::Inline::DSL;
use Text::Hatena::Constants qw($UNAME_PATTERN);
use Text::Hatena::Util;
use URI::Escape qw(uri_escape_utf8);

## <http://g.hatena.ne.jp/help#tasksyntax>

build_inlines {
    <hatena:graph />;
    syntax qr{
        \[?
            task:([0-9A-Za-z_-]+)(?::([0-9]+)|)
        \]?
    }ix => sub {
        my ($context, $value) = @_;
        my $task_group_id = $1;
        my $task_id = $2;
        my $url = sprintf(
            "/task/%s/%s",
            uri_escape_utf8($task_group_id),
            uri_escape_utf8($task_id // ''),
          );
        my $content = 'task:' . $task_group_id;
        if (defined $task_id) {
          $content .= ':' . $task_id;
        }
        return sprintf(
          qq|<a href="%s">%s</a>|,
          $url,
          escape_html($content),
        );
    };
};

1;
