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

function [ ret ] = demo ()
	
	Nlights = 5;
	lights = zeros(1, Nlights);
	lights(ceil(Nlights/2)) = 1

	steps = 0;

	alpha = 1;
	beta = 0;
	p = [];
	pi = [1; 0];
	while(chkwin(lights) != 1 && steps < 100)
		steps++;
		[alpha, pi, p] = L22(alpha, beta, pi, p);
		beta = getfeedback(2, alpha);
		if(alpha == 1)
			printf('Go left!\n');
			lights = left(lights);
		else
			printf('Go right\n');
			lights = right(lights);
		endif
		lights
	end
	printf('END of game!\n');

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
