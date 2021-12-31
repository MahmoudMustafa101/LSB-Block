function [ ] = lah_de( input_args )
clear;
clc;
s=input('enter path of recover file: ','s');
fprintf('\n \n \n ')
disp('LSB_Block_Dec Level: ')
disp('-------------------------------------------------------------------')
[w,huf_val]=lsb_block_dec(s);
fprintf('%c ',w)
disp('-------------------------------------------------------------------')
disp('AES_Dec Level: ')
disp('-------------------------------------------------------------------')
q=aes_dec(w);
fprintf('%c',q);
fprintf('\n ')
disp('-------------------------------------------------------------------')
disp('Huffman_Dec Level: ')
fprintf('\n ')
disp('-------------------------------------------------------------------')
fprintf('\n ')
if huf_val=='1'
  y=huffdec(q); 
else
 y=q;  
  while(char(y(length(y)))==' ')
  y(length(y))=[];  
  end
end
fprintf('%c',y);
fprintf('\n ')
disp('-------------------------------------------------------------------')
end