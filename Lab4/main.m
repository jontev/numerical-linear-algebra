%Exercise 2.3

load Goose.mat
colormap('gray');
imshow(GooseBW);
figure;
A = GooseBW;
[U, S, V] = svd(A);
p=40; 
Ap=U(:,1:p)*S(1:p,1:p)*V(:,1:p)';
imshow(Ap); %Low rank (p-rank) approximation
figure;
% rank p=40 gives the 40 largest singular values, which explains 80% of the
% energy

%HUR MYCKET MINNE SPARAR MAN MED DENNA APPROXIMATION????????

%Exercise 2.4
semilogy(diag(S));
figure;

%det största ssingular värdet sigma1 ger >50% av energin
A1 = U(:,1)*S(1,1)*V(:,1)';
imshow(A1);
figure;
%picture doesnt make any sense visually

s = diag(S);
p=28; sum(s(2:p))/sum(s(2:end))
%25, 50, och 75% av totala energin
%p = 5 ger 28 % av energin
%p = 13 ger 51 % av energin
%p = 28 ger 70 % av energin


%Exercise 3.1

[x,y] = CircleData([-2,3], 6, 200, 0.5);
B = [(x.^2 + y.^2), x, y, ones(length(x),1)];
%Solve for u=argmin norm(Bu) st norm(u)=1, u* is the right singular vector
%of B corresponding to the smallest singular value. 
%u* is the optimal solution to the circle fitting the data, with the error
%given by sigma_min
%u = (a, b1, b2, c)
[U,S,V] = svd(B); %Note, V not V^T
sigma = min(diag(S));
u = V(:,4);
a = u(1);
b1 = u(2);
b2 = u(3);
c = u(4);

z = -[b1/(2*a), b2/(2*a)];
r = sqrt((b1^2 + b2^2)/(4*a^2) - (c/a));

viscircles(z,r);
hold on;
scatter(x,y);
figure;

%EXercise 4.1
load DataSet.mat

QuantityImages = 1:10; %ten digits (0-9)
for j=0:9
    ind = find(RefAns == j); %Extract their datasets
    QuantityImages(j+1) = length(ind); %Number of images of each digit not consistent
end
MaxRank = min(QuantityImages); %Highest possible rank, can't approximate with subspace that has a higher dimension

ranks = 1:MaxRank;
results = zeros(1,length(ranks));
for k=1:length(ranks)
    Subspaces = CreateSubSpaces(RefSet, RefAns, k); %For each approximating rank, create subspace Uk for each digit
    correct = 0;
    total = 0;
    for i=1:length(TestSet) %Test accuracy
        total = total +1;
        TestDigit = TestSet(:,i);
        Type = ClassifyDigit(TestDigit, Subspaces);
        Answer = TestAns(i);
        if Type==Answer
            correct = correct + 1;
        end
    end
    results(k) = 100*correct/total;
end
figure
plot(ranks, results)
title('Classification accuracy per rank of approximation')
ylabel('Accuracy [%]' )
xlabel('Rank of approximating subspace')

[accuracy, idx] = max(results);
bestrank = ranks(idx);
disp(bestrank); disp(accuracy);
