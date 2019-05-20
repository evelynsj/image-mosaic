function h = computeH(t1,t2)

n = size(t1,2);

% convert to column vectors
pts1 = t1';
pts2 = t2';

A = zeros(2*n,9);
h = zeros(9,1);
% b = t2(:);
b = zeros(size(t2,2)*2,1);

for i=1:n
    x = pts1(i,1);
    y = pts1(i,2);
    xp = pts2(i,1);
    yp = pts2(i,2);
    A(2*i-1,:) = [x y 1 0 0 0 -xp*x -xp*y -xp]; %places value in every even row
    A(2*i , :) = [0 0 0 x y 1 -yp*x -yp*y -yp]; %places value in every odd row

end    

[V,D] = eigs(A'*A, 1, 'sm'); % calculates the eigenvector of A'A with the smallest eigenvalue
h = reshape(V,3,3)';
% disp(h);


end
%semi-working
% A*h=b 
% h = A^-1 * b
% h = A \ b;
% h(9) = 1;

% [V,D] = eig(transpose(A)*A);
% [d,ind]=sort(diag(D));
% Ds = D(ind,ind);
% disp(Ds);
% h = V(:,end);


% U = transpose(A) * A;
% [V,D] = eigs(U,1,'SM');
% h = V;
% disp(h);
% disp(A);
%svd = singular value decomposition
% [U,S,V] = svd(A);
% h = V(:,end);

%ignore this part:
% A_inv = pinv(A); 
% disp(A_inv);
% h = A_inv * b;


% square_A = reshape(A,4,4);
% disp(square_A);
% disp(A_inv);

% h = eig(transpose(A) * A);


