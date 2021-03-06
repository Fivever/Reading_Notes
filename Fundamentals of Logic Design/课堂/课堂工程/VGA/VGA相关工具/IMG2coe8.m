function img2 = IMG2coe8(imgfile, outfile)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

img = imread('loons240x160.jpg');
height = size(img, 1);
width = size(img, 2);
s = fopen('D:\loons240x160.coe', 'wb');
fprintf(s, '%s\n', '; VGA Memory Map');
fprintf(s, '%s\n', '; .COE file with hex coefficients');
fprintf(s, '; Height: %d, Width : %d\n\n', height, width);
fprintf(s, '%s\n', 'memory_initialization_radix = 16;');
fprintf(s, '%s\n', 'memory_initialization_vector = ');
cnt = 0;
img2 = img;
for r = 1 : height
    for c = 1 : width
        cnt = cnt + 1;
        R = img(r, c, 1);
        G = img(r, c, 2);
        B = img(r, c, 3);
        Rb = dec2bin(double(R), 8);
        Gb = dec2bin(double(G), 8);
        Bb = dec2bin(double(B), 8);
        img2(r, c, 1) = bin2dec([Rb(1:4) '0000']);
        img2(r, c, 2) = bin2dec([Gb(1:4) '0000']);
        img2(r, c, 3) = bin2dec([Bb(1:4) '0000']);
        Outpixel = [Rb(1:4) Gb(1:4) Bb(1:4)];
        fprintf(s, '%X', bin2dec(Outpixel));
        if((c == width) && (r == height))
            fprintf(s, '%c', ';');
        else
            if(mod(cnt, 32) == 0)
                fprintf(s, '%c\n', ',');
            else
                fprintf(s, '%c', ',');
            end
        end
    end
end
imwrite(img2, 'D:\newpicture.bmp');
fclose(s);

