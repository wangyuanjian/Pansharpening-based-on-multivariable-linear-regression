function showtest(Pan, MS)

%imshow(Pan), title('Pan');
Pan = Pan(:, :, 1);
[m, n] = size(Pan);
Pan = double(Pan);
MS = imresize(MS, [m, n]);
MS = double(MS);
R = MS(:, :, 1);
G = MS(:, :, 2);
B = MS(:, :, 3);
MS1 = 1/3*R+1/3*G+1/3*B;
diff = Pan - MS1;
for i = 1:3
    %cc = cov(MS(:,:,i), MS1);
    %vv = var(MS1);
    MS(:, :, i) = MS(:, :, i) + diff;%*cc/vv;
end
figure, imshow(uint8(MS)), title('Fused')

