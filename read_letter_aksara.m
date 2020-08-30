function [letter, idLetters] = read_letter_aksara(imagn,num_letters) % adding more variables, ie. idLetters
% Computes the correlation between template and input image
% and its output is a string containing the letter.
% Size of 'imagn' must be 42 x 24 pixels
% Example:
% imagn=imread('D.bmp');
% letter=read_letter(imagn)
load templates_aksara.mat
templatesAksara = templates_aksara;

% global fStyle;
idLetters = [];
comp=[ ];
for n=1:num_letters %num_letter
    sem=corr2(templatesAksara{1,n},imagn);
    comp=[comp sem];
end
vd=find(comp==max(comp));
idLetters = vd(1,1);
%*-*-*-*-*-*-*-*-*-*-*-*-*-
% if vd(1,1) == 8 || vd(1,1) == 17 || vd(1,1) == 42 || vd(1,1)==51 || vd(1,1)==56 || vd(1,1)==59
%     fStyle ='Karo';
% elseif vd(1,1) == 9 || vd(1,1) == 18 || vd(1,1) == 23 || vd(1,1) == 30 || vd(1,1) == 34 || vd(1,1) == 46 || vd(1,1)==52
%     fStyle ='Mandailing'; 
% elseif vd(1,1) == 10
%     fStyle ='Pakpak';
% elseif vd(1,1) == 11 || vd(1,1) == 49
%     fStyle ='Toba';
% elseif vd(1,1) == 21 || vd(1,1) == 31 || vd(1,1) == 33 || vd(1,1) == 36 || vd(1,1) == 41 || vd(1,1) == 45 || vd(1,1)==47||...
%         vd(1,1)==55 || vd(1,1)==58 || vd(1,1)==60
%     fStyle ='Simalungun';
% else
%     fStyle ='Undetected';
% end
%*-*-*-*-*-*-*-*-*-*-*-*-*-
if vd(1,1)==1
    letter='\';
elseif vd(1,1)==2
    letter='[';
elseif vd(1,1)==3
    letter='<';
elseif vd(1,1)==4
    letter='a';
elseif vd(1,1)==5
    letter='a';
elseif vd(1,1)==6
    letter='b';
elseif vd(1,1)==7
    letter='b';
elseif vd(1,1)==8
    letter='c';
%     fStyle ='Karo';
elseif vd(1,1)==9
    letter='c';
%     fStyle ='Mandailing';
elseif vd(1,1)==10
    letter='c';
%     fStyle ='Pakpak';
elseif vd(1,1)==11
    letter='c';
%     fStyle ='Toba';
elseif vd(1,1)==12
    letter='d';
elseif vd(1,1)==13
    letter='e';
elseif vd(1,1)==14
    letter='e';
elseif vd(1,1)==15
    letter='e';
elseif vd(1,1)==16
    letter='e';
elseif vd(1,1)==17
    letter='f';
elseif vd(1,1)==18
    letter='f';
elseif vd(1,1)==19
    letter='f';
elseif vd(1,1)==20
    letter='g';
elseif vd(1,1)==21
    letter='g';
elseif vd(1,1)==22
    letter='h';
elseif vd(1,1)==23
    letter='h';
elseif vd(1,1)==24
    letter='h';
elseif vd(1,1)==25
    letter='i';
elseif vd(1,1) == 26
    letter ='i';
elseif vd(1,1) == 27
    letter = 'I';
elseif vd(1,1)==28
    letter='j';
elseif vd(1,1)==29
    letter='j';
elseif vd(1,1)==30
    letter='k';
elseif vd(1,1)==31
    letter='k';
elseif vd(1,1)==32
    letter='l';
elseif vd(1,1)==33
    letter='l';
elseif vd(1,1)==34
    letter='L';
elseif vd(1,1)==35
    letter='m';
elseif vd(1,1)==36
    letter='m';
elseif vd(1,1)==37
    letter='n';
elseif vd(1,1)==38
    letter='o';
elseif vd(1,1)==39
    letter='p';
elseif vd(1,1)==40
    letter='p';
elseif vd(1,1)==41
    letter='p';
elseif vd(1,1)==42
    letter='q';
elseif vd(1,1)==43
    letter='q';
elseif vd(1,1)==44
    letter='r';
elseif vd(1,1)==45
    letter='r';
elseif vd(1,1)==46
    letter='s';
elseif vd(1,1)==47
    letter='s';
elseif vd(1,1)==48
    letter='t';
elseif vd(1,1)==49
    letter='T';
elseif vd(1,1)==50
    letter='U';
elseif vd(1,1)==51
    letter='v';
elseif vd(1,1) == 52
    letter ='v';
elseif vd(1,1) == 53
    letter = 'v';
elseif vd(1,1)==54
    letter='w';
elseif vd(1,1)==55
    letter='w';
elseif vd(1,1)==56
    letter='x';
elseif vd(1,1)==57
    letter='y';
elseif vd(1,1)==58
    letter='y';
elseif vd(1,1)==59
    letter='z';
elseif vd(1,1)==60
    letter='z';
%Simalngun Handwritten1
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
elseif vd(1,1)==210 || vd(1,1)==212 || vd(1,1)==213 || vd(1,1)==214 || vd(1,1)==215 || vd(1,1)==216 || vd(1,1)==217 ||...
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
% End
% Toba Handwritten
elseif vd(1,1)==293 || vd(1,1)==294 || vd(1,1)==295 
    letter ='a';
elseif vd(1,1)==296 || vd(1,1)==297 || vd(1,1)==298 || vd(1,1)==299 || vd(1,1)==300 || vd(1,1)==301 || vd(1,1)==302 ||...
        vd(1,1)==303 || vd(1,1)==304 || vd(1,1)==305 || vd(1,1)==306 || vd(1,1)==307 || vd(1,1)==308
    letter ='d';
elseif vd(1,1)==309 || vd(1,1)==310 || vd(1,1)==311 || vd(1,1)==312 || vd(1,1)==313 || vd(1,1)==314 || vd(1,1)==315 ||...
        vd(1,1)==316 || vd(1,1)==317 || vd(1,1)==318 || vd(1,1)==319 || vd(1,1)==320
    letter ='f';
elseif vd(1,1)==321 || vd(1,1)==322 || vd(1,1)==323
    letter ='g';
elseif vd(1,1)==324
    letter ='I';
elseif vd(1,1)==325
    letter ='k';
elseif vd(1,1)==326 || vd(1,1)==327 || vd(1,1)==328 || vd(1,1)==329 || vd(1,1)==330
    letter ='l';
elseif vd(1,1)==331 || vd(1,1)==332
    letter ='m';
elseif vd(1,1)==333 || vd(1,1)==334
    letter ='n';
elseif vd(1,1)==344
    letter ='p';
elseif vd(1,1)==345 || vd(1,1)==346 || vd(1,1)==347 || vd(1,1)==348 || vd(1,1)==349 || vd(1,1)==350 || vd(1,1)==351
    letter ='r';
elseif vd(1,1)==352 || vd(1,1)==353 || vd(1,1)==354 || vd(1,1)==355
    letter ='y';
% End
else
    letter ='*'; % undetected letter
end

%% Old Version
%{
if vd==1
    letter='\';
elseif vd==2
    letter='[';
elseif vd==3
    letter='<';
elseif vd==4
    letter='<';
elseif vd==5
    letter='<';
elseif vd==6
    letter='a';
elseif vd==7
    letter='a';
elseif vd==8
    letter='a';
elseif vd==9
    letter='a';
elseif vd==10
    letter='a';
elseif vd==11
    letter='a';
elseif vd==12
    letter='a';
elseif vd==13
    letter='a';
elseif vd==14
    letter='a';
elseif vd==15
    letter='a';
elseif vd==16
    letter='a';
elseif vd==17
    letter='a';
elseif vd==18
    letter='a';
elseif vd==19
    letter='a';
elseif vd==20
    letter='a';
elseif vd==21
    letter='a';
elseif vd==22
    letter='a';
elseif vd==23
    letter='a';
elseif vd==24
    letter='a';
elseif vd==25
    letter='a';
elseif vd == 26
    letter ='a';
elseif vd == 27
    letter = 'a';
elseif vd==28
    letter='a';
elseif vd==29
    letter='a';
elseif vd==30
    letter='a';
elseif vd==31
    letter='b';
elseif vd==32
    letter='b';
elseif vd==33
    letter='b';
elseif vd==34
    letter='b';
elseif vd==35
    letter='b';
elseif vd==36
    letter='b';
elseif vd==37
    letter='b';
elseif vd==38
    letter='b';
elseif vd==39
    letter='b';
elseif vd==40
    letter='b';
elseif vd==41
    letter='b';
elseif vd==42
    letter='b';
elseif vd==43
    letter='b';
elseif vd==44
    letter='b';
elseif vd==45
    letter='c';
elseif vd==46
    letter='c';
elseif vd==47
    letter='c';
elseif vd==48
    letter='c';
elseif vd==49
    letter='c';
elseif vd==50
    letter='d';
elseif vd==51
    letter='d';
elseif vd == 52
    letter ='d';
elseif vd == 53
    letter = 'd';
elseif vd==54
    letter='d';
elseif vd==55
    letter='d';
elseif vd==56
    letter='d';
elseif vd==57
    letter='d';
elseif vd==58
    letter='d';
elseif vd==59
    letter='d';
elseif vd==60
    letter='d';
elseif vd==61
    letter='d';
elseif vd==62
    letter='d';
elseif vd==63
    letter='d';
elseif vd==64
    letter='d';
elseif vd==65
    letter='d';
elseif vd==66
    letter='d';
elseif vd==67
    letter='d';
elseif vd==68
    letter='d';
elseif vd==69
    letter='d';
elseif vd==70
    letter='d';
elseif vd==71
    letter='d';
elseif vd==72
    letter='d';
elseif vd==73
    letter='d';
elseif vd==74
    letter='e';
elseif vd==75
    letter='e';
elseif vd==76
    letter='e';
elseif vd==77
    letter='e';
elseif vd == 78
    letter ='e';
elseif vd == 79
    letter = 'e';
elseif vd==80
    letter='f';
elseif vd==81
    letter='f';
elseif vd==82
    letter='f';
elseif vd==83
    letter='f';
elseif vd==84
    letter='f';
elseif vd==85
    letter='f';
elseif vd==86
    letter='f';
elseif vd==87
    letter='f';
elseif vd==88
    letter='f';
elseif vd==89
    letter='f';
elseif vd==90
    letter='f';
elseif vd==91
    letter='f';
elseif vd==92
    letter='f';
elseif vd==93
    letter='f';
elseif vd==94
    letter='f';
elseif vd==95
    letter='g';
elseif vd==96
    letter='g';
elseif vd==97
    letter='g';
elseif vd==98
    letter='g';
elseif vd==99
    letter='g';
elseif vd==100
    letter='g';
elseif vd==101
    letter='g';
elseif vd==102
    letter='g';
elseif vd==103
    letter='g';
elseif vd == 104
    letter ='g';
elseif vd == 105
    letter = 'g';
elseif vd==106
    letter='g';
elseif vd==107
    letter='h';
elseif vd==108
    letter='h';
elseif vd==109
    letter='h';
elseif vd==110
    letter='h';
elseif vd==111
    letter='h';
elseif vd==112
    letter='i';
elseif vd==113
    letter='i';
elseif vd==114
    letter='i';
elseif vd==115
    letter='i';
elseif vd==116
    letter='i';
elseif vd==117
    letter='i';
elseif vd==118
    letter='i';
elseif vd==119
    letter='i';
elseif vd==120
    letter='i';
elseif vd==121
    letter='i';
elseif vd==122
    letter='i';
elseif vd==123
    letter='i';
elseif vd==124
    letter='i';
elseif vd==125
    letter='i';
elseif vd==126
    letter='i';
elseif vd==127
    letter='i';
elseif vd==128
    letter='I';
elseif vd==129
    letter='I';
elseif vd == 130
    letter ='I';
elseif vd == 131
    letter = 'I';
elseif vd==132
    letter='I';
elseif vd==133
    letter='I';
elseif vd==134
    letter='I';
elseif vd==135
    letter='I';
elseif vd==136
    letter='I';
elseif vd==137
    letter='j';
elseif vd==138
    letter='j';
elseif vd==139
    letter='j';
elseif vd==140
    letter='j';
elseif vd==141
    letter='j';
elseif vd==142
    letter='j';
elseif vd==143
    letter='j';
elseif vd==144
    letter='j';
elseif vd==145
    letter='j';
elseif vd==146
    letter='j';
elseif vd==147
    letter='j';
elseif vd==148
    letter='j';
elseif vd==149
    letter='j';
elseif vd==150
    letter='k';
elseif vd==151
    letter='k';
elseif vd==152
    letter='k';
elseif vd==153
    letter='k';
elseif vd==154
    letter='k';
elseif vd==155
    letter='k';
elseif vd == 156
    letter ='k';
elseif vd == 157
    letter = 'l';
elseif vd==158
    letter='l';
elseif vd==159
    letter='l';
elseif vd==160
    letter='l';
elseif vd==161
    letter='l';
elseif vd==162
    letter='l';
elseif vd==163
    letter='l';
elseif vd==164
    letter='l';
elseif vd==165
    letter='l';
elseif vd==167
    letter='l';
elseif vd==168
    letter='l';
elseif vd==169
    letter='l';
elseif vd==170
    letter='l';
elseif vd==171
    letter='l';
elseif vd==172
    letter='l';
elseif vd==173
    letter='l';
elseif vd==174
    letter='l';
elseif vd==175
    letter='l';
elseif vd==176
    letter='l';
elseif vd==177
    letter='l';
elseif vd==178
    letter='l';
elseif vd==179
    letter='l';
elseif vd==180
    letter='l';
elseif vd==181
    letter='m';
elseif vd==182
    letter='m';
elseif vd == 183
    letter ='m';
elseif vd == 184
    letter = 'm';
elseif vd==185
    letter='m';
elseif vd==186
    letter='m';
elseif vd==187
    letter='m';
elseif vd==188
    letter='m';
elseif vd==189
    letter='m';
elseif vd==190
    letter='m';
elseif vd==191
    letter='m';
elseif vd==192
    letter='m';
elseif vd==193
    letter='m';
elseif vd==194
    letter='m';
elseif vd==195
    letter='m';
elseif vd==196
    letter='m';
elseif vd==197
    letter='m';
elseif vd==198
    letter='m';
elseif vd==199
    letter='m';
elseif vd==200
    letter='m';
elseif vd==201
    letter='m';
elseif vd==202
    letter='m';
elseif vd==203
    letter='m';
elseif vd==204
    letter='m';
elseif vd==205
    letter='m';
elseif vd==206
    letter='m';
elseif vd==207
    letter='m';
elseif vd==208
    letter='m';
elseif vd == 209
    letter ='m';
elseif vd == 210
    letter = 'm';
elseif vd==211
    letter='n';
elseif vd==212
    letter='n';
elseif vd==213
    letter='n';
elseif vd==214
    letter='n';
elseif vd==215
    letter='n';
elseif vd==216
    letter='n';
elseif vd==217
    letter='n';
elseif vd==218
    letter='n';
elseif vd==219
    letter='n';
elseif vd==220
    letter='n';
elseif vd==221
    letter='n';
elseif vd==222
    letter='n';
elseif vd==223
    letter='n';
elseif vd==224
    letter='n';
elseif vd==225
    letter='n';
elseif vd==226
    letter='n';
elseif vd==227
    letter='n';
elseif vd==228
    letter='n';
elseif vd==229
    letter='n';
elseif vd==230
    letter='n';
elseif vd==231
    letter='n';
elseif vd==232
    letter='n';
elseif vd==233
    letter='n';
elseif vd==234
    letter='n';
elseif vd == 235
    letter ='n';
elseif vd == 236
    letter = 'n';
elseif vd==237
    letter='n';
elseif vd==238
    letter='n';
elseif vd==239
    letter='n';
elseif vd==240
    letter='n';
elseif vd==241
    letter='n';
elseif vd==242
    letter='n';
elseif vd==243
    letter='n';
elseif vd==244
    letter='o';
elseif vd==245
    letter='o';
elseif vd==246
    letter='o';
elseif vd==247
    letter='o';
elseif vd==248
    letter='o';
elseif vd==249
    letter='o';
elseif vd==250
    letter='o';
elseif vd==251
    letter='o';
elseif vd==252
    letter='o';
elseif vd==253
    letter='o';
elseif vd==254
    letter='o';
elseif vd==255
    letter='o';
elseif vd==256
    letter='o';
elseif vd==257
    letter='o';
elseif vd==258
    letter='o';
elseif vd==259
    letter='o';
elseif vd==260
    letter='o';
elseif vd == 261
    letter ='o';
elseif vd == 262
    letter = 'o';
elseif vd==263
    letter='o';
elseif vd==264
    letter='o';
elseif vd==265
    letter='o';
elseif vd==266
    letter='o';
elseif vd==267
    letter='o';
elseif vd==268
    letter='o';
elseif vd==269
    letter='o';
elseif vd==270
    letter='o';
elseif vd==271
    letter='o';
elseif vd==272
    letter='o';
elseif vd==273
    letter='o';
elseif vd==274
    letter='o';
elseif vd==275
    letter='o';
elseif vd==276
    letter='o';
elseif vd==277
    letter='o';
elseif vd==278
    letter='o';
elseif vd==279
    letter='o';
elseif vd==280
    letter='o';
elseif vd==281
    letter='o';
elseif vd==282
    letter='o';
elseif vd==283
    letter='o';
elseif vd==284
    letter='o';
elseif vd==285
    letter='o';
elseif vd==286
    letter='p';
elseif vd == 287
    letter ='p';
elseif vd == 288
    letter = 'p';
elseif vd==289
    letter='p';
elseif vd==290
    letter='p';
elseif vd==291
    letter='p';
elseif vd==292
    letter='p';
elseif vd==293
    letter='p';
elseif vd==294
    letter='p';
elseif vd==295
    letter='p';
elseif vd==296
    letter='p';
elseif vd==297
    letter='p';
elseif vd==298
    letter='p';
elseif vd==299
    letter='p';
elseif vd==300
    letter='p';
elseif vd==301
    letter='p';
elseif vd==302
    letter='p';
elseif vd==303
    letter='p';
elseif vd==304
    letter='p';
elseif vd==305
    letter='p';
elseif vd==306
    letter='p';
elseif vd==307
    letter='p';
elseif vd==308
    letter='p';
elseif vd==309
    letter='p';
elseif vd==310
    letter='p';
elseif vd==311
    letter='p';
elseif vd==312
    letter='p';
elseif vd == 313
    letter ='q';
elseif vd == 314
    letter = 'q';
elseif vd==315
    letter='q';
elseif vd==316
    letter='r';
elseif vd==317
    letter='r';
elseif vd==318
    letter='r';
elseif vd==319
    letter='r';
elseif vd==320
    letter='r';
elseif vd==321
    letter='r';
elseif vd==322
    letter='r';
elseif vd==323
    letter='r';
elseif vd==324
    letter='r';
elseif vd==325
    letter='r';
elseif vd==326
    letter='r';
elseif vd==327
    letter='r';
elseif vd==328
    letter='r';
elseif vd==329
    letter='r';
elseif vd==330
    letter='r';
elseif vd==331
    letter='r';
elseif vd==332
    letter='r';
elseif vd==333
    letter='r';
elseif vd==334
    letter='r';
elseif vd==335
    letter='r';
elseif vd==336
    letter='r';
elseif vd==337
    letter='r';
elseif vd==338
    letter='r';
elseif vd == 339
    letter ='r';
elseif vd == 340
    letter = 'r';
elseif vd==341
    letter='r';
elseif vd==342
    letter='r';
elseif vd==343
    letter='r';
elseif vd==344
    letter='r';
elseif vd==345
    letter='r';
elseif vd==346
    letter='r';
elseif vd==347
    letter='r';
elseif vd==348
    letter='r';
elseif vd==349
    letter='r';
elseif vd==350
    letter='r';
elseif vd==351
    letter='r';
elseif vd==352
    letter='r';
elseif vd==353
    letter='r';
elseif vd==354
    letter='r';
elseif vd==355
    letter='r';
elseif vd==356
    letter='r';
elseif vd==357
    letter='r';
elseif vd==358
    letter='r';
elseif vd==359
    letter='r';
elseif vd==360
    letter='r';
elseif vd==361
    letter='r';
elseif vd==362
    letter='r';
elseif vd==363
    letter='r';
elseif vd==364
    letter='r';
elseif vd == 365
    letter ='s';
elseif vd == 366
    letter = 's';
elseif vd==367
    letter='s';
elseif vd==368
    letter='s';
elseif vd==369
    letter='s';
elseif vd==370
    letter='s';
elseif vd==371
    letter='s';
elseif vd==372
    letter='s';
elseif vd==373
    letter='s';
elseif vd==374
    letter='s';
elseif vd==375
    letter='s';
elseif vd==376
    letter='s';
elseif vd==377
    letter='s';
elseif vd==378
    letter='s';
elseif vd==379
    letter='s';
elseif vd==380
    letter='s';
elseif vd==381
    letter='s';
elseif vd==382
    letter='s';
elseif vd==383
    letter='s';
elseif vd==384
    letter='s';
elseif vd==385
    letter='t';
elseif vd==386
    letter='t';
elseif vd==387
    letter='t';
elseif vd==388
    letter='t';
elseif vd==389
    letter='t';
elseif vd==390
    letter='t';
elseif vd == 391
    letter ='t';
elseif vd == 392
    letter = 't';
elseif vd==392
    letter='t';
elseif vd==393
    letter='t';
elseif vd==394
    letter='t';
elseif vd==395
    letter='t';
elseif vd==396
    letter='t';
elseif vd==397
    letter='t';
elseif vd==398
    letter='t';
elseif vd==399
    letter='t';
elseif vd==400
    letter='t';
elseif vd==401
    letter='t';
elseif vd==402
    letter='t';
elseif vd==403
    letter='T';
elseif vd==404
    letter='T';
elseif vd==405
    letter='u';
elseif vd==406
    letter='u';
elseif vd==407
    letter='U';
elseif vd==408
    letter='U';
elseif vd==409
    letter='U';
elseif vd==410
    letter='U';
elseif vd==411
    letter='v';
elseif vd==412
    letter='v';
elseif vd==413
    letter='v';
elseif vd==414
    letter='w';
elseif vd==415
    letter='w';
elseif vd == 416
    letter ='w';
elseif vd == 417
    letter = 'w';
elseif vd==418
    letter='w';
elseif vd==419
    letter='w';
elseif vd==420
    letter='x';
elseif vd==421
    letter='x';
elseif vd==422
    letter='x';
elseif vd==423
    letter='y';
elseif vd==424
    letter='y';
elseif vd==425
    letter='y';
elseif vd==426
    letter='y';
elseif vd==427
    letter='y';
elseif vd==428
    letter='y';
elseif vd==429
    letter='y';
elseif vd==430
    letter='y';
elseif vd==431
    letter='y';
elseif vd==432
    letter='y';
elseif vd==433
    letter='y';
elseif vd==434
    letter='y';
elseif vd==435
    letter='y';
elseif vd==436
    letter='y';
elseif vd==437
    letter='y';
elseif vd==438
    letter='y';
elseif vd==439
    letter='y';
elseif vd==440
    letter='y';
elseif vd==441
    letter='y';
elseif vd == 442
    letter ='y';
elseif vd == 443
    letter = 'y';
elseif vd==444
    letter='y';
elseif vd==445
    letter='y';
elseif vd==446
    letter='y';
elseif vd==447
    letter='y';
elseif vd==448
    letter='y';
elseif vd==449
    letter='y';
elseif vd==450
    letter='y';
elseif vd==451
    letter='y';
elseif vd==452
    letter='y';
elseif vd==453
    letter='y';
elseif vd==454
    letter='z';
elseif vd==455
    letter='z';
 elseif vd==456
     letter='z';
else
    letter='*'; % undetected
end
%}