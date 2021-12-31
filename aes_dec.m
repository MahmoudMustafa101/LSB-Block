function [ w ] = aes_dec( x )
 [s_box, inv_s_box, w, poly_mat, inv_poly_mat] = aes_init;
 %ciphertext=int8(x)
 ciphertext=x;
 plantext=[];
  while length(ciphertext)>=16
     s=ciphertext(1:16);
     cip=inv_cipher (s, w, inv_s_box, inv_poly_mat);
    plantext(length(plantext)+1:length(plantext)+16)=cip;
   % i=i+1
    
    ciphertext(1:16)=[];
  end
 
%re_plaintext = inv_cipher (ciphertext, w, inv_s_box, inv_poly_mat);
w=plantext;
return
end