function [l,r]=euler_tot(m)
% determine euler totient function for m; also return all r coprime numbers

% http://www.wilmott.com/messageview.cfm?catid=34&threadid=58392, 2008.09.22

l=1;
for i=1:m-1
	temp(i) = gcd(i,m);
	if temp(i) == 1
		r(l) = i;
		l = l + 1;
	end
end
l=l-1;
