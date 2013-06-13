function out = innerProduct(f, g)
%INNERPRODUCT   Compute the inner product of two BNDFUN objects.
%   INNERPRODUCT(F, G) returns the L2 inner product (on [a,b]) of the two
%   BNDFUN objects F and G (conjugate linear in F).
%
%   If F and/or G are array-valued BNDFUN objects, then the result is a matrix
%   whose i,j entry is the inner product of the ith column of F with the jth
%   column of G.
%
%   The BNDFUN objects F and G are assumed to have the same domain. The method
%   gives no warning if their domains don't agree, but the output of the method
%   will be gibberish.

% Deal with empty case:
if ( isempty(f) || isempty(g) )
    out = [];
    return
end

if ( ~isa(f, 'bndfun') || ~isa(g, 'bndfun') )
    error('CHEBFUN:FUN:innerProduct:input', ...
        'innerProduct() only operates on two FUN objects.');
end

% Rescaling factor, (b-a)/2
rescaleFactor = (.5*diff(f.domain));

% Assign the output to be the inner product of the onefuns of the input,
% rescaled.
out = innerProduct(f.onefun, g.onefun)*rescaleFactor;

end
