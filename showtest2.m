function showtest2(Pan, MS)
Pan = double(Pan);
MS = double(MS);
[m, n, ~] = size(MS);
Pan = Pan(:, :, 1);

pan_down = imresize(Pan, [m, n]);
pan_down = pan_down(:);
R = MS(:, :, 1);
R = R(:);
G = MS(:, :, 2);
G = G(:);
B = MS(:, :, 3);
B = B(:);
one = ones(size(B));
X = [R G B one];
alpha = pinv(X'*X)*X'*pan_down
[mm, nn] = size(Pan);
MS = imresize(MS, [mm, nn]);
R = MS(:, :, 1);
G = MS(:, :, 2);
B = MS(:, :, 3);
MS1 = alpha(1)*R + alpha(2)*G + alpha(3)*B + alpha(4);
figure, imshow(uint8(MS1), []), title('Indensity');
% [hgram, ~] = imhist(MS1);
% Pan = histeq(Pan, hgram);
% figure, imshow(uint8(Pan), []);
diff = Pan - MS1;
% diff = Lforward(diff);
figure, imshow(uint8(diff), []), title('Diff');
for  i = 1:3
    MS(:, :, i) = MS(:, :, i) + diff;
end
figure, imshow(uint8(MS), []), title('Fused - MLR');
imwrite(uint8(MS), '5a_Fused_Result.tif');

