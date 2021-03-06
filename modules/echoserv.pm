#	This file is part of SurrealServices.
#
#	SurrealServices is free software; you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation; either version 2 of the License, or
#	(at your option) any later version.
#
#	SurrealServices is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
#	You should have received a copy of the GNU General Public License
#	along with SurrealServices; if not, write to the Free Software
#	Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
package echoserv;
use strict;

use SrSv::IRCd::Event qw( addhandler );
use SrSv::Agent;
use SrSv::Conf2Consts qw( main );

my $esnick_default = 'EchoServ';
my $esnick = $esnick_default;
addhandler('PRIVMSG', undef, undef, 'echoserv::ev_privmsg');
our $esuser = { NICK => $esnick, ID => "123AAAAAI" }; #FIXME = erry
sub ev_privmsg { 
	$esuser = { NICK => $esnick, ID => "123AAAAAI" }; #FIXME = erry
	my ($user, $dstUser, $msg) = @_;
	return unless (lc $dstUser->{NICK} eq lc $esnick);
	ircd::privmsg($dstUser, $user->{ID}, $msg);
}

addhandler('NOTICE', undef, lc $esnick, 'echoserv::ev_notice');
sub ev_notice { 
	$esuser = { NICK => $esnick, ID => "123AAAAAI" }; #FIXME = erry
	my ($user, $dstUser, $msg) = @_;
	return unless (lc $dstUser->{NICK} eq lc $esnick);
	ircd::notice($dstUser, $user, $msg);
}

agent_connect($esnick, 'services', undef, '+pqzBGHS', 'Echo Server');
agent_join($esnick, main_conf_diag);
ircd::setmode($esnick, main_conf_diag, '+o', $esnick);

sub init { }
sub begin { }
sub end { }
sub unload { }

1;
