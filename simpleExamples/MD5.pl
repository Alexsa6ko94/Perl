#!/usr/bin/perl
use strict;
use warnings;
use 5.10.1;
use LWP::Simple;
require LWP::UserAgent;
use HTTP::Cookies;

use Digest::MD5;

my $Index   = Index->new('./config/Download.index'); # read/create Index file
my $_config = ParseUtils::pathsInit($inbox, $pub, $inbox, $inbox);
my $date    = strftime("%Y%m%d", localtime);
my $domain  = 'http://www.superintendencia.gob.ni/';

my $ua = LWP::UserAgent->new;
$ua->show_progress(1);
$ua->timeout(10);

my @links;
$links[0] = $domain.'documentos/bancos/info_excel/balance_general.xlsx';
$links[1] = $domain.'documentos/bancos/info_excel/estado_resultados.xlsx';

my $body;

foreach my $link ( @links ) {

    my $response = $ua->get($link);

    if ($response->is_success) {
        $body = $response->content;
		
        my $ctx = Digest::MD5->new;
        $ctx->add($body);
        my $indexCheck = $ctx->hexdigest;

        if (!$Index->check($indexCheck)) {
            my ($name) = $link =~ /info_excel\/(.*)/is;
            $ua->mirror($link, $_config->{DATA_PATH}.$name);
            $Index->add($indexCheck, { title => $date } );
        }

        $Index->writeIndex();
    }
    else {
        die print($response->status_line);
    }
}