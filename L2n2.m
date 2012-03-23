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

function [ alpha, pi, p ] = L2n2(alpha, beta, pi, p)

	N = 3;
	if( length(pi) != 2*N )
		pi = zeros(2*N, 1);
		pi(N+round(rand())) = 1;
	endif

	G = [ ones(N, 1), zeros(N, 1) ; zeros(N, 1), ones(N, 1) ];
	
	if( beta == 0 ) %reward
		block = [1, zeros(1, N-1); eye(N-1), zeros(N-1, 1)];
		F = [block, zeros(N); zeros(N), block];
	else
		block = [zeros(N-1, 1), eye(N-1); zeros(1, N)];
		F = [block, zeros(N); zeros(N), block];
		F(N,2*N) = 1;
		F(2*N, N) = 1;
	endif
	
	pi = F' * pi;
	p = G' * pi;
	
	if(rand() < p(1))
		alpha = 1;
	else
		alpha = 2;
	endif

endfunction
