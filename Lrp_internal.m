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

function [ alpha, pi, p ] = Lrp_internal(a, b, alpha, beta, pi, p)

	if( length(p) != 2 )
		p = [0.5; 0.5];
	endif

	if(alpha == 1 && beta == 0)
		p(1) = p(1) * (1-a) + a;
		p(2) = p(2) * (1-a);
	elseif(alpha == 1 && beta == 1)
		p(1) = p(1) * (1-b);
		p(2) = p(2) * (1-b) + b;
	elseif(alpha == 2 && beta == 0)
		p(1) = p(1) * (1-a);
		p(2) = p(2) * (1-a) + a;
	elseif(alpha == 2 && beta == 1)
		p(1) = p(1) * (1-b) + b;
		p(2) = p(2) * (1-b);
	endif

	if(rand() < p(1))
		alpha = 1;
	else
		alpha = 2;
	endif
endfunction
