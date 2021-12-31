function [ ciphertext ] = aes_enc(x)
[s_box, inv_s_box, w, poly_mat, inv_poly_mat] = aes_init;
l=length(x);
if mod(l,16)==0
else
    for i=1:(16-mod(l,16))
        x(l+i)=' ';
    end
    
end

fg=uint8(x);
d=dec2hex(fg);
plaintext_hex=d;
 plaintext = hex2dec (plaintext_hex);
 i=1;
 ciphertext=[];
 while length(plaintext)>=16
     s=plaintext(1:16);
     cip=cipher (s, w, s_box, poly_mat);
    ciphertext(length(ciphertext)+1:length(ciphertext)+16)=cip;
    
    plaintext(1:16)=[];
 end
 disp('ciphertext=')

% ciphertext
% re_plaintext = inv_cipher (ciphertext, w, inv_s_box, inv_poly_mat)

    
return 



end