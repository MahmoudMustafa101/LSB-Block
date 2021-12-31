function [huf]=huffenc(msg)
symbols=unique(uint8(msg));
freq=histc(msg,symbols);
mx=length(dec2bin(max(freq)));
p=freq./sum(freq);
huff_dict=huffmandict(symbols,p); % Create the dictionary.
huff_code=huffmanenco(msg,huff_dict);
%n=8-mod(length(huff_code),8);
% the return value of huffman function in one variable
%--------------------------------------------------------
freq_bit='';
for i=1:length(freq)
freq_bit=strcat(freq_bit,dec2bin(freq(i),mx));
end
freq=[];
l1=length(freq_bit);
if mod(length(freq_bit),8)~=0
    n1=8-mod(length(freq_bit),8);
for i=1:n1
   freq_bit(length(freq_bit)+1) ='0';
end
else
    n1=0;
end

s=1;

for j=1:8:length(freq_bit) 
 
    freq(s)=bin2dec(freq_bit(j:j+7));
    s=s+1;
end
huf=0;
huf(1)=length(symbols);
huf(2)=length(freq);
huf(3)=mx;
huf(length(huf)+1:length(huf)+length(symbols))=symbols;
huf(length(huf)+1:length(huf)+length(freq))=freq;
l=length(huff_code);
if mod(length(huff_code),8)~=0
    n=8-mod(length(huff_code),8);
for i=1:n
   huff_code(l+i) =0;
end
else
    n=0;
end
for i=1:length(huff_code)
cl(i)=num2str(huff_code(i));
end
l='';
u=0;
for j=1:8:length(cl) 
    u=u+1;
for i=0:7
l=strcat(l,cl(j+i));
end
ma(u)=bin2dec(l);
l='';
end
huf(length(huf)+1:length(huf)+length(ma))=ma;
huf(length(huf)+1)=n;
huf(length(huf)+1)=n1;

file_o=fopen('d:/tr1.txt','w');
fwrite(file_o,huf,'uint8');
fclose(file_o);
%--------------------------------------------------------
return
end