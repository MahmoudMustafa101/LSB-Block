function [ output_args ] = hal_en(pat_sound)
clc;
huf_val=0;
%reading the cover file
%------------------------
%pat_sound=input('enter path of cover file: ','s');
pat_sound='D:\jazz_10.wav';
%------------------------
%reading the text file
%-------------------------------------
%x=input('enter path of text file: ','s');
x='D:\test1.txt';
file_open=fopen(x,'r');
if file_open==-1
    disp('your path of text file is not Available')  
end
file_read=fread(file_open,'uint8');
fclose(file_open);
disp('message :')
%-------------------------------------


r=huffenc(file_read);
%t3del
%-------
%fprintf('%c ',file_read)
fprintf('\n ')
fprintf('\n message size : %d \n',length(file_read))
disp('huffman_Enc level:')
disp('-------------------------------------------------------------------')
fprintf('\n message size after :  %d \n',length(r))
disp('-------------------------------------------------------------------')
if length(file_read)<=length(r)
    msg=char(file_read);
    huf_val=0;
else  
    msg=char(r);
    huf_val=1;
end
%----------------------
numb=length(msg);
q=dec2bin(numb);
le='';
len=dec2bin(length(q),8); 
    le=strcat(le,len);
    le=strcat(le,q);
%----------------------
rr=audioread(pat_sound);
length_caver=length(rr);
if (length_caver-length(le)) < (length(msg)+(16-mod(length(msg),16)))*8
    disp('error: your caver file lessthan length of message ')
   % exit;
else
disp('AES_Enc level:')
disp('-------------------------------------------------------------------')
 ms=aes_enc(msg);
      fprintf('%c ',ms)      
      fprintf('\n ')
 disp('--------------------------------------')
 disp('LSB_Block_Enc level:')
disp('--------------------------------------')
output_args=lsb_block_enc(ms,pat_sound,huf_val);   
end
return
end