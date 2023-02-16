% =========================================================================
% Image denoising via group sparsity residual constraint, Version 2.0
% Copyright(c) 2017 Zhiyuan Zha
% All Rights Reserved.
% ----------------------------------------------------------------------
% Permission to use, copy, or modify this software and its documentation
% for educational and research purposes only and without fee is here
% granted, provided that this copyright notice and the original authors'
% names appear on all copies and supporting documentation. This program
% shall not be used, rewritten, or adapted as the basis of a commercial
% software or hardware product without first obtaining permission of the
% authors. The authors make no representations about the suitability of
% this software for any purpose. It is provided "as is" without express
% or implied warranty.
%----------------------------------------------------------------------
function [P, V]=getsvd(X)

%X: MxN matrix (M dimensions, N trials)
%Y: Y=P*X
%P: the transform matrix
%V: the variance vector

[M,N]=size(X);

mx   =  mean(X,2);
mx2  =  repmat(mx,1,N);
X    =  X-mx2;

CovX=X*X'/(N-1);

%CovX  =  CovX - diag(nsig^2*ones(size(CovX,1),1));

[P,V,~]=svd(CovX);

V=diag(V);

return;

