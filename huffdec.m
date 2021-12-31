function [dhsig]=huffdec(msg)

while (char(msg(length(msg)))==' ')
  msg(length(msg))=[];  
end

t=msg(1);
msg(1)=[];
freq_leng=msg(1);
msg(1)=[];
mx=msg(1);
msg(1)=[];
n1=msg(length(msg));
msg(length(msg))=[];
w=msg(length(msg));
msg(length(msg))=[];

for i=1:t
   symbols(i)=msg(i) ;
end
msg(1:t)=[];
freq=0;
for i=1:freq_leng
   freq(i)=msg(i); 
end
msg(1:t)=[];
freq_bit='';
for i=1:length(freq)
freq_bit=strcat(freq_bit,dec2bin(freq(i),8));
end
if n1~=0
    freq_bit(length(freq_bit)-n1+1:length(freq_bit))=[];
end
freq=[];
s=1;
for i=1:mx:length(freq_bit)
  freq(s)=bin2dec(freq_bit(i:i+mx-1));
  s=s+1;
end
p=freq./sum(freq);
%dict
%------------------
dict = huffmandict(symbols,p);
%------------------
d='';
bit='';
for i=1:length(msg)
    d=dec2bin(msg(i));
    n=length(d);
    if n<8
        for j=1:8-n
          bit=strcat(bit,'0');
        end
    end
    bit=strcat(bit,d);
    
end
for i=1:length(bit)
huff_code(i)=bin2dec(bit(i));
end
if w==0
else
huff_code(length(huff_code)-w+1:length(huff_code))=[];
end
dhsig = huffmandeco(huff_code,dict); % Decode the code.
  return
end