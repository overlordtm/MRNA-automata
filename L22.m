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

function [ alpha, pi, p ] = L22(alpha, beta, pi, p)

	if ( length(pi) != 2 )
		a = round(rand());
		pi = [1-a;a];
	endif
	
	G = eye(2);

	if(beta == 0)
		F = eye(2); %reward, stay in same state
	else
		F = flipud(eye(2)); %penalty, change state
	endif

	pi = F' * pi;
	p = G' * pi;

	if(p(1) == 1)
		alpha = 1;
	else
		alpha = 2;
	endif

endfunction
