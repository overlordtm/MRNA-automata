## Copyright (C) 2012 Andraz Vrhovec
## 
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with Octave; see the file COPYING.  If not, see
## <http://www.gnu.org/licenses/>.

## ./demo

## Author: Andraz Vrhovec <az@zeus>
## Created: 2012-03-22

function [ count ] = demo () 

	n = 0;
	count = [0, 0];
	while n < 1
		n++;
		[ winner, h1, h2 ] = game(87, 0.55, @Lrp, @L2n2);
		clf;
		hold on;
		plot(h1(1, :), 'b');
		plot(h2(1, :), 'r');
		legend('igralec1', 'igralec2');
		if (winner > 0)
			count(winner)++;
		endif
	end

endfunction

function [ ret, phistory1, phistory2 ] = game (Nlights, p, player1, player2)
	
	lights = zeros(1, Nlights);
	lights(ceil(Nlights/2)) = 1

	steps = 0;
	
	alpha1 = -1;
	beta1 = 0;
	p1 = [];
	pi1 = [];
	phistory1 = [];
	
	alpha2 = -1;
	beta2 = 0;
	p2 = [];
	pi2 = [];
	phistory2 = [];
	
	while( steps < 1000 )
		steps++;

		[alpha1, pi1, p1] = player1(alpha1, beta1, pi1, p1, 0.2, 0.1);
		phistory1 = [phistory1, p1];		

		r = rand();
		if ( (r < p && alpha1 == 1) || ( r >= p && alpha1 == 2) ) 
			printf('Player1: left!\n');
			lights = left(lights);
			beta1 = 0;
		else
			printf('Player1: right\n');
			lights = right(lights);
			beta1 = 1;
		endif

		if chkwin(lights) == 1, break, end

		[alpha2, pi2, p2] = player2(alpha2, beta2, pi2, p2, 0.05, 0.03);
		phistory2 = [phistory2, p2];
		
		r = rand();
		if ( (r < p && alpha2 == 1) || ( r > p && alpha2 == 2) ) 
			printf('Player2: left!\n');
			lights = left(lights);
			beta2 = 1;
		else
			printf('Player2: right\n');
			lights = right(lights);
			beta2 = 0;
		endif

		if chkwin(lights) == 1, break, end

		lights
	end
	printf('END of game! ');
	lights
	if(lights(1) == 1)
		printf('Player 1 won!\n');
		ret = 1;
	elseif (lights(end) == 1)
		printf('Player 2 won!\n');
		ret = 2;
	else
		printf('MAXSTEP limit.\n');
		ret = -1;
	endif
endfunction

function [ l ] = left (lights)
	l = circshift(lights', -1)';
endfunction

function [ l ] = right (lights)
	l = circshift(lights', 1)';
endfunction

function [ win ] = chkwin ( lights )
	if ((lights(end) == 1) || (lights(1) == 1))
		win = 1;
	else
		win = 0;
	endif
endfunction

function [ beta ] = getfeedback(player, alpha)
	if( player == alpha)
		beta = 0;
	else
		beta = 1;
	endif
endfunction
