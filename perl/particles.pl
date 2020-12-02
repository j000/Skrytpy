#!/usr/bin/env perl
# Jarosław Rymut, 2020

use v5.30;
use warnings;
use utf8;

BEGIN {
	binmode STDOUT, ":encoding(UTF-8)";
	binmode STDERR, ":encoding(UTF-8)";
	binmode STDIN, ":encoding(UTF-8)";

	if (@ARGV) {
		print(<<"USAGE");
Docelowo prosta animacja zachowania cząsteczek.

Użycie: $0

Do działania skrypt wymaga PDL. Najprościej: apt install pdl

Jarosław Rymut, 2020
USAGE
		exit(1);
	}
}

use PDL;

use File::Basename;
use lib dirname (__FILE__);
use Particle;
use Scene;
use ConsoleRenderer;
use Emitter;
use Force;

my $renderer = new ConsoleRenderer();
my $scene = new Scene($renderer);
my $emitter = new Emitter(pdl[0, 1, 0]);
$scene->add_emiter($emitter);
my $gravity = new Force(pdl[0, 0.1, 0]);
$scene->add_force($gravity);
# wind
# $scene->add_force(new Force(pdl[0.05, 0, 0]));

$scene->main_loop();
