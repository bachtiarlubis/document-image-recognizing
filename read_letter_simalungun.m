function letter=read_letter_simalungun(imagn,num_letters)
% Computes the correlation between template and input image
% and its output is a string containing the letter.
% Size of 'imagn' must be 42 x 24 pixels
% Example:
% imagn=imread('D.bmp');
% letter=read_letter(imagn)
load templates_simalungun.mat
templatesSimalungun = templates_simalungun;
comp=[ ];
for n=1:num_letters %num_letter
    sem=corr2(templatesSimalungun{1,n},imagn);
    comp=[comp sem];
end
vd=find(comp==max(comp));
%*-*-*-*-*-*-*-*-*-*-*-*-*-

if vd(1,1)==1
    letter='a';
elseif vd(1,1)==2
    letter='b';
elseif vd(1,1)==3
    letter='d';
elseif vd(1,1)==4
    letter='g';
elseif vd(1,1)==5
    letter='h';
elseif vd(1,1)==6
    letter='i';
elseif vd(1,1)==7
    letter='I';
elseif vd(1,1)==8
    letter='j';
elseif vd(1,1)==9
    letter='k';
elseif vd(1,1)==10
    letter='l';
elseif vd(1,1)==11
    letter='m';
elseif vd(1,1)==12
    letter='n';
elseif vd(1,1)==13
    letter='o';
elseif vd(1,1)==14
    letter='p';
elseif vd(1,1)==15
    letter='r';
elseif vd(1,1)==16
    letter='s';
elseif vd(1,1)==17
    letter='t';
elseif vd(1,1)==18
    letter='U';
elseif vd(1,1)==19
    letter='w';
elseif vd(1,1)==20
    letter='y';
elseif vd(1,1)==21
    letter='z';
%% Simalngun Handwritten1
elseif vd(1,1)==61 || vd(1,1)==62 || vd(1,1)==63 ||vd(1,1)==64
    letter='a';
elseif vd(1,1)==65 || vd(1,1)==66 || vd(1,1)==67 || vd(1,1)==68 || vd(1,1)==69
    letter='b';
elseif vd(1,1)==70 || vd(1,1)==71 || vd(1,1)==72 || vd(1,1)==73
    letter='d';
elseif vd(1,1)==74 || vd(1,1)==75 || vd(1,1)==76 || vd(1,1)==77 || vd(1,1)==78 || vd(1,1)==79 ||...
        vd(1,1)==80 || vd(1,1)==81
    letter='i';
elseif vd(1,1)==82 || vd(1,1)==83
    letter='I';
% elseif vd(1,1)==84 || vd(1,1)==85
%     letter='m';
elseif vd(1,1)==84 || vd(1,1)==85 || vd(1,1)==86 || vd(1,1)==87 || vd(1,1)==88 || vd(1,1)==89 || vd(1,1)==90 ||...
        vd(1,1)==91 || vd(1,1)==92 || vd(1,1)==93
    letter='m';
elseif vd(1,1)==94 || vd(1,1)==95 || vd(1,1)==96 || vd(1,1)==97 || vd(1,1)==98 || vd(1,1)==99 || vd(1,1)==100 ||...
        vd(1,1)==101
    letter='n';
elseif vd(1,1)==102 || vd(1,1)==103 || vd(1,1)==104 || vd(1,1)==105 || vd(1,1)==106 || vd(1,1)==107 || vd(1,1)==108 ||...
        vd(1,1)==109
    letter='o';
elseif vd(1,1)==110 || vd(1,1)==111 || vd(1,1)==112 || vd(1,1)==113 || vd(1,1)==114 || vd(1,1)==115 || vd(1,1)==116 ||...
        vd(1,1)==117 || vd(1,1)==118 || vd(1,1)==119 || vd(1,1)==120 || vd(1,1)==121 || vd(1,1)==122 || vd(1,1)==123 ||...
        vd(1,1)==124 || vd(1,1)==125 || vd(1,1)==126 || vd(1,1)==127 || vd(1,1)==128 || vd(1,1)==129 ||vd(1,1)==130 
    letter='p';
elseif vd(1,1)==131 || vd(1,1)==132 || vd(1,1)==133 || vd(1,1)==134 || vd(1,1)==135 || vd(1,1)==136 || vd(1,1)==137 ||...
        vd(1,1)==138 || vd(1,1)==139 || vd(1,1)==140 || vd(1,1)==141 || vd(1,1)==142 || vd(1,1)==143 || vd(1,1)==144 ||...
        vd(1,1)==145 || vd(1,1)==146 || vd(1,1)==147 || vd(1,1)==148 || vd(1,1)==149 || vd(1,1)==150 || vd(1,1)==151 ||...
        vd(1,1)==152 || vd(1,1)==153 || vd(1,1)==154 || vd(1,1)== 155 || vd(1,1)==156 
    letter='r';
elseif vd(1,1)==157 || vd(1,1)==158 || vd(1,1)==159 || vd(1,1)==160 || vd(1,1)==161 || vd(1,1)==162 || vd(1,1)==163 ||...
        vd(1,1)==164 || vd(1,1)==165 || vd(1,1)==166 || vd(1,1)==167 || vd(1,1)==168 || vd(1,1)==169 || vd(1,1)==170
    letter='s';
elseif vd(1,1)==171 || vd(1,1)==172 || vd(1,1)==173 || vd(1,1)==174 || vd(1,1)==175 || vd(1,1)==176 || vd(1,1)==177 ||...
        vd(1,1)==178 || vd(1,1)==179
    letter='t';
elseif vd(1,1)==180 || vd(1,1)==181 || vd(1,1)==182 || vd(1,1)==183 || vd(1,1)==184 || vd(1,1)==185 
    letter='y';
% End 
% Simalungun Handwritten2
elseif vd(1,1)==185 || vd(1,1)==186
    letter='<';
elseif vd(1,1)==187 || vd(1,1)==188 || vd(1,1)==189 || vd(1,1)==190 || vd(1,1)==191 || vd(1,1)==192 || vd(1,1)==193 ||...
        vd(1,1)==194 || vd(1,1)==195 || vd(1,1)==196 || vd(1,1)==197 
    letter='a';
elseif vd(1,1)==198 || vd(1,1)==199
    letter='b';
elseif vd(1,1)==200 || vd(1,1)==201
    letter='a';
elseif vd(1,1)==202 || vd(1,1)==203
    letter='i';
elseif vd(1,1)==204 || vd(1,1)==205 || vd(1,1)==206 || vd(1,1)==207 || vd(1,1)==208 || vd(1,1)==209
    letter='j';
elseif vd(1,1)==210 ||vd(1,1)==211 || vd(1,1)==212 || vd(1,1)==213 || vd(1,1)==214 || vd(1,1)==215 || vd(1,1)==216 || vd(1,1)==217 ||...
        vd(1,1)==218 || vd(1,1)==219 || vd(1,1)==220
    letter='l';
elseif vd(1,1)==221 || vd(1,1)==222 || vd(1,1)==223 || vd(1,1)==224 || vd(1,1)==225 || vd(1,1)==226 || vd(1,1)==227 ||...
        vd(1,1)==228 || vd(1,1)==229 || vd(1,1)==230 || vd(1,1)==231 || vd(1,1)==232
    letter='m';
elseif vd(1,1)==233 || vd(1,1)==234 || vd(1,1)==235 || vd(1,1)==236 || vd(1,1)==237 || vd(1,1)==238 || vd(1,1)==239 ||...
        vd(1,1)==240 || vd(1,1)==241 || vd(1,1)==242 || vd(1,1)==243 || vd(1,1)==244 || vd(1,1)==245 || vd(1,1)==246 ||...
        vd(1,1)==247 || vd(1,1)==248
    letter='n';
elseif vd(1,1)==249 || vd(1,1)==250 || vd(1,1)==251 || vd(1,1)==252 || vd(1,1)==253 || vd(1,1)==254 || vd(1,1)==255 ||...
        vd(1,1)==256 || vd(1,1)==257 || vd(1,1)==258 || vd(1,1)==259 || vd(1,1)==260 || vd(1,1)==261 || vd(1,1)==262 ||...
        vd(1,1)==263 || vd(1,1)==264 || vd(1,1)==265 || vd(1,1)==266
    letter='o';
elseif vd(1,1)==267 || vd(1,1)==268 || vd(1,1)==269 || vd(1,1)==270 || vd(1,1)==271 || vd(1,1)==272 || vd(1,1)==273 ||...
        vd(1,1)==274 || vd(1,1)==275
    letter='r';
elseif vd(1,1)==276 || vd(1,1)==277 
    letter ='t';
elseif vd(1,1)==278 || vd(1,1)==279 || vd(1,1)==280 || vd(1,1)==281 || vd(1,1)==282 || vd(1,1)==283 || vd(1,1)==284 ||...
        vd(1,1)==285 || vd(1,1)==286 || vd(1,1)==287 || vd(1,1)==288 || vd(1,1)==289 || vd(1,1)==290 || vd(1,1)==291 ||...
        vd(1,1)==292
    letter ='y';
%% End
else
    letter='*';
end