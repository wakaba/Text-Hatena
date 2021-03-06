requires 'Carp';
requires 'Class::Accessor::Fast';
requires 'Class::Accessor::Lvalue::Fast';
requires 'Digest::SHA1';
requires 'Encode';
requires 'Exporter';
requires 'Exporter::Lite';
requires 'HTML::Entities';
requires 'HTML::Parser';
requires 'HTML::Tagset';
requires 'JSON::XS';
requires 'List::MoreUtils';
requires 'Regexp::Assemble';
requires 'Text::MicroTemplate';
requires 'UNIVERSAL::require';
requires 'URI::Escape';

## optional
requires 'Cache::MemoryCache';
requires 'LWP::UserAgent';
requires 'Any::Moose';
requires 'Web::oEmbed';
requires 'Text::VimColor';

on build => sub {
    requires 'AnyEvent::HTTP';
    requires 'Data::Dumper';
    requires 'ExtUtils::MakeMaker', '6.36';
    requires 'Guard';
    requires 'HTTP::Message::PSGI';
    requires 'HTTP::Response';
    requires 'HTTP::Server::PSGI';
    requires 'LWP::Protocol';
    requires 'LWP::Protocol::PSGI';
    requires 'Plack::Request';
    requires 'Scalar::Util';
    requires 'Test::More';
    requires 'Test::Most';
    requires 'Test::Name::FromLine';
    requires 'Test::TCP';
    requires 'URI';
};
