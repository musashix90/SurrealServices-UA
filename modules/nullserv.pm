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

my $nnsnick_default = 'NullServ';
my $nnsnick = $nnsnick_default;

agent_connect($nnsnick, 'services', undef, '+pqzBGHS', 'Null Server');
agent_join($nnsnick, main_conf_diag);
ircd::setmode($nnsnick, main_conf_diag, '+o', $nnsnick);

sub init { }
sub begin { }
sub end { }
sub unload { }

1;