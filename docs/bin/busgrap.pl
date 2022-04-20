#!/usr/bin/perl -w
#
#	busgraph.pl		: Produce Business Graphs in troff format
#	Deri James		: 5th February 2015
#

# Copyright (C) 2015 Free Software Foundation, Inc.
#      Written by Deri James <deri@chuzzlewit.demon.co.uk>
#
# This file is part of groff.
#
# groff is free software; you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free
# Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# groff is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

use strict;


my @CMDS=(
    ['FRAME','c','pi/graph',"6c\t5c"],
    ['ORIGIN','c','pi/graph',''],
    ['DARKER','','pi/graph',.8],
    ['BORDER','p','pi/graph',0],
    ['BRDCOLOUR','#','pi/graph','black'],
    ['JUST','','pi/graph','left'],
    ['FT','p','pi/graph','HR'],
    ['PS','p','pi/graph','10'],
    ['VS','p','pi/graph','+10%'],
    ['TEXTCOLOUR','#','pi/graph','black'],
    ['BGCOLOUR','#','pi/graph',''],
    ['WALLCOLOUR','#','graph',''],
    ['LINECOLOUR','#','pi/graph','black'],
    ['THICKNESS','p','pi/graph','.2'],
    ['TYPE','','pi','pi'],
    ['3D','c','pi','0'],
    ['COLOURED','bool','pi/graph','no'],
    ['XRAD','c','pi','2c'],
    ['YRAD','c','pi','2c'],
    ['HOLE','','pi','0'],
    ['OTHERS','','pi',2.05],
    ['VDECIMALS','','pi',0],
    ['PDECIMALS','','pi',1],
    ['PDECIMALS','','graph',''],
    ['LABEL','','pi','$text ($percent%)'],
    ['KEYBOX','bool','pi/graph','no'],
    ['BOXFRAME','c','pi/graph',''],		# xoffs, yoffs, width, depth
    ['BOXHEADS','','pi',"Name\tValue\t%"],
    ['BOXHEADS','','graph',''],
    ['BOXLABELS','','pi/graph',"\$text\t\$value\t\$percent"],
    ['BOXTABS','','pi/graph',"0cL 2.8cR 4cR"],
    ['FLOW','bool','pi/graph','no'],
    ['CAPTION','','pi/graph',''],
    ['SCOLOURS','#','pi/graph',"#bfad94\t#2a586f\t#dbd6ce\t#568da3\t#a17759\t#c1d4de\t#74c9aa\t#dee1b6\t#e1b866\t#bf5434\t#373c42\tgrey80"],
    # SCOLOURS:#bfad94	#2a586f	#dbd6ce	#568da3	#a17759	#c1d4de	#74c9aa	#dee1b6	#e1b866	#bf5434	#373c42	grey80
    #    ['SCOLOURS','#','pi/graph',"cyan\tmagenta\tyellow\tpaleturquoise1\tgrey6\tgreen\tpeachpuff\tcornflowerblue\tpink2\tdarkgoldenrod\tdarkolivegreen1\tdarkturquoise"],
    ['NEGCOLOUR','#','graph',''],
    ['POSCOLOUR','#','graph',''],
    ['HGRID','bool','graph','no'],
    ['VGRID','bool','graph','no'],
    ['SERIES','undef','pi/graph',''],
    ['SYMSIZE','p','graph',2],
    ['FLOOR','undef','graph',''],
    ['HORIZONTAL','bool','graph','no'],
    ['SYNC','bool','graph','no'],
    ['SORT','bool','pi','n'],
    ['SHADOW','bool','pi','no'],
    ['SFILE','','pi/graph',''],
    ['STEPS','undef','graph',''],
    ['PDFBOOKMARK','','pi/graph',0],
);

my %colours=(
    'black' => 'rgb #000000',
    'grey' => 'rgb #bebebe',
    'dimgrey' => 'rgb #696969',
    'lightgray' => 'rgb #d3d3d3',
    'lightslategrey' => 'rgb #778899',
    'slategray' => 'rgb #708090',
    'slategray1' => 'rgb #c6e2ff',
    'slategray2' => 'rgb #b9d3ee',
    'slategray3' => 'rgb #9fb6cd',
    'slategray4' => 'rgb #6c7b8b',
    'slategrey' => 'rgb #708090',
    'grey0' => 'rgb #000000',
    'grey1' => 'rgb #030303',
    'grey2' => 'rgb #050505',
    'grey3' => 'rgb #080808',
    'grey4' => 'rgb #0a0a0a',
    'grey5' => 'rgb #0d0d0d',
    'grey6' => 'rgb #0f0f0f',
    'grey7' => 'rgb #121212',
    'grey8' => 'rgb #141414',
    'grey9' => 'rgb #171717',
    'grey10' => 'rgb #1a1a1a',
    'grey11' => 'rgb #1c1c1c',
    'grey12' => 'rgb #1f1f1f',
    'grey13' => 'rgb #212121',
    'grey14' => 'rgb #242424',
    'grey15' => 'rgb #262626',
    'grey16' => 'rgb #292929',
    'grey17' => 'rgb #2b2b2b',
    'grey18' => 'rgb #2e2e2e',
    'grey19' => 'rgb #303030',
    'grey20' => 'rgb #333333',
    'grey21' => 'rgb #363636',
    'grey22' => 'rgb #383838',
    'grey23' => 'rgb #3b3b3b',
    'grey24' => 'rgb #3d3d3d',
    'grey25' => 'rgb #404040',
    'grey26' => 'rgb #424242',
    'grey27' => 'rgb #454545',
    'grey28' => 'rgb #474747',
    'grey29' => 'rgb #4a4a4a',
    'grey30' => 'rgb #4d4d4d',
    'grey31' => 'rgb #4f4f4f',
    'grey32' => 'rgb #525252',
    'grey33' => 'rgb #545454',
    'grey34' => 'rgb #575757',
    'grey35' => 'rgb #595959',
    'grey36' => 'rgb #5c5c5c',
    'grey37' => 'rgb #5e5e5e',
    'grey38' => 'rgb #616161',
    'grey39' => 'rgb #636363',
    'grey40' => 'rgb #666666',
    'grey41' => 'rgb #696969',
    'grey42' => 'rgb #6b6b6b',
    'grey43' => 'rgb #6e6e6e',
    'grey44' => 'rgb #707070',
    'grey45' => 'rgb #737373',
    'grey46' => 'rgb #757575',
    'grey47' => 'rgb #787878',
    'grey48' => 'rgb #7a7a7a',
    'grey49' => 'rgb #7d7d7d',
    'grey50' => 'rgb #7f7f7f',
    'grey51' => 'rgb #828282',
    'grey52' => 'rgb #858585',
    'grey53' => 'rgb #878787',
    'grey54' => 'rgb #8a8a8a',
    'grey55' => 'rgb #8c8c8c',
    'grey56' => 'rgb #8f8f8f',
    'grey57' => 'rgb #919191',
    'grey58' => 'rgb #949494',
    'grey59' => 'rgb #969696',
    'grey60' => 'rgb #999999',
    'grey61' => 'rgb #9c9c9c',
    'grey62' => 'rgb #9e9e9e',
    'grey63' => 'rgb #a1a1a1',
    'grey64' => 'rgb #a3a3a3',
    'grey65' => 'rgb #a6a6a6',
    'grey66' => 'rgb #a8a8a8',
    'grey67' => 'rgb #ababab',
    'grey68' => 'rgb #adadad',
    'grey69' => 'rgb #b0b0b0',
    'grey70' => 'rgb #b3b3b3',
    'grey71' => 'rgb #b5b5b5',
    'grey72' => 'rgb #b8b8b8',
    'grey73' => 'rgb #bababa',
    'grey74' => 'rgb #bdbdbd',
    'grey75' => 'rgb #bfbfbf',
    'grey76' => 'rgb #c2c2c2',
    'grey77' => 'rgb #c4c4c4',
    'grey78' => 'rgb #c7c7c7',
    'grey79' => 'rgb #c9c9c9',
    'grey80' => 'rgb #cccccc',
    'grey81' => 'rgb #cfcfcf',
    'grey82' => 'rgb #d1d1d1',
    'grey83' => 'rgb #d4d4d4',
    'grey84' => 'rgb #d6d6d6',
    'grey85' => 'rgb #d9d9d9',
    'grey86' => 'rgb #dbdbdb',
    'grey87' => 'rgb #dedede',
    'grey88' => 'rgb #e0e0e0',
    'grey89' => 'rgb #e3e3e3',
    'grey90' => 'rgb #e5e5e5',
    'grey91' => 'rgb #e8e8e8',
    'grey92' => 'rgb #ebebeb',
    'grey93' => 'rgb #ededed',
    'grey94' => 'rgb #f0f0f0',
    'grey95' => 'rgb #f2f2f2',
    'grey96' => 'rgb #f5f5f5',
    'grey97' => 'rgb #f7f7f7',
    'grey98' => 'rgb #fafafa',
    'grey99' => 'rgb #fcfcfc',
    'grey100' => 'rgb #ffffff',
    'aliceblue' => 'rgb #f0f8ff',
    'blueviolet' => 'rgb #8a2be2',
    'cadetblue' => 'rgb #5f9ea0',
    'cadetblue1' => 'rgb #98f5ff',
    'cadetblue2' => 'rgb #8ee5ee',
    'cadetblue3' => 'rgb #7ac5cd',
    'cadetblue4' => 'rgb #53868b',
    'cornflowerblue' => 'rgb #6495ed',
    'darkslateblue' => 'rgb #483d8b',
    'darkturquoise' => 'rgb #00ced1',
    'deepskyblue' => 'rgb #00bfff',
    'deepskyblue1' => 'rgb #00bfff',
    'deepskyblue2' => 'rgb #00b2ee',
    'deepskyblue3' => 'rgb #009acd',
    'deepskyblue4' => 'rgb #00688b',
    'dodgerblue' => 'rgb #1e90ff',
    'dodgerblue1' => 'rgb #1e90ff',
    'dodgerblue2' => 'rgb #1c86ee',
    'dodgerblue3' => 'rgb #1874cd',
    'dodgerblue4' => 'rgb #104e8b',
    'lightblue' => 'rgb #add8e6',
    'lightblue1' => 'rgb #bfefff',
    'lightblue2' => 'rgb #b2dfee',
    'lightblue3' => 'rgb #9ac0cd',
    'lightblue4' => 'rgb #68838b',
    'lightcyan' => 'rgb #e0ffff',
    'lightcyan1' => 'rgb #e0ffff',
    'lightcyan2' => 'rgb #d1eeee',
    'lightcyan3' => 'rgb #b4cdcd',
    'lightcyan4' => 'rgb #7a8b8b',
    'lightskyblue' => 'rgb #87cefa',
    'lightskyblue1' => 'rgb #b0e2ff',
    'lightskyblue2' => 'rgb #a4d3ee',
    'lightskyblue3' => 'rgb #8db6cd',
    'lightskyblue4' => 'rgb #607b8b',
    'lightslateblue' => 'rgb #8470ff',
    'lightsteelblue' => 'rgb #b0c4de',
    'lightsteelblue1' => 'rgb #cae1ff',
    'lightsteelblue2' => 'rgb #bcd2ee',
    'lightsteelblue3' => 'rgb #a2b5cd',
    'lightsteelblue4' => 'rgb #6e7b8b',
    'mediumaquamarine' => 'rgb #66cdaa',
    'mediumblue' => 'rgb #0000cd',
    'mediumslateblue' => 'rgb #7b68ee',
    'mediumturquoise' => 'rgb #48d1cc',
    'midnightblue' => 'rgb #191970',
    'navyblue' => 'rgb #000080',
    'paleturquoise' => 'rgb #afeeee',
    'paleturquoise1' => 'rgb #bbffff',
    'paleturquoise2' => 'rgb #aeeeee',
    'paleturquoise3' => 'rgb #96cdcd',
    'paleturquoise4' => 'rgb #668b8b',
    'powderblue' => 'rgb #b0e0e6',
    'royalblue' => 'rgb #4169e1',
    'royalblue1' => 'rgb #4876ff',
    'royalblue2' => 'rgb #436eee',
    'royalblue3' => 'rgb #3a5fcd',
    'royalblue4' => 'rgb #27408b',
    'skyblue' => 'rgb #87ceeb',
    'skyblue1' => 'rgb #87ceff',
    'skyblue2' => 'rgb #7ec0ee',
    'skyblue3' => 'rgb #6ca6cd',
    'skyblue4' => 'rgb #4a708b',
    'slateblue' => 'rgb #6a5acd',
    'slateblue1' => 'rgb #836fff',
    'slateblue2' => 'rgb #7a67ee',
    'slateblue3' => 'rgb #6959cd',
    'slateblue4' => 'rgb #473c8b',
    'steelblue' => 'rgb #4682b4',
    'steelblue1' => 'rgb #63b8ff',
    'steelblue2' => 'rgb #5cacee',
    'steelblue3' => 'rgb #4f94cd',
    'steelblue4' => 'rgb #36648b',
    'aquamarine' => 'rgb #7fffd4',
    'aquamarine1' => 'rgb #7fffd4',
    'aquamarine2' => 'rgb #76eec6',
    'aquamarine3' => 'rgb #66cdaa',
    'aquamarine4' => 'rgb #458b74',
    'azure' => 'rgb #f0ffff',
    'azure1' => 'rgb #f0ffff',
    'azure2' => 'rgb #e0eeee',
    'azure3' => 'rgb #c1cdcd',
    'azure4' => 'rgb #838b8b',
    'blue' => 'rgb #0000ff',
    'blue1' => 'rgb #0000ff',
    'blue2' => 'rgb #0000ee',
    'blue3' => 'rgb #0000cd',
    'blue4' => 'rgb #00008b',
    'cyan' => 'rgb #00ffff',
    'cyan1' => 'rgb #00ffff',
    'cyan2' => 'rgb #00eeee',
    'cyan3' => 'rgb #00cdcd',
    'cyan4' => 'rgb #008b8b',
    'navy' => 'rgb #000080',
    'turquoise' => 'rgb #40e0d0',
    'turquoise1' => 'rgb #00f5ff',
    'turquoise2' => 'rgb #00e5ee',
    'turquoise3' => 'rgb #00c5cd',
    'turquoise4' => 'rgb #00868b',
    'darkslategray' => 'rgb #2f4f4f',
    'darkslategray1' => 'rgb #97ffff',
    'darkslategray2' => 'rgb #8deeee',
    'darkslategray3' => 'rgb #79cdcd',
    'darkslategray4' => 'rgb #528b8b',
    'rosybrown' => 'rgb #bc8f8f',
    'rosybrown1' => 'rgb #ffc1c1',
    'rosybrown2' => 'rgb #eeb4b4',
    'rosybrown3' => 'rgb #cd9b9b',
    'rosybrown4' => 'rgb #8b6969',
    'saddlebrown' => 'rgb #8b4513',
    'sandybrown' => 'rgb #f4a460',
    'beige' => 'rgb #f5f5dc',
    'brown' => 'rgb #a52a2a',
    'brown1' => 'rgb #ff4040',
    'brown2' => 'rgb #ee3b3b',
    'brown3' => 'rgb #cd3333',
    'brown4' => 'rgb #8b2323',
    'burlywood' => 'rgb #deb887',
    'burlywood1' => 'rgb #ffd39b',
    'burlywood2' => 'rgb #eec591',
    'burlywood3' => 'rgb #cdaa7d',
    'burlywood4' => 'rgb #8b7355',
    'chocolate' => 'rgb #d2691e',
    'chocolate1' => 'rgb #ff7f24',
    'chocolate2' => 'rgb #ee7621',
    'chocolate3' => 'rgb #cd661d',
    'chocolate4' => 'rgb #8b4513',
    'peru' => 'rgb #cd853f',
    'tan' => 'rgb #d2b48c',
    'tan1' => 'rgb #ffa54f',
    'tan2' => 'rgb #ee9a49',
    'tan3' => 'rgb #cd853f',
    'tan4' => 'rgb #8b5a2b',
    'darkgreen' => 'rgb #006400',
    'darkkhaki' => 'rgb #bdb76b',
    'darkolivegreen' => 'rgb #556b2f',
    'darkolivegreen1' => 'rgb #caff70',
    'darkolivegreen2' => 'rgb #bcee68',
    'darkolivegreen3' => 'rgb #a2cd5a',
    'darkolivegreen4' => 'rgb #6e8b3d',
    'darkseagreen' => 'rgb #8fbc8f',
    'darkseagreen1' => 'rgb #c1ffc1',
    'darkseagreen2' => 'rgb #b4eeb4',
    'darkseagreen3' => 'rgb #9bcd9b',
    'darkseagreen4' => 'rgb #698b69',
    'forestgreen' => 'rgb #228b22',
    'greenyellow' => 'rgb #adff2f',
    'lawngreen' => 'rgb #7cfc00',
    'lightseagreen' => 'rgb #20b2aa',
    'limegreen' => 'rgb #32cd32',
    'mediumseagreen' => 'rgb #3cb371',
    'mediumspringgreen' => 'rgb #00fa9a',
    'mintcream' => 'rgb #f5fffa',
    'olivedrab' => 'rgb #6b8e23',
    'olivedrab1' => 'rgb #c0ff3e',
    'olivedrab2' => 'rgb #b3ee3a',
    'olivedrab3' => 'rgb #9acd32',
    'olivedrab4' => 'rgb #698b22',
    'palegreen' => 'rgb #98fb98',
    'palegreen1' => 'rgb #9aff9a',
    'palegreen2' => 'rgb #90ee90',
    'palegreen3' => 'rgb #7ccd7c',
    'palegreen4' => 'rgb #548b54',
    'seagreen' => 'rgb #2e8b57',
    'seagreen1' => 'rgb #54ff9f',
    'seagreen2' => 'rgb #4eee94',
    'seagreen3' => 'rgb #43cd80',
    'seagreen4' => 'rgb #2e8b57',
    'springgreen' => 'rgb #00ff7f',
    'springgreen1' => 'rgb #00ff7f',
    'springgreen2' => 'rgb #00ee76',
    'springgreen3' => 'rgb #00cd66',
    'springgreen4' => 'rgb #008b45',
    'yellowgreen' => 'rgb #9acd32',
    'chartreuse' => 'rgb #7fff00',
    'chartreuse1' => 'rgb #7fff00',
    'chartreuse2' => 'rgb #76ee00',
    'chartreuse3' => 'rgb #66cd00',
    'chartreuse4' => 'rgb #458b00',
    'green' => 'rgb #00ff00',
    'green1' => 'rgb #00ff00',
    'green2' => 'rgb #00ee00',
    'green3' => 'rgb #00cd00',
    'green4' => 'rgb #008b00',
    'khaki' => 'rgb #f0e68c',
    'khaki1' => 'rgb #fff68f',
    'khaki2' => 'rgb #eee685',
    'khaki3' => 'rgb #cdc673',
    'khaki4' => 'rgb #8b864e',
    'darkorange' => 'rgb #ff8c00',
    'darkorange1' => 'rgb #ff7f00',
    'darkorange2' => 'rgb #ee7600',
    'darkorange3' => 'rgb #cd6600',
    'darkorange4' => 'rgb #8b4500',
    'darksalmon' => 'rgb #e9967a',
    'lightcoral' => 'rgb #f08080',
    'lightsalmon' => 'rgb #ffa07a',
    'lightsalmon1' => 'rgb #ffa07a',
    'lightsalmon2' => 'rgb #ee9572',
    'lightsalmon3' => 'rgb #cd8162',
    'lightsalmon4' => 'rgb #8b5742',
    'peachpuff' => 'rgb #ffdab9',
    'peachpuff1' => 'rgb #ffdab9',
    'peachpuff2' => 'rgb #eecbad',
    'peachpuff3' => 'rgb #cdaf95',
    'peachpuff4' => 'rgb #8b7765',
    'bisque' => 'rgb #ffe4c4',
    'bisque1' => 'rgb #ffe4c4',
    'bisque2' => 'rgb #eed5b7',
    'bisque3' => 'rgb #cdb79e',
    'bisque4' => 'rgb #8b7d6b',
    'coral' => 'rgb #ff7f50',
    'coral1' => 'rgb #ff7256',
    'coral2' => 'rgb #ee6a50',
    'coral3' => 'rgb #cd5b45',
    'coral4' => 'rgb #8b3e2f',
    'honeydew' => 'rgb #f0fff0',
    'honeydew1' => 'rgb #f0fff0',
    'honeydew2' => 'rgb #e0eee0',
    'honeydew3' => 'rgb #c1cdc1',
    'honeydew4' => 'rgb #838b83',
    'orange' => 'rgb #ffa500',
    'orange1' => 'rgb #ffa500',
    'orange2' => 'rgb #ee9a00',
    'orange3' => 'rgb #cd8500',
    'orange4' => 'rgb #8b5a00',
    'salmon' => 'rgb #fa8072',
    'salmon1' => 'rgb #ff8c69',
    'salmon2' => 'rgb #ee8262',
    'salmon3' => 'rgb #cd7054',
    'salmon4' => 'rgb #8b4c39',
    'sienna' => 'rgb #a0522d',
    'sienna1' => 'rgb #ff8247',
    'sienna2' => 'rgb #ee7942',
    'sienna3' => 'rgb #cd6839',
    'sienna4' => 'rgb #8b4726',
    'deeppink' => 'rgb #ff1493',
    'deeppink1' => 'rgb #ff1493',
    'deeppink2' => 'rgb #ee1289',
    'deeppink3' => 'rgb #cd1076',
    'deeppink4' => 'rgb #8b0a50',
    'hotpink' => 'rgb #ff69b4',
    'hotpink1' => 'rgb #ff6eb4',
    'hotpink2' => 'rgb #ee6aa7',
    'hotpink3' => 'rgb #cd6090',
    'hotpink4' => 'rgb #8b3a62',
    'indianred' => 'rgb #cd5c5c',
    'indianred1' => 'rgb #ff6a6a',
    'indianred2' => 'rgb #ee6363',
    'indianred3' => 'rgb #cd5555',
    'indianred4' => 'rgb #8b3a3a',
    'lightpink' => 'rgb #ffb6c1',
    'lightpink1' => 'rgb #ffaeb9',
    'lightpink2' => 'rgb #eea2ad',
    'lightpink3' => 'rgb #cd8c95',
    'lightpink4' => 'rgb #8b5f65',
    'mediumvioletred' => 'rgb #c71585',
    'mistyrose' => 'rgb #ffe4e1',
    'mistyrose1' => 'rgb #ffe4e1',
    'mistyrose2' => 'rgb #eed5d2',
    'mistyrose3' => 'rgb #cdb7b5',
    'mistyrose4' => 'rgb #8b7d7b',
    'orangered' => 'rgb #ff4500',
    'orangered1' => 'rgb #ff4500',
    'orangered2' => 'rgb #ee4000',
    'orangered3' => 'rgb #cd3700',
    'orangered4' => 'rgb #8b2500',
    'palevioletred' => 'rgb #db7093',
    'palevioletred1' => 'rgb #ff82ab',
    'palevioletred2' => 'rgb #ee799f',
    'palevioletred3' => 'rgb #cd6889',
    'palevioletred4' => 'rgb #8b475d',
    'violetred' => 'rgb #d02090',
    'violetred1' => 'rgb #ff3e96',
    'violetred2' => 'rgb #ee3a8c',
    'violetred3' => 'rgb #cd3278',
    'violetred4' => 'rgb #8b2252',
    'firebrick' => 'rgb #b22222',
    'firebrick1' => 'rgb #ff3030',
    'firebrick2' => 'rgb #ee2c2c',
    'firebrick3' => 'rgb #cd2626',
    'firebrick4' => 'rgb #8b1a1a',
    'pink' => 'rgb #ffc0cb',
    'pink1' => 'rgb #ffb5c5',
    'pink2' => 'rgb #eea9b8',
    'pink3' => 'rgb #cd919e',
    'pink4' => 'rgb #8b636c',
    'red' => 'rgb #ff0000',
    'red1' => 'rgb #ff0000',
    'red2' => 'rgb #ee0000',
    'red3' => 'rgb #cd0000',
    'red4' => 'rgb #8b0000',
    'tomato' => 'rgb #ff6347',
    'tomato1' => 'rgb #ff6347',
    'tomato2' => 'rgb #ee5c42',
    'tomato3' => 'rgb #cd4f39',
    'tomato4' => 'rgb #8b3626',
    'darkorchid' => 'rgb #9932cc',
    'darkorchid1' => 'rgb #bf3eff',
    'darkorchid2' => 'rgb #b23aee',
    'darkorchid3' => 'rgb #9a32cd',
    'darkorchid4' => 'rgb #68228b',
    'darkviolet' => 'rgb #9400d3',
    'lavenderblush' => 'rgb #fff0f5',
    'lavenderblush1' => 'rgb #fff0f5',
    'lavenderblush2' => 'rgb #eee0e5',
    'lavenderblush3' => 'rgb #cdc1c5',
    'lavenderblush4' => 'rgb #8b8386',
    'mediumorchid' => 'rgb #ba55d3',
    'mediumorchid1' => 'rgb #e066ff',
    'mediumorchid2' => 'rgb #d15fee',
    'mediumorchid3' => 'rgb #b452cd',
    'mediumorchid4' => 'rgb #7a378b',
    'mediumpurple' => 'rgb #9370db',
    'mediumpurple1' => 'rgb #ab82ff',
    'mediumpurple2' => 'rgb #9f79ee',
    'mediumpurple3' => 'rgb #8968cd',
    'mediumpurple4' => 'rgb #5d478b',
    'lavender' => 'rgb #e6e6fa',
    'magenta' => 'rgb #ff00ff',
    'magenta1' => 'rgb #ff00ff',
    'magenta2' => 'rgb #ee00ee',
    'magenta3' => 'rgb #cd00cd',
    'magenta4' => 'rgb #8b008b',
    'maroon' => 'rgb #b03060',
    'maroon1' => 'rgb #ff34b3',
    'maroon2' => 'rgb #ee30a7',
    'maroon3' => 'rgb #cd2990',
    'maroon4' => 'rgb #8b1c62',
    'orchid' => 'rgb #da70d6',
    'orchid1' => 'rgb #ff83fa',
    'orchid2' => 'rgb #ee7ae9',
    'orchid3' => 'rgb #cd69c9',
    'orchid4' => 'rgb #8b4789',
    'plum' => 'rgb #dda0dd',
    'plum1' => 'rgb #ffbbff',
    'plum2' => 'rgb #eeaeee',
    'plum3' => 'rgb #cd96cd',
    'plum4' => 'rgb #8b668b',
    'purple' => 'rgb #a020f0',
    'purple1' => 'rgb #9b30ff',
    'purple2' => 'rgb #912cee',
    'purple3' => 'rgb #7d26cd',
    'purple4' => 'rgb #551a8b',
    'thistle' => 'rgb #d8bfd8',
    'thistle1' => 'rgb #ffe1ff',
    'thistle2' => 'rgb #eed2ee',
    'thistle3' => 'rgb #cdb5cd',
    'thistle4' => 'rgb #8b7b8b',
    'violet' => 'rgb #ee82ee',
    'antiquewhite' => 'rgb #faebd7',
    'antiquewhite1' => 'rgb #ffefdb',
    'antiquewhite2' => 'rgb #eedfcc',
    'antiquewhite3' => 'rgb #cdc0b0',
    'antiquewhite4' => 'rgb #8b8378',
    'floralwhite' => 'rgb #fffaf0',
    'ghostwhite' => 'rgb #f8f8ff',
    'navajowhite' => 'rgb #ffdead',
    'navajowhite1' => 'rgb #ffdead',
    'navajowhite2' => 'rgb #eecfa1',
    'navajowhite3' => 'rgb #cdb38b',
    'navajowhite4' => 'rgb #8b795e',
    'oldlace' => 'rgb #fdf5e6',
    'whitesmoke' => 'rgb #f5f5f5',
    'gainsboro' => 'rgb #dcdcdc',
    'ivory' => 'rgb #fffff0',
    'ivory1' => 'rgb #fffff0',
    'ivory2' => 'rgb #eeeee0',
    'ivory3' => 'rgb #cdcdc1',
    'ivory4' => 'rgb #8b8b83',
    'linen' => 'rgb #faf0e6',
    'seashell' => 'rgb #fff5ee',
    'seashell1' => 'rgb #fff5ee',
    'seashell2' => 'rgb #eee5de',
    'seashell3' => 'rgb #cdc5bf',
    'seashell4' => 'rgb #8b8682',
    'snow' => 'rgb #fffafa',
    'snow1' => 'rgb #fffafa',
    'snow2' => 'rgb #eee9e9',
    'snow3' => 'rgb #cdc9c9',
    'snow4' => 'rgb #8b8989',
    'wheat' => 'rgb #f5deb3',
    'wheat1' => 'rgb #ffe7ba',
    'wheat2' => 'rgb #eed8ae',
    'wheat3' => 'rgb #cdba96',
    'wheat4' => 'rgb #8b7e66',
    'white' => 'rgb #ffffff',
    'blanchedalmond' => 'rgb #ffebcd',
    'darkgoldenrod' => 'rgb #b8860b',
    'darkgoldenrod1' => 'rgb #ffb90f',
    'darkgoldenrod2' => 'rgb #eead0e',
    'darkgoldenrod3' => 'rgb #cd950c',
    'darkgoldenrod4' => 'rgb #8b6508',
    'lemonchiffon' => 'rgb #fffacd',
    'lemonchiffon1' => 'rgb #fffacd',
    'lemonchiffon2' => 'rgb #eee9bf',
    'lemonchiffon3' => 'rgb #cdc9a5',
    'lemonchiffon4' => 'rgb #8b8970',
    'lightgoldenrod' => 'rgb #eedd82',
    'lightgoldenrod1' => 'rgb #ffec8b',
    'lightgoldenrod2' => 'rgb #eedc82',
    'lightgoldenrod3' => 'rgb #cdbe70',
    'lightgoldenrod4' => 'rgb #8b814c',
    'lightgoldenrodyellow' => 'rgb #fafad2',
    'lightyellow' => 'rgb #ffffe0',
    'lightyellow1' => 'rgb #ffffe0',
    'lightyellow2' => 'rgb #eeeed1',
    'lightyellow3' => 'rgb #cdcdb4',
    'lightyellow4' => 'rgb #8b8b7a',
    'palegoldenrod' => 'rgb #eee8aa',
    'papayawhip' => 'rgb #ffefd5',
    'cornsilk' => 'rgb #fff8dc',
    'cornsilk1' => 'rgb #fff8dc',
    'cornsilk2' => 'rgb #eee8cd',
    'cornsilk3' => 'rgb #cdc8b1',
    'cornsilk4' => 'rgb #8b8878',
    'gold' => 'rgb #ffd700',
    'gold1' => 'rgb #ffd700',
    'gold2' => 'rgb #eec900',
    'gold3' => 'rgb #cdad00',
    'gold4' => 'rgb #8b7500',
    'goldenrod' => 'rgb #daa520',
    'goldenrod1' => 'rgb #ffc125',
    'goldenrod2' => 'rgb #eeb422',
    'goldenrod3' => 'rgb #cd9b1d',
    'goldenrod4' => 'rgb #8b6914',
    'moccasin' => 'rgb #ffe4b5',
    'yellow' => 'rgb #ffff00',
    'yellow1' => 'rgb #ffff00',
    'yellow2' => 'rgb #eeee00',
    'yellow3' => 'rgb #cdcd00',
    'yellow4' => 'rgb #8b8b00',
);

my ($ln,%grph,@data,$colno,%sz,$buf,%defcol);
my $InBG=0;

my $piestart;
my $pi=3.1459*2;
my ($fh,$fn);

my @qname=('Jan-Mar','Apr-Jun','Jul-Sep','Oct-Dec');
my @hname=('Jan-Jun','Jul-Dec');
my @mname=('Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec');
my ($stats,$ymarg,$xmarg,%stats);
$stats=\%stats;

while (<>)
{
    chomp;
    s/\r$//;
    
    if (m'^\.\s*BGS\s*(\w*)')
    {
	my $type=($1)?$1:'pi';
	if ($type ne 'FRAME')
	{
	    $InBG=1;
	    %grph=();
	    @data=();
	    %stats=();
	    $grph{TYPE}->[0]=lc($type);
	    $buf="";
	    next;
	}
    }
    
    if ($InBG and $_ eq '.BGE')
    {
	$InBG=0;
	$buf.=".fl\n";
	BuildGraph();
	next;
    }
    
    if (!$InBG)
    {
	print "$_\n";
	next;
    }
    
    s/^\s+//;
    next if substr($_,0,1) eq '#';
    $ln++;
    
    if (m/^(.+?):(.*)/)
    {
	my $cmd=uc($1);
	my (@args)=split("\t",$2);
	
	my $cptr;
	my $dup=0;
	
	foreach my $c (@CMDS)
	{
	    if ($cmd eq substr($c->[0],0,length($cmd)) and index("/$c->[2]/","/$grph{TYPE}->[0]/") >= 0)
	    {
		$cptr=$c,$c->[4]=$ln if $dup == 0;
		$dup++;
	    }
	}
	
	Log(1,"Command '$cmd' not understood") if $dup == 0;
	Log(0,"Command '$cmd' is ambiguous - '$cptr->[0]' used") if $cmd ne 'SERIES' and $dup > 1;
	
	$cmd=$cptr->[0];
	
	if ($cmd eq 'SERIES')
	{
	    LoadSeries(\@args);
	}
	elsif ($cmd eq 'SFILE')
	{
	    if (open(F,"<$args[0]"))
	    {
		while (<F>)
		{
		    chomp;
		    s/\r$//;
		    s/^\s+//;
		    s/^S.*?://;
		    
		    my (@r)=split("\t");
		    LoadSeries(\@r);
		}
		
		close(F);
	    }
	    else
	    {
		Log(1,"Failed to open Series File '$args[0]'");
	    }
	}
	else
	{
	    Log(0,$ln,"Redefined command '$cmd'") if exists($grph{$cmd});
	    $grph{$cmd}=\@args;
	}
    }
}

exit 0;

sub LoadSeries
{
    my $args=shift;
    
    if ($grph{TYPE}->[0] eq 'pi')
    {
	my ($nm,$val)=(@{$args});
	
	my $valn=$val;
	$valn=~s'\\.(\(..|\[.*\])''g;
	$valn=~s/[^-0-9.]//g;
	$valn=0 if $valn eq '';
	$grph{NEGPIE}=1 if $valn < 0;
	push(@data,[$valn,$nm,undef,$val]);
    }
    else
    {
	my ($sno,$txt,@data);
	($sno,$txt,@data)=(@{$args});
	$sno=1,$grph{BACKGROUND}=1 if uc($sno) eq 'B';
	$sno-- if $sno=~m/^\d+$/ and $sno > 0;
	foreach my $d (@data) {$d=~s/\((.+)\)/-$1/}
	LoadData($sno,$txt,\@data);
    }
}

sub BuildGraph
{
    # All Commands now read, assign defaults for any missing
    
    my $type='pi';
    $type=lc($grph{TYPE}->[0]) if exists($grph{TYPE});
    
    foreach my $c (@CMDS)
    {
	# 	Log(0,"Cmd=$c->[0]");
	if (index($c->[2],$type) >= 0)
	{
	    my $cmd=$c->[0];
	    
	    if (!exists($grph{$cmd}) and $c->[1] ne 'undef')
	    {
		my (@args)=split("\t",$c->[3]);
		$args[0]='' if $#args==-1;
		$grph{$cmd}=\@args;
	    }
	    
	    # Add default scaling factors
	    
	    my $scale=$c->[1];
	    
	    if ($scale ne '' and exists($grph{$cmd}))
	    {
		my $ct=-1;
		
		foreach my $v (@{$grph{$cmd}})
		{
		    if ($scale eq '#' and $v ne '')
		    {
			# colours
			
			$v=lc($v);
			
			if (substr($v,0,1) eq '#')
			{
			    $v=defcol("rgb $v");
			}
			elsif ($v=~m/(rgb|cmyk|cmy|gray|grey)\s+(.*)/)
			{
			    $v=defcol("$1 $2");
			}
			elsif (exists($colours{$v}))
			{
			    $v=defcol($colours{$v});
			}
			else
			{
			    Log(0,"Colour names ($v) not found");
			}
			
			if ($cmd eq 'SCOLOURS')
			{
			    $grph{CONTRAST}->[++$ct]=contrast($v);
			}
		    }
		    elsif ($scale eq 'bool')
		    {
			$v=lc($v);
			
			if (substr($v,0,1) eq 'y')
			{
			    $v=1;
			}
			elsif (substr($v,0,1) eq 'n')
			{
			    $v=0;
			}
		    }
		    else
		    {
			if ($v=~m/^\s*([-0-9.+]+)\s*$/)
			{
			    $v="$1$scale" if $scale ne 'undef';
			}
		    }
		}
	    }
	    
	    # Now convert all values to points
	    
	    if (exists($grph{$cmd}))
	    {
		foreach my $v (@{$grph{$cmd}})
		{
		    if ($scale ne '#' and $scale ne '' and $scale ne 'undef')
		    {
			if ($v=~m/([\d.]+)([cimp])/i)
			{
			    my $num=$1;
			    my $mul=$2;
			    
			    $v=ToPoints($num,$mul,$c->[4]);
			}
		    }
		}
	    }
	}
    }
    
    # If no ORIGIN or relative - centre it
    
    if ($grph{TYPE}->[0] eq 'pi')
    {
	foreach my $i (0..1)
	{
	    $grph{ORIGIN}->[$i]=0 if !$grph{ORIGIN}->[$i];
	    
	    if ($grph{ORIGIN}->[$i]=~m/^[+-]/ or $grph{ORIGIN}->[$i] == 0)
	    {
		$grph{ORIGIN}->[$i]+=int($grph{FRAME}->[$i]/2);
	    }
	}
    }
    
    # VS may be a percentage of PS
    
    if ($grph{VS}->[0]=~m/(\+|\-)?(\d+)%/)
    {
	my $p=$grph{PS}->[0];
	my $d=$p*$2/100;
	$d*=-1 if $1 and $1 eq '-';
	$grph{VS}->[0]=$p+$d;
    }
    
    # Drop Shadow?
    
    $grph{SHADE}=[];
    
    if ($grph{SHADOW}->[0])
    {
	my $bg=$grph{BGCOLOUR}->[0] || 'rgb_#ffffff';
	
	my ($coltype,$arg)=split('_',$bg,2);
	my (@c)=GetComponents($arg);
	my @add;
	my $start;
	
	if ($coltype eq 'cmyk')
	{
	    $start=0xffff;
	}
	elsif ($coltype eq 'cmy')
	{
	    $start=0xffff;
	}
	elsif ($coltype eq 'grey')
	{
	    $start=0;
	}
	elsif ($coltype eq 'rgb')
	{
	    $start=0;
	}
	
	foreach my $c (@c)
	{
	    push(@add,($c-$start)/10);
	}
	
	foreach my $j (1..10)
	{
	    foreach my $i (0..$#c) 
	    {
		$c[$i]-=$add[$i];
		$c[$i]=0xffff if $c[$i] > 0xffff;
		$c[$i]=0 if $c[$i] < 0;
	    }
	    
	    push(@{$grph{SHADE}},defcol("$coltype #".join('',map(sprintf("%02x",$_>>8),@c))));
	}
    }
    
    # Graph floor
    
    if (exists($grph{FLOOR}) and $grph{FLOOR}->[0]=~/^C/)
    {
	substr($grph{FLOOR}->[0],0,1)='';
	$grph{FLOORFLAG}->[0]='C';
    }
    else
    {
	$grph{FLOORFLAG}->[0]='';
    }
    
    # Frigging with horizontal bar graphs
    
    if ($grph{HORIZONTAL}->[0])
    {
	# First make all series bar type
	
	foreach my $s (@{$stats->{BAR}}) {$s=1;}
	
	# Now alter data to $label~col1^col2...
	
	foreach my $s (0..$#{$stats->{DATA}})
	{
	    my $d=$stats->{DATA}->[$s];
	    my $v=shift(@{$d});
	    my $t=join('^',@{$d});
	    $stats->{NAME}->[$s].="~$t";
	    $stats->{DATA}->[$s]=[$v];
	}
    }
    # Now find out width of any text
    
#     my $tmpnm="busgraph-$$";
#     my $tmpdir='/tmp';
#     
#     if (exists($ENV{GROFF_TMPDIR}))
#     {
# 	$tmpdir=$ENV{GROFF_TMPDIR};
#     }
#     else
#     {
# 	$tmpdir=$ENV{TMPDIR} if exists($ENV{TMPDIR});
#     }
#     
#     my $seq='0000';
#     
#     do
#     {
# 	$fn="$tmpdir/$tmpnm";
# 	$fn.="-$seq" if $seq ne '0000';
# 	$seq++;
#     } until (! -e "$fn.dat");
#     
#     open($fh,">$fn.dat") or die "Failed to open '$fn.dat'";
#     
#     print $fh ".ps $grph{PS}->[0]\n";
#     print $fh ".vs $grph{VS}->[0]\n";
#     print $fh ".ft $grph{FT}->[0]\n";
#     
#     FindLen('I::','I');
#     FindLen('II::','II');
#     my $ser=0;
#     
#     foreach my $s (@data)
#     {
# 	my $txt=$s->[1];
# 	my (@wds)=split(' ',$txt);
# 	$ser++;
# 	FindLen("S:$ser:TOT",$s->[1]);
# 	
# 	my $wd=0;
# 	
# 	foreach my $w (@wds)
# 	{
# 	    $wd++;
# 	    
# 	    FindLen("S:${ser}:${wd}",$w);
# 	}
#     }
#     
#     close($fh);
#     
#     LoadLengths("$fn.dat");
    
    $buf.=".nr GRP:ll \\n[.ll]\n.ev GRP\n.ad l\n.ft $grph{FT}->[0]\n.fam ".substr($grph{FT}->[0],0,-1)."\n.ps $grph{PS}->[0]\n.vs 0\n\\M[$grph{TEXTCOLOUR}->[0]]\\c\n";
    
    if ($grph{PDFBOOKMARK}->[0] and $grph{CAPTION}->[0])
    {
	$buf.=".pdfbookmark $grph{PDFBOOKMARK}->[0] ".($type eq 'pi'?'Pie':'Chart').": $grph{CAPTION}->[0]\n";
    }
    
    if ($grph{JUST}->[0] eq 'left')
    {
	$buf.=".nr GRP:lefx 0\n";
    }
    elsif ($grph{JUST}->[0] eq 'centre')
    {
	$buf.=".nr GRP:lefx \\n[GRP:ll]u/2-($grph{FRAME}->[0]p/2)\n";
    }
    else
    {
	$buf.=".nr GRP:lefx \\n[GRP:ll]u-$grph{FRAME}->[0]p\n";
    }
    
    if ($grph{TYPE}->[0] eq 'pi')
    {
	Do_Pie();
    }
    else
    {
	Do_Graph();
    }
    
    if ($grph{FLOW}->[0] and $grph{JUST}->[0] ne 'centre')
    {
	$buf.=".de GRP:skip\n.if \\\\n[.d]<\\\\n[GRP:mk]u+$grph{FRAME}->[1]p .sp |\\\\n[GRP:mk]u+$grph{FRAME}->[1]p\n..\n";
	
	if ($grph{JUST}->[0] eq 'left')
	{
	    $buf.=".sp |\\n[GRP:mk]u\n.nr GRP:JPos \\n[GRP:mk]u+$grph{FRAME}->[1]p-.9v\n.de GRP:Just\n'in -($grph{FRAME}->[0]p+8p)\n'sp \\\\n[.trunc]u\n.wh \\n[GRP:JPos]u\n..\n.wh \\n[GRP:JPos]u GRP:Just\n.in $grph{FRAME}->[0]p+8p\n";
	}
	elsif ($grph{JUST}->[0] eq 'right')
	{
	    $buf.=".sp |\\n[GRP:mk]u\n.nr GRP:JPos \\n[GRP:mk]u+$grph{FRAME}->[1]p-.9v\n.de GRP:Just\n.ll +($grph{FRAME}->[0]p+8p)\n'sp \\\\n[.trunc]u\n.wh \\n[GRP:JPos]u\n..\n.wh \\n[GRP:JPos]u GRP:Just\n.ll -($grph{FRAME}->[0]p+8p)\n";
	}
    }
    else
    {
	$buf.=".sp |\\n[GRP:mk]u+$grph{FRAME}->[1]p\n";
    }
    
    
    
    print ".BGS FRAME $grph{FRAME}->[0]p $grph{FRAME}->[1]p\n";
    print $buf;
    print ".BGE\n";
}

sub Log
{
    my $crit=shift;
    my $msg=shift;
    
    print STDERR "busgrap: $msg\n";
    exit 1 if $crit;
}

sub defcol
{
    my $col=shift;
    return('') if $col eq '';
    my $colnm=$col;
    $colnm=~tr[ ][_];
    #    return($colnm) if exists($defcol{$colnm});
    
    my ($coltype,$arg)=split(' ',$col,2);
    my (@c)=GetComponents($arg);
    
    $buf.=".defcolor $colnm $coltype #".join('',map(sprintf("%02x",$_>>8),@c))."\n";
    
    if ($coltype eq 'cmyk')
    {
	$c[3]+=0x10000*$grph{DARKER}->[0];
    }
    elsif ($coltype eq 'cmy')
    {
	foreach my $c (@c) {$c/=$grph{DARKER}->[0];}
    }
    elsif ($coltype eq 'gray')
    {
	$c[0]-=0x10000*$grph{DARKER}->[0];
    }
    elsif ($coltype eq 'rgb')
    {
	foreach my $c (@c) {$c*=$grph{DARKER}->[0];}
    }
    
    foreach my $c (@c)
    {
	$c=0xffff if ($c > 0xffff);
	$c=0 if ($c<0);
    }
    
    $buf.=".defcolor ${colnm}DK $coltype #".join('',map(sprintf("%02x",$_>>8),@c))."\n";
    
    $defcol{$colnm}=1;
    return($colnm);
}

sub contrast
{
    my $col=shift;
    
    my ($coltype,$arg)=split('_',$col,2);
    my (@c)=GetComponents($arg);
    
    # (299*R + 587*G + 114*B) / 1000
    
    if ($coltype eq "rgb")
    {
	return(((($c[0]>>8)*299 + ($c[1]>>8)*587 + ($c[2]>>8)*114)/1000)>128?'black':'white');
    }
    elsif ($coltype eq "grey")
    {
	return(($c[0]>128)?'black':'white');
    }
    
    return(undef);
}

sub GetComponents
{
    my $arg=shift;
    
    if ($arg=~m/([0-9.]+)f?\s+([0-9.]+)f?\s+([0-9.]+)f?/)
    {
	return($1*65535,$2*65535,$3*65535)
    }
    elsif ($arg=~m/(\d+)\s+(\d+)\s+(\d+)/)
    {
	return($1,$2,$3)
    }
    elsif (substr($arg,0,2) eq '##')
    {
	return(map(hex($_),$arg=~m/[0-9a-fA-F]{4}/g));
    }
    elsif (substr($arg,0,1) eq '#')
    {
	return((map(hex($_) << 8,$arg=~m/[0-9a-fA-F]{2}/g)));
    }
    
    Log(0,"Failed to convert colour component '$arg'");
    return(());
}

sub FindLen
{
    my $key=shift;
    my $val=shift;
    
    print $fh ".nr tm \\w'$val'\n.tm $key:\\n[tm]:\\n[rst]:\\n[rsb]\n";
}

sub LoadLengths
{
    my $fn=shift;
    
    open(F,"groff $fn -Z 2>&1 |") or die "Can't run groff!\n";
    
    while (<F>)
    {
	chomp;
	
	my (@r)=split(':');
	
	$sz{$r[0]}->{$r[1]}->{$r[2]}=[@r[3..5]];
    }
    
    close(F) or die "Spawning groff failed!\n";
}

sub ToPoints
{
    my $num=shift;
    my $unit=shift;
    my $ln=shift;
    
    if ($unit eq 'i')
    {
	return($num*72);
    }
    elsif ($unit eq 'c')
    {
	return int($num*72/2.54);
    }
    elsif ($unit eq 'm')	# millimetres
    {
	return int($num*72/25.4);
    }
    elsif ($unit eq 'p')
    {
	return($num);
    }
    elsif ($unit eq 'P')
    {
	return($num*6);
    }
    else
    {
	Log(1,$ln,"Unknown scaling factor '$unit'");
    }
}

sub Do_Pie
{
    my $tot=0;
    my $totval='';
    my $srt;
    $piestart=$pi/8;
    my $pieradx=$grph{XRAD}->[0]*1000;
    my $pierady=$grph{YRAD}->[0]*1000;
    my $pct=$grph{PDECIMALS}->[0];
    my $residual=$grph{OTHERS}->[0];
    my $key=$grph{KEYBOX}->[0];
    my $hole=$grph{HOLE}->[0];
    my $shadv=int((($pieradx+$pierady)/2)*.12);
    my $shadh=int($shadv/2);
    my $usey=$grph{FRAME}->[1];
    my $usex=$grph{FRAME}->[0];
    Log(1,0,"No Series data found") if $#data == -1;
    
    my (@wdgs)=(@data);
    
    if ($grph{SORT}->[0])
    {
	foreach my $wdg (sort {$b->[0] <=> $a->[0]} @wdgs)
	{
	    $tot+=$wdg->[0];
	    push(@{$srt},$wdg);
	}
    }
    else
    {
	foreach my $wdg (@wdgs)
	{
	    $tot+=$wdg->[0];
	    push(@{$srt},$wdg);
	}
    }
    
    my $totpctval=0;
    
    my $bot=scalar(@wdgs)-1;
    my $label=$grph{LABEL}->[0];
    $label='' if $key;
    return if $tot == 0;
    return if $bot+1 < 1;
    
    foreach my $wdg (@{$srt})
    {
	my $pctval=sprintf("%0.*f",abs(${pct}),$wdg->[0]*100/$tot);
	$wdg->[2]=$pctval;
	$totpctval+=$pctval;
    }
    
    $srt->[0]->[2]+=(100-$totpctval);	# "correction" to make percentages = 100
    
    my $srt2;
    my $bot2=$bot;
    
    # 		for (my $j=0; $j <= $bot2; $j++)
    # 		{
    # 			push(@{$srt2},$srt->[$j]);
    #
    # 			if ($j < $bot2)
    # 			{
    # 				push(@{$srt2},$srt->[$bot2--]);
    # 			}
    # 		}
    #
    # 		$srt=$srt2;
    
    my $residtxt='';
    
    for (my $j=$bot; $j > 0; $j--)
    {
	next if !defined($srt->[$j]) or $key;
	
	if ($srt->[$j]->[2] < $residual)
	{
	    my $i=$j;
	    my $t=$srt->[$j]->[2];
	    my $tc=1;
	    
	    while ($i > 0 and (($t+$srt->[$i-1]->[2]) < ($residual*2)) or (($t+$srt->[$i-1]->[2])>=($residual*2) and ($srt->[$i-1]->[2] < $residual)))
	    {
		$i--;
		$t+=$srt->[$i]->[2];
		$tc++;
	    }
	    
	    if ($i < $j)
	    {
		$residtxt.=', ' if $residtxt ne '';
		$residtxt.=FillTplt($grph{LABEL}->[0],$srt->[$i]->[1],$srt->[$i]->[3],$srt->[$i]->[2],$pct);
		$srt->[$i]->[1]="Others";
		my $rt='';
		
		foreach my $k ($i+1..$j)
		{
		    $srt->[$i]->[2]+=$srt->[$k]->[2];
		    $srt->[$i]->[0]+=$srt->[$k]->[0];
		    $residtxt.=', ' if $residtxt ne '';
		    $rt=FillTplt($grph{LABEL}->[0],$srt->[$k]->[1],$srt->[$k]->[3],$srt->[$k]->[2],$pct);
		    $rt=~s/ /\\ /g;
		    $residtxt.=$rt;
		    $srt->[$k]=undef;
		}
		
		$srt->[$i]->[3]=$srt->[$i]->[0];
	    }
	}
    }
    
    if (!$grph{NEGPIE})
    {
	$buf.=".ne ${usey}p\n.nf\n.vs 0\n.mk GRP:mk\n";
	$buf.=".in \\n[GRP:lefx]u\n\\Z'\\D't $grph{THICKNESS}->[0]p'\\m[$grph{TEXTCOLOUR}->[0]]\\M[$grph{LINECOLOUR}->[0]]'\\c\n";
	
	if ($grph{BGCOLOUR}->[0] ne '')
	{
	    $buf.="\\Z@\\M[$grph{BGCOLOUR}->[0]]\\D'P ${usex}p 0 0 ${usey}p -${usex}p 0 0 -${usey}p'\\M[]@\\c\n";
	}
	
	if ($grph{BORDER}->[0])
	{
	    $buf.="\\Z@\\D't $grph{BORDER}->[0]p'@\\Z@\\m[$grph{BRDCOLOUR}->[0]]\\D'p ${usex}p 0 0 ${usey}p -${usex}p 0 0 -${usey}p'\\D't $grph{THICKNESS}->[0]p'\\m[]@\\c\n";
	}
	
	$buf.=".fl\n.vs $grph{VS}->[0]p\n";
	
	if ($grph{CAPTION}->[0] ne '')
	{
	    $buf.=".fi\n.ad c\n.ll ${usex}p+\\n[GRP:lefx]u\n\\s'+2p'$grph{CAPTION}->[0]\\s'-2p'\n.sp -1\n.ad\n.nf\n";
	}
	
	$buf.="\\v'$grph{ORIGIN}->[1]p'\\h'$grph{ORIGIN}->[0]p'\\c\n";
	my $lastfill=scalar(@{$grph{SHADE}})-1;
	my $pie3d=$grph{'3D'}->[0];
	
	if ($lastfill >= 1)
	{
	    $buf.="\\v'${pie3d}p'";
	    $buf.="\\Z@\\v'${shadv}u'\\h'${shadh}u-${pieradx}u'";
	    foreach my $j (0..$lastfill-1)	# must have at least 2 colours
	    {
		$buf.="\\Z^\\M[".$grph{SHADE}->[$j]."]\\D'E ".(${pieradx}*2)."u ".(${pierady}*2)."u'^\\v'-".($shadv/$lastfill)."u'\\h'-".($shadh/$lastfill)."u'\\M[]";
	    }
	    
	    $buf.="\\Z^\\h'-".($shadh/$lastfill)."u'\\M[".$grph{SHADE}->[$lastfill]."]\\D'E ".(${pieradx}*2)."u ".(${pierady}*2)."u'^\\M[]";
	    $buf.="@\\c\n";
	    $buf.="\\v'-${pie3d}p'\\c\n";
	}
	
	my $nooutline=($bot==0)?1:0;
	$nooutline=1 if $grph{COLOURED}->[0];
	
	if ($pie3d)
	{
	    for (my $j=0; $j <= $bot; $j++)
	    {
		next if !defined($srt->[$j]);
		my ($val,$txt,$pctval)=(@{$srt->[$j]});
		
		DoWedge3d(($val/$tot)*360,$grph{SCOLOURS}->[$j]."DK",$txt,$pieradx,$pierady,$nooutline,$grph{'3D'}->[0]) if $pct < 0 or $pctval > 0;
	    }
	}
	
	for (my $j=0; $j <= $bot; $j++)
	{
	    next if !defined($srt->[$j]);
	    my ($val,$txt,$pctval,$valtxt)=(@{$srt->[$j]});
	    
	    $pctval=($pct>=0)?sprintf("%0.*f",abs(${pct}),$pctval):'';
	    
	    my $tmplt=FillTplt($grph{LABEL}->[0],$txt,$valtxt,$pctval,$pct);
	    
	    $txt=$tmplt if $pct >= 0;
	    $txt='' if $label eq '';
	    
	    DoWedge(($val/$tot)*360,$grph{SCOLOURS}->[$j],$txt,$pieradx,$pierady,$nooutline,$grph{'3D'}->[0]) if $pct < 0 or $pctval > 0;
	}
	
	if ($hole)
	{
	    $piestart=$pi/8;
	    DoWedge(360,$grph{BGCOLOUR}->[0],'',$pieradx*$hole,$pierady*$hole,1,0);
	}
	
	if ($residtxt ne '')
	{
	    my $ry=int($grph{ORIGIN}->[1]+$grph{YRAD}->[0]+$grph{'3D'}->[0]+2);
	    # 	    setupfield($fldp,0,1,0);
	    $buf.=".ll ".($grph{FRAME}->[0])."p\n";
	    $buf.=".fi\n.ad c\n.sp ${ry}p+1.5v\nOthers includes: $residtxt\n.nf\n.ad l\n";
	}
	
    }
    
    if ($key and !$grph{NEGPIE})
    {
	my $boxlabels=join("\t",@{$grph{BOXLABELS}});
	my $boxheads=join("\t",@{$grph{BOXHEADS}});
	my $boxtabs=join(' ',@{$grph{BOXTABS}});
	$buf.=".vs 0\n.sp |\\n[GRP:mk]u+$grph{BOXFRAME}->[1]p\n.in +$grph{BOXFRAME}->[0]p\n.ta $boxtabs\n.vs\n.in +(1m+4p)\n\\fB$boxheads\\fP\n.sp -.2\n.in -(1m+4p)\n";
	
	for (my $j=0; $j <= $bot; $j++)
	{
	    next if !defined($srt->[$j]);
	    my ($val,$txt,$pctval,$valtxt)=(@{$srt->[$j]});
	    my $textcol=$grph{TEXTCOLOUR}->[0];
	    my $linecol=$grph{LINECOLOUR}->[0];
	    $linecol=$grph{SCOLOURS}->[$j] if $grph{COLOURED}->[0];
	    $valtxt=FillTplt($boxlabels,$txt,$valtxt,$pctval,$pct);
	    
	    $buf.="\\M[$grph{SCOLOURS}->[$j]]\\m[$linecol]";
	    $buf.="\\Z!\\D'P 0 1 1 0 0 -1'!" if $val > 0;
	    $buf.="\\D'p 0 1 1 0 0 -1'\\M[]\n.in +1m\n.in +4p\n.sp -.2v\n";
	    $buf.="\\m[$textcol]$valtxt\\m[]\n.sp -.5\n.in -(1m+4p)\n";
	}
	
	# 	if ($totval and $bot > 0)
	# 	{
	# 	    my $pctval=($pct>=0)?sprintf("%0.*f%%",abs(${pct}),100):'';
	# 	    $buf.=".in +1m\n'in +$fldk->{INDENT}->{LEFT}p\n'sp +.8v\nTotal\\c\n.in -1m\n.in -$fldk->{INDENT}->{LEFT}p\n'sp -1\n\t$totval\t$pctval\n";
	# 	}
    }
    
    $buf.=".fl\n.ev\n";
    #     print $buf;
}

sub FillTplt
{
    my $tmplt=shift;
    my $txt=shift;
    my $valtxt=shift;
    my $pctval=shift;
    my $pct=shift;
    
    $tmplt=~s/\$text/$txt/ge;
    $tmplt=~s/\$value/$valtxt/ge;
    $tmplt=~s/\$percent/sprintf("%0.*f",abs($pct),$pctval)/ge;
    
    return($tmplt);
}

sub PtoR
{
    my $theta=shift;
    my $radx=shift;
    my $rady=shift;
    
    my $y=-int(sin($theta)*$rady);
    my $x=int(cos($theta)*$radx);
    
    return ($x,$y);
}

sub rad
{
    my $deg=shift;
    
    return((($deg)/360)*$pi);
}

sub deg
{
    my $rad=shift;
    
    return(($rad*360)/$pi);
}

sub DoWedge
{
    my ($ox,$oy)=(0,0);
    my $end=rad($_[0])+$piestart;
    my $col=$_[1];
    my $txt=$_[2];
    my $pieradx=$_[3];
    my $pierady=$_[4];
    my $nooutline=$_[5];
    my $depth3d=$_[6]*1000;
    my $step=.05;
    my $points='';
    my $j;
    
    for ($j=$piestart; $j<=$end; $j+=$step)
    {
	#		$j=$end if $end-$j < $step;
	my ($x,$y)=PtoR($j,$pieradx,$pierady);
	$x-=$ox;
	$y-=$oy;
	$points.="${x}u ${y}u ";
	$ox+=$x;
	$oy+=$y;
    }
    
    if ($j < $end+$step)
    {
	$j=$end;
	my ($x,$y)=PtoR($j,$pieradx,$pierady);
	$x-=$ox;
	$y-=$oy;
	$points.="${x}u ${y}u ";
	$ox+=$x;
	$oy+=$y;
    }
    
    $points.="-${ox}u -${oy}u'";
    $buf.="\\M[$col]\\D'P 0 0 $points\\M[]\\c\n";
    $buf.="\\m[$grph{LINECOLOUR}->[0]]\\D'p 0 0 $points\\m[]\\c\n" if !$nooutline;
    $j=$piestart+(($end-$piestart)/2);
    while ($j-$pi >= 0) {$j-=$pi;}
    $piestart=$end;
    return if $txt eq '';
    my ($x,$y)=PtoR($j,$pieradx*1.05,$pierady*1.15);
    $depth3d=0 if !($j>=$pi/2 and $j < $pi);
    $buf.=".nr wi \\w'$txt'\n";
    $buf.="\\Z@\\h'${x}u'\\v'${y}u+${depth3d}u'";
    $buf.="\\v'\\n[rsb]u'" if $y < -1000;
    $buf.="\\v'\\n[rst]u'" if $y > 1000;
    rjust($txt) if $x < -1000;
    ljust($txt) if $x > 1000;
    cjust($txt) if abs($x) <= 1000;
    $buf.="@\\c\n";
    my($x1,$y1)=PtoR($j,$pieradx,$pierady);
    $x-=$x1;
    $y-=$y1;
    $y1+=$depth3d;
    $buf.="\\Z@\\h'${x1}u'\\v'${y1}u'\\D'l ${x}u ${y}u'@\\c\n";
}

sub DoWedge3d
{
    my ($ox,$oy)=(0,0);
    my $end=rad($_[0])+$piestart;
    my $col=$_[1];
    my $txt=$_[2];
    my $pieradx=$_[3];
    my $pierady=$_[4];
    my $nooutline=$_[5];
    my $depth3d=$_[6]*1000;
    my $step=.05;
    my $points='';
    my $j;
    my $doing3d=0;
    my $predark='';
    my $offs;
    my $sx;
    
    for ($j=$piestart; $j<=$end; $j+=$step)
    {
	#		$j=$end if $end-$j < $step;
	my ($x,$y)=PtoR($j,$pieradx,$pierady);
	if ($doing3d==0 and $j>=$pi/2 and $j < $pi)
	{
	    $doing3d=1;
	    $offs=$y+$depth3d;
	    $ox=$x;
	    $oy=$y;
	    $sx=$x;
	    $predark="0u ${offs}u";
	}
	elsif ($doing3d==1 and $j>=$pi)
	{
	    $doing3d=2;
	    last;
	}
	elsif ($doing3d==1)
	{
	    $x-=$ox;
	    $y-=$oy;
	    $points.="${x}u ${y}u ";
	    $ox+=$x;
	    $oy+=$y;
	}
    }
    
    if ($doing3d==1 and $j < $end+$step)
    {
	$j=$end;
	my ($x,$y)=PtoR($j,$pieradx,$pierady);
	$x-=$ox;
	$y-=$oy;
	$points.="${x}u ${y}u ";
	$ox+=$x;
	$oy+=$y;
    }
    
    if ($doing3d)
    {
	$offs=$depth3d+$oy;
	my $ex=$sx-$ox;
	$points.="0 -${offs}u ${ex}u 0'\\h'-${sx}u";
	$buf.="\\M[$col]\\h'${sx}u'\\D'P $predark $points'\\M[]\\c\n";
	$buf.="\\h'${sx}u'\\m[$grph{LINECOLOUR}->[0]]\\D'p $predark $points'\\m[]\\c\n" if !$nooutline;
    }
    
    $j=$piestart+(($end-$piestart)/2);
    $piestart=$end;
}

sub rjust
{
    my $txt=shift;
    
    $buf.="\\h'-\\n[wi]u'$txt";
}

sub ljust
{
    my $txt=shift;
    
    $buf.="$txt";
}

sub cjust
{
    my $txt=shift;
    
    $buf.="\\h'-\\n[wi]u/2u'$txt";
}

sub Do_Graph
{
    CalcData();
    PlotData();
}

sub LoadData
{
    my $s=shift;
    my $nm=shift;
    my $d=shift;
    
    if (uc($s) eq 'X')
    {
	push(@{$stats->{LABELS}},@{$d});
    }
    elsif (uc($s) eq 'A')
    {
	push(@{$stats->{ANCHOR}},undef,@{$d});
    }
    else
    {
	if (uc(substr($nm,0,4)) eq "BAR:")
	{
	    $nm=substr($nm,4);
	    $stats->{BAR}->[$s]=1;
	}
	else
	{
	    $stats->{BAR}->[$s]=0;
	}
	push(@{$stats->{DATA}->[$s]},@{$d});
	$stats->{NAME}->[$s]=$nm;
    }
}

sub CalcData
{
    my $pointsz=$grph{PS}->[0];
    my ($min,$max,$factor,$range,$diff,$steps,$step,$bars);
    my $floorflag=$grph{FLOORFLAG}->[0];
    my $horizontal=$grph{HORIZONTAL}->[0];
    
    $factor=0;
    
    foreach my $set (@{$stats->{DATA}})
    {
	next if !defined($set);
	$#{$set}=$#{$stats->{LABELS}};
	my @tset=@{$set};
	
	while (@tset)
	{
	    my $y=shift(@tset);
	    last if !defined($y);
	    next if $y eq '.';
	    
	    if ($y =~ m/\.(\d+)$/)
	    {
		$factor=length($1) if length($1) > $factor;
	    }
	}
    }
    
    $stats->{YFACTOR}=$factor;
    my $floor=(exists($grph{FLOOR}))?$grph{FLOOR}->[0]*10**$factor:undef;
    $min=$max=$floor if defined($floor);
    
    foreach my $set (@{$stats->{DATA}})
    {
	next if !defined($set);
	my @tset=@{$set};
	
	while (@tset)
	{
	    my $y=shift(@tset);
	    last if !defined($y);
	    next if $y eq '.';
	    
	    $y*=10**$factor;
	    $min=$max=$y if !defined($min);
	    
	    $min=$y if $y < $min;
	    $max=$y if $y > $max;
	}
    }
    
    if (exists($stats->{ANCHOR}))
    {
	foreach my $y (@{$stats->{ANCHOR}})
	{
	    next if !defined($y);
	    next if $y eq '.';
	    my $y2=$y*10**$factor;
	    $min=$y2 if !defined($min) or $y2 < $min;
	    $max=$y2 if !defined($max) or $y2 > $max;
	}
    }
    
    if ($floorflag eq 'C' and $floor >= $min and $floor <= $max)
    {
	my $diffmax=$max-$floor;
	my $diffmin=$floor-$min;
	
	$max=$floor+$diffmin if $diffmax < $diffmin;
	$min=$floor-$diffmax if $diffmax > $diffmin;
    }
    
    $bars=0;
    
    foreach my $bar (@{$stats->{BAR}})
    {
	next if !defined($bar);
	$bar=1 if $horizontal; # Only bars can be horizontal
	$bars++ if $bar;
    }
    
    $bars++ if $bars;
    
    foreach my $xlab (@{$stats->{LABELS}})
    {
	next if !defined($xlab);
	
	if ($xlab=~m/^([A-Z]{3,3})\-(\d+)/i)
	{
	    $xlab=ucfirst(lc($1)).'~'.(($2<30)?$2+2000:($2>100)?$2:$2+1900);
	}
	elsif ($xlab=~m/^(\d+)Q(\d+)/)
	{
	    $xlab=$qname[$1-1].'~'.(($2<30)?$2+2000:($2>100)?$2:$2+1900);
	}
	elsif ($xlab=~m/^(\d+)H(\d+)/)
	{
	    $xlab=$hname[$1-1].'~'.(($2<30)?$2+2000:($2>100)?$2:$2+1900);
	}
	elsif ($xlab=~m/^(\d+)\/(\d+)/)
	{
	    $xlab=$mname[$1-1].'~'.(($2<30)?$2+2000:($2>100)?$2:$2+1900);
	}
    }
    
    my @lbnd=(-1,-1,-1,-1);
    my @lbvl=('','','','');
    my $lbrows=-1;
    
    # X labels can be split over multiple rows (1-4)
    
    foreach my $j (0..scalar(@{$stats->{LABELS}})-1)
    {
	my @vals=split('~',$stats->{LABELS}->[$j]);
	
	foreach my $i (0..3)
	{
	    if (!defined($vals[$i]))
	    {
		$stats->{LABND}->[$j]->[$i]=-1;
		next;
	    }
	    
	    $lbrows=$i if $i > $lbrows;
	    
	    if ($vals[$i] ne $lbvl[$i])
	    {
		#	Differs
		$lbvl[$i]=$vals[$i];
		$lbnd[$i]=$j;
		$stats->{LABND}->[$j]->[$i]=$j;
	    }
	    else
	    {
		$stats->{LABND}->[$lbnd[$i]]->[$i]=$j if $lbnd[$i] > -1;
	    }
	}
	
	$stats->{LABELS}->[$j]=\@vals;
    }
    
    $min=$max=0 if !defined($min);
    $range=$max-$min;
    $range=10*10**$factor,$min--,$max++ if $range/10**$factor < .01;
    $min/=10**$factor;
    $max/=10**$factor;
    $stats->{YRANGE}=$range;
    $stats->{XLABS}=$lbrows+1;
    
    $steps=10;
    $steps=$grph{STEPS}->[0] if exists($grph{STEPS});
    my $ticksz=$range/($steps-1);
    my $x=ceil(log10($ticksz)-1);
    my $pow10x=10**$x;
    $ticksz=ceil($ticksz/$pow10x)*$pow10x/10**$factor;
    my $lo2=$ticksz*round($min/$ticksz);
    my $hi2=$ticksz*round($max/$ticksz);
    $lo2-=$ticksz if $min < $lo2;
    $hi2+=$ticksz if $max >= $hi2;
    $steps=sprintf("%0f",($hi2-$lo2)/$ticksz);
    $stats->{YMIN}=$lo2;
    $stats->{YMAX}=$hi2;
    $stats->{YSTEP}=$ticksz;
    $stats->{YSTEPS}=$steps;
    # 	print STDERR "Min=$min, Max=$max, Lo=$lo2, Hi=$hi2, Sz=",$ticksz,", Ticks=$steps\n";
    # 	for (my $j=$lo2; $j<=$hi2; $j+=$ticksz) {print STDERR "$j\n";}
    # 	print STDERR "\n";
    
    # #	$range=10*10**$factor,$min--,$max++ if $range==0;
    # 	$stats->{YRANGE}=$range;
    # 	$stats->{XLABS}=$lbrows+1;
    #
    # 	$steps=10;
    # 	my $maxstep=11;
    # 	$maxstep=$grph{STEPS} if exists($grph{STEPS});
    # 	$step=-1;
    #
    # 	while ($steps > 9)
    # 	{
    # 		$step++;
    # 		$steps=int($range/(10**$step)+1);
    # 	}
    #
    # 	$step=10**$step;
    # 	$step/=10, $steps*=10 if $steps < 2;
    # 	$step/=5, $steps*=5 if $steps < 5 and $steps < $maxstep;
    # 	$step/=2, $steps*=2 if $steps < 7 and $steps < $maxstep;
    # 	$step*=2, $steps=int($steps/2) if $steps > $maxstep;
    #
    # 	$stats->{YMIN}=int($min/$step)*$step/10**$factor;
    # 	$stats->{YMAX}=(int($max/$step)+1)*$step/10**$factor;
    # 	$stats->{YSTEP}=$step/10**$factor;
    # 	$stats->{YMIN}-=$stats->{YSTEP}, $steps++ if $min < $stats->{YMIN};
    # 	$stats->{YMAX}+=$stats->{YSTEP}, $steps++ if $max > $stats->{YMAX};
    # 	$stats->{YSTEPS}=$steps;
    $factor=0;
    if ($grph{PDECIMALS}->[0] ne '')
    {
	$factor=$grph{PDECIMALS}->[0];
    }
    else
    {
	$factor=length($1) if ($stats->{YSTEP}=~m/\.(\d+)$/);
    }
    $stats->{YMAX}=sprintf("%.*f",$factor,$stats->{YMAX});
    $stats->{XSTEPS}=scalar(@{$stats->{LABELS}});
    $stats->{XSTEPS}=1 if $horizontal;
    $stats->{BARS}=$bars;
    
    my $ylab=length($stats->{YMAX})+1;
    #	$ylab+=2 if $grph{PDECIMALS} >= 0;
    $xmarg=$ylab/2*1.2*$pointsz+($pointsz*.4);
    $ymarg=0;
    
    foreach my $j (0..$lbrows)
    {
	$ymarg+=$pointsz+$j+($pointsz*.1);
    }
    
}

sub sgn
{
    return 1 if $_[0]>=0;
    return -1;
}

sub log10
{
    my $n = shift;
    return 0 if !$n;
    return log($n)/log(10);
}

sub ceil
{
    my $n=shift;
    my $i=int($n);
    return ($n==$i)?$n:$i+1;
}

sub round
{
    my $n=shift;
    return(sprintf("%.0f",$n));
}

sub PlotData
{
    my $width=$grph{FRAME}->[0];
    my $height=$grph{FRAME}->[1];
    my $pointsz=$grph{PS}->[0];
    my $gthickness=$grph{THICKNESS}->[0];
    my $thickness=$grph{BORDER}->[0];
    my $symsize=$grph{SYMSIZE}->[0];
    my $background=$grph{BACKGROUND};
    my $key=$grph{KEYBOX}->[0];
    my $bars=$stats->{BARS};
    my $floor=(exists($grph{FLOOR}))?$grph{FLOOR}->[0]:$stats->{YMIN};
    my $horizontal=$grph{HORIZONTAL}->[0];
    my $topmarg=$pointsz+2;
    $topmarg+=$pointsz if $key;# and !$horizontal;
    my ($xgrph,$ygrph,@sync);
    my ($xof,$yof,$tm,$lm)=(0,0,0,0);
    
    if ($grph{ORIGIN}->[0] ne '')
    {
	$xof=$lm=$grph{ORIGIN}->[0];
	$yof=$tm=$grph{ORIGIN}->[1];
	
	if ($#{$grph{ORIGIN}} == 3)
	{
	    $xof=$width-$grph{ORIGIN}->[2];
	    $yof=$height-$grph{ORIGIN}->[3];
	}
    }
    
    if ($horizontal)
    {
	my $t=$width;
	$width=$height;
	$height=$t;
	# 		$t=$xmarg;
	# 		$xmarg=$ymarg;
	# 		$ymarg=$t;
	$ymarg=0;
	$xmarg=$pointsz;
	$ygrph=($height-$xmarg*2-$xof);
	$xgrph=($width-$pointsz*2.8-$yof);
	$xmarg+=$lm;
	$ymarg+=$tm;
    }
    else
    {
	$ygrph=($height-$ymarg-$topmarg-$yof);
	$xgrph=($width-$xmarg-$xof);
    }
    
    return if $stats->{YSTEPS} == 0 or $stats->{XSTEPS} == 0 or ($bars==0 and $horizontal);
    my $ydiv=sprintf("%.2f",$ygrph/$stats->{YSTEPS});
    my $xdiv=sprintf("%.2f",$xgrph/$stats->{XSTEPS});
    my $barwidth=($bars)?($xdiv*.8)/$bars:0;
    my $lbrows=$stats->{XLABS}-1;
    my $span=sprintf("%.2f",$stats->{YSTEP}*$stats->{YSTEPS});
    # 	print STDERR "ydiv=$ydiv, xdiv=$xdiv, span=$span, YSTEP=$stats->{YSTEP}, YSTEPS=$stats->{YSTEPS}\n";
    if ($span == 0)
    {
	Log(1,"WARN: span is zero");
	return;
    };
    
    # Move to origin
    
    my $thick=$symsize;
    my $thick2=$thick*2;
    my $y60=1*$thick;
    my $x60=.866*$thick;
    my $x60_2=$x60*2;
    my $y60_2=$y60*2;
    
    no warnings;
    
    $buf.=<< "EOF";
.ds series2 \\M[$grph{SCOLOURS}->[1]]\\h'-${thick}p'\\D'C ${thick2}p'\\h'-${thick}p'\\M[]
.ds series3 \\Z'\\M[$grph{SCOLOURS}->[2]]\\h'${thick}p'\\D'P -${thick}p ${thick}p -${thick}p -${thick}p ${thick}p -${thick}p'\\M[]'
.ds series4 \\Z'\\M[$grph{SCOLOURS}->[3]]\\h'${thick}p'\\v'-${thick}p'\\D'P 0p ${thick2}p -${thick2}p 0p 0p -${thick2}p'\\M[]'
.ds series1 \\Z'\\M[$grph{SCOLOURS}->[0]]\\v'-${thick}p'\\D'P ${thick}p ${thick2}p -${thick2}p 0p'\\M[]'
.ds series6 \\M[$grph{SCOLOURS}->[5]]\\h'-${thick}p'\\D'C ${thick2}p'\\h'-${thick}p'\\M[]
.ds series5 \\Z'\\M[$grph{SCOLOURS}->[4]]\\h'${x60}p'\\v'-${y60}p'\\D'P -${x60_2}p 0p ${x60}p ${y60_2}p'\\M[]'
EOF
    
    use warnings;
    
    
    $buf.=".ne ${height}p\n.nf\n.mk GRP:mk\n";
    $buf.=".in \\n[GRP:lefx]u\n\\Z'\\D't $grph{THICKNESS}->[0]p'\\m[$grph{TEXTCOLOUR}->[0]]\\M[$grph{LINECOLOUR}->[0]]'\\c\n";
    
    Swap(\$width,\$height) if $horizontal;
    
    if ($grph{BGCOLOUR}->[0] ne '')
    {
	$buf.="\\Z@\\M[$grph{BGCOLOUR}->[0]]\\D'P ${width}p 0 0 ${height}p -${width}p 0 0 -${height}p'\\M[]@\\c\n";
    }
    
    if ($grph{BORDER}->[0])
    {
	$buf.="\\Z@\\D't $grph{BORDER}->[0]p'@\\Z@\\m[$grph{BRDCOLOUR}->[0]]\\D'p ${width}p 0 0 ${height}p -${width}p 0 0 -${height}p'\\D't $grph{THICKNESS}->[0]p'\\m[]@\\c\n";
    }
    
    Swap(\$width,\$height) if $horizontal;
    
    $buf.=".fl\n";
    
    
    
    $buf.=".sp +".($grph{BORDER}->[0])."p\n";
    $buf.=".in +".($grph{BORDER}->[0])."p\n";
    $buf.=".ll +".($grph{FRAME}->[0]-$grph{BORDER}->[0]*2)."p\n";
    #	$buf.=".nf\n";
    
    
    if ($horizontal)
    {
	# Move to origin  (lower left corner)
	
	$buf.=".mk grph\n\\Z'\\D't ${thickness}p''\\v'${xgrph}p+${topmarg}p'\\h'${xmarg}p'\\c\n";
	
	# Background
	
	$buf.="\\Z'\\M[$grph{WALLCOLOUR}->[0]]\\D'P 0p -${xgrph}p ${ygrph}p 0 0 ${xgrph}p'\\M[]'\\c\n" if $grph{WALLCOLOUR}->[0];
	
	# Base Line
	
	$buf.="\\Z'\\D'l ${ygrph}p 0''\\c\n";
	
	# Floor Line
	
	$buf.="\\Z'";
	
	if ($stats->{YMIN} < $floor and $stats->{YMAX} >= $floor)
	{
	    # zero is between min/max so draw axis on zero
	    $buf.="\\h'".abs($stats->{YMIN}-$floor)/$span*$ygrph."p'"
	}
	
	$buf.="\\D'l 0 -${xgrph}p''\\c\n";
	
	# Ticks on X-axis
	
	$buf.="\\Z'";
	
	for my $j (0..$stats->{YSTEPS})
	{
	    $buf.="\\h'${ydiv}p'" if $j;
	    $buf.="\\v'".($pointsz*.1+$thickness/2)."p'\\D'l 0 -".($pointsz*.1)."p'\\v'-".($thickness/2)."p'";
	    $buf.="\\Z!\\D'l 0 -".(${xgrph}-$thickness)."p'!" if $grph{VGRID};
	}
	
	$buf.="'\\c\n";
	
	my $barno=0;
	my $bardiv=d2($xgrph/($bars));
	$barwidth=d2($pointsz*2);
	$barwidth=$bardiv*.8 if $barwidth > $bardiv*.8;
	
	foreach (my $i=scalar(@{$stats->{DATA}})-1; $i>=0; $i--)	# For each  series
	{
	    my $set=$stats->{DATA}->[$i];
	    next if !defined($set);
	    next if !$stats->{BAR}->[$i];
	    my @tset=@{$set};
	    my ($oy,$ay,$cx,$ox);
	    my ($lbl,$txt)=split('~',$stats->{NAME}->[$i]);
	    
	    $cx=$bardiv/2;
	    
	    $buf.=".nr wi \\w'$lbl'\n";
	    my $baseline=($stats->{YMIN}<$floor)?((($stats->{YMIN}-$floor)/$span)*$ygrph):0;
	    #		$oy=((($tset[$ox]-$stats->{YMIN})/$span)+$stats->{YMIN} )*$ygrph;
	    $oy=(($tset[0]-$stats->{YMIN})/$span)*$ygrph;
	    #		$oy=((($tset[$ox]-$stats->{YMIN})/$span)-$stats->{YMIN})*$ygrph;
	    my $s=($i % 6) + 1;
	    
	    my $cx2=sprintf("%.2f",($barno*$bardiv)+($bardiv/2)-($barwidth/2));
	    my $dep;
	    my $colo;
	    $sync[$i]=$topmarg+$xgrph-$cx-$cx2-$barwidth/2-$pointsz*.4;
	    $barno++;
	    
	    my $j=0;	# Horizontal bars have multiple series with one value in each
	    next if !defined($tset[$j]);
	    next if $tset[$j] eq '.';
	    my $y=(($tset[$j]-$stats->{YMIN})/$span)*$ygrph;
	    $dep=d2($oy+$baseline);
	    $dep=sgn($dep)*.5 if abs($dep) < 1;
	    if ($grph{NEGCOLOUR}->[0])
	    {
		$colo=($dep < 0)?$grph{NEGCOLOUR}->[$i]:$grph{SCOLOURS}->[$i];
	    }
	    else
	    {
		$colo=$grph{SCOLOURS}->[$i];
	    }
	    #			my $y=((($tset[$j]-$stats->{YMIN})/$span)+$stats->{YMIN} )*$ygrph;
	    #			my $y=((($tset[$j]-$stats->{YMIN})/$span)-$stats->{YMIN})*$ygrph;
	    
	    my ($contrast,$contrastnd);
	    $contrast=$grph{CONTRAST}->[$i];
	    if (defined($contrast))
	    {
		$contrast="\\m[$contrast]";
		$contrastnd="\\m[]";
	    }
	    else
	    {
		$contrast=$contrastnd='';
	    }
	    
	    if ($dep < 0)
	    {
		if ($pointsz < $barwidth)
		{
		    $buf.=".ie \\n[wi]u+2p<".abs(${dep})."p .ds lb $contrast\\h'1p'$lbl$contrastnd\n";
		    $buf.=".el .ds lb \\h'-\\n[wi]u-2p'$lbl\n";
		}
		else
		{
		    $buf.=".ds lb \\h'-\\n[wi]u-1p'$lbl\n";
		}
	    }
	    else
	    {
		if ($pointsz < $barwidth)
		{
		    $buf.=".ie \\n[wi]u+2p>".abs(${dep})."p .ds lb \\h'1p'$lbl\n";
		    $buf.=".el .ds lb $contrast\\h'-\\n[wi]u-2p'$lbl$contrastnd\n";
		}
		else
		{
		    $buf.=".ds lb \\h'1p'$lbl\n";
		}
	    }
	    $buf.="\\Z'";
	    $buf.="\\h'${oy}p'\\v'-${cx}p'";
	    $buf.="\\m[$colo]" if $grph{COLOURED}->[0];
	    
	    $buf.="\\Z~\\D't 0p'\\M[$colo]\\v'-${cx2}p'\\D'P 0 -${barwidth}p -${dep}p 0 0 ${barwidth}p ${dep}p 0'\\M[]\\D't ${thickness}p'~";
	    $buf.="\\Z~\\v'-".($cx2+$barwidth/2-($pointsz*.4))."p'\\h'".(sgn($dep ))."p'";
	    
	    $buf.="\\*[lb]";
	    $buf.="~";
	    # 				$buf.="\\Z~\\D't 0p'\\M[$colo]\\v'-${cx2}p'\\D'P ${barwidth}p 0p 0p ${dep}p -${barwidth}p 0p 0p -${dep}p'\\M[]\\D't ${thickness}p'~";
	    # 				$buf.="\\v'-${cx}p'\\h'".sprintf("%.3f",$y-$oy)."p'";
	    # 			$buf.="\\D'l ${cx}p ".sprintf("%.3f",$oy-$y)."p'";
	    
	    $buf.="\\m[]" if $grph{COLOURED}->[0];
	    $oy=$y;
	    
	    $dep=$oy+$baseline;
	    # 			if (exists($grph{POSCOLOUR}))
	    # 			{
	    # 				$colo=($dep < 0)?$grph{NEGCOLOUR}->{NAME}:$grph{POSCOLOUR}->{NAME}
	    # 			}
	    # 			else
	    # 			{
	    # 				$colo=$grph{COLOURS}->[$i]->{NAME};
	    # 			}
	    # 			$buf.="\\Z~\\D't 0p'\\M[$colo]\\v'-${cx2}p'\\D'P 0 -${barwidth}p -${dep}p 0 0 ${barwidth}p ${dep}p 0'\\M[]\\D't ${thickness}p'~";
	    
	    $buf.="'\\c\n";
	}
	
	# Now bottom labels
	
	my $y=$stats->{YMIN};
	my $factor=0;
	my $pattern="%.*f";
	if ($grph{PDECIMALS}->[0] ne '')
	{
	    #		$pattern.='%%';
	    $factor=$grph{PDECIMALS}->[0];
	}
	else
	{
	    $factor=length($1) if ($stats->{YSTEP}=~m/\.(\d+)$/);
	    $factor=1 if ($stats->{YMAX}-$stats->{YMIN}) < $stats->{YSTEPS};
	}
	
	$buf.="\\v'".($pointsz*1.2)."p'\\c\n";
	
	foreach my $j (0..$stats->{YSTEPS})
	{
	    my $dy=sprintf($pattern,$factor,$y);
	    $buf.=".nr wi \\w'$dy'\n";
	    $buf.="\\h'-\\n[wi]u/2u'$dy\\h'${ydiv}p-(\\n[wi]u/2u)'\\c\n";
	    $y+=$stats->{YSTEP};
	}
	
	
	if ($grph{KEYBOX}->[0])
	{
	    my $marg=$symsize*4;
	    my $ps=$grph{PS}->[0];
	    
	    my $boxlabels=join("\t",@{$grph{BOXLABELS}});
	    my $boxheads=join("\t",@{$grph{BOXHEADS}});
	    my $boxtabs=join(' ',@{$grph{BOXTABS}});
	    $buf.=".sp |\\n[GRP:mk]u+$grph{BOXFRAME}->[1]p\n.in +$grph{BOXFRAME}->[0]p\n.ta $boxtabs\n.vs\n.in +(4p)\n\\fB$boxheads\\fP\n.sp .2\n.in -(4p)\n";
	    my $y2=0;
	    # 			$buf.=".sp ${pointsz}p\n" if $grph{SYNC};
	    
	    foreach my $i (0..scalar(@{$stats->{NAME}})-1)
	    {
		next if !defined($stats->{NAME}->[$i]);
		my ($lbl,$txt)=split('~',$stats->{NAME}->[$i]);
		
		$txt=~tr[^][\t];
		
		if ($grph{SYNC}->[0])
		{
			$buf.=".sp |\\n[GRP:mk]u+$sync[$i]p-2p\n";
		}
# 		else
# 		{
		    $buf.="\\v'-".($pointsz*.4)."p'\\h'-${thick}p'\\Z!\\M[$grph{SCOLOURS}->[$i]]\\v'-${thick}p'\\D'P ${thick2}p 0 0 ${thick2}p -${thick2}p 0'!\\h'${thick2}p'\\v'".($pointsz*.4)."p'\\~\\c\n" if !$grph{POSCOLOUR}->[0];
		    $buf.="$txt\n";
		    $buf.="\\M[]\\c\n" if !$grph{POSCOLOUR}->[0];
# 		}
		# 				print STDERR "$sync[$i] "
		# 				$buf.="\\v'-".($pointsz*.4)."p'\\D'l ".(${symsize}*4)."p 0p'\\Z'\\h'-".(${symsize}*2)."p'\\*[series$s]'\\v'".($pointsz*.4)."p'\\~\\c\n";
		# 				$buf.=".in +${marg}p\n.sp -1\n$txt\\h'".(${symsize}*2)."p'\n.sp $fldk->{SKIPAFTER}p\n.in -${marg}p\n";
	    }
	}
	
	# 		print STDERR "\n";
    }
    else
    {
	# Move to origin  (lower left corner)
	
	$buf.=".mk grph\n\\Z'\\D't ${thickness}p''\\v'${ygrph}p+${topmarg}p+${tm}p'\\h'${xmarg}p+${lm}p'\\c\n";
	
	# Background
	
	$buf.="\\Z'\\M[$grph{WALLCOLOUR}->[0]]\\D'P 0p -${ygrph}p ${xgrph}p 0 0 ${ygrph}p'\\M[]'\\c\n" if $grph{WALLCOLOUR}->[0];
	
	# Left line
	
	$buf.="\\Z'\\L'-${ygrph}p''\\c\n";
	
	# Bottom line
	
	$buf.="\\Z'";
	
	if ($stats->{YMIN} < $floor and $stats->{YMAX} >= $floor)
	{
	    # zero is between min/max so draw axis on zero
	    $buf.="\\v'-".abs($stats->{YMIN}-$floor)/$span*$ygrph."p'"
	}
	
	$buf.="\\l'${xgrph}p''\\c\n";
	
	# Label Y axis
	
	# ticks
	
	$buf.="\\Z'";
	
	for my $j (0..$stats->{YSTEPS})
	{
	    $buf.="\\v'-${ydiv}p'" if $j;
	    $buf.="\\h'-".($pointsz*.1+$thickness/2)."p'\\l'".($pointsz*.1)."p'\\h'".($thickness/2)."p'";
	    $buf.="\\Z!\\D'l ".(${xgrph}-$thickness)."p 0'!" if $grph{HGRID}->[0];
	}
	
	$buf.="'\\c\n";
	
	# Label X axis
	
	# ticks
	
	foreach my $j (0..$lbrows)
	{
	    my $sofar=0;
	    my $fi=0;
	    my $targ=0;
	    my $nd;
	    my $i;
	    
	    for ($i=0; $i<scalar(@{$stats->{LABELS}}); $i=$nd+1)
	    {
		$nd=$stats->{LABND}->[$i]->[$j];
		$nd=$i if $nd < 0;
		$sofar+=($nd-$i)*$xdiv;
		
		my $mi=($i!=$nd)?$nd:int(($i-$fi)/2)+$fi;
		my $lblsz=length($stats->{LABELS}->[$mi]->[$j] || '')*$pointsz*.6;
		
		if ($lblsz==0 or ($lblsz) > $xdiv+$sofar)
		{
		    $fi=$nd+1 if $lblsz==0;
		    $sofar+=$xdiv;
		    $stats->{LABELS}->[$nd]->[$j]='.' if $nd > $i;
		    next;
		}
		else
		{
# 		    print STDERR "$stats->{LABELS}->[$mi]->[$j]: sofar $sofar: lblsz $lblsz: xdiv $xdiv\n";
		    $sofar=0;
		    foreach my $t ($fi..$nd)
		    {
			$stats->{LABELS}->[$t]->[$j]='' if $stats->{LABELS}->[$t]->[$j] ne '.' and $t != $mi;
		    }
		    $fi=$nd+1;
		}
		
	    }
	    
	    foreach my $i ($fi..$#{$stats->{LABELS}})
	    {
		$stats->{LABELS}->[$i]->[$j]='';
	    }
	    
	}
	
	$buf.="\\Z'";
	
	for my $j (0..$stats->{XSTEPS}-1)
	{
	    $buf.="\\h'${xdiv}p'" if $j;
	    $buf.="\\h'".(${xdiv}/2)."p'" if $j==0;
	    next if $stats->{LABELS}->[$j]->[0] eq '';
	    $buf.="\\D'l 0 ".($pointsz*.3)."p'\\v'-".($pointsz*.3)."p'";
	    $buf.="\\Z!\\D'l 0 -".(${ygrph}-$thickness)."p'!" if $grph{VGRID}->[0];
	}
	
	$buf.="'\\c\n";
	
	# $buf.=series
	
	#	First any bars?
	my $barno=0;
	
	foreach my $i (0..scalar(@{$stats->{DATA}})-1)
	{
	    my $set=$stats->{DATA}->[$i];
	    next if !defined($set);
	    next if !$stats->{BAR}->[$i];
	    my @tset=@{$set};
	    my ($oy,$ay,$cx,$ox);
	    
	    $cx=$xdiv/2+$barwidth/2;
	    
	    for ($ox=0; $ox<=$#tset; $ox++)
	    {
		last if $tset[$ox] ne '.';
		$cx+=$xdiv;
	    }
	    
	    if (!defined($tset[$ox]) or $tset[$ox] eq '.')
	    {
		$stats->{NAME}->[$i]=undef;
		next;
	    }
	    
	    $buf.="\\Z'";
	    my $baseline=($stats->{YMIN}<$floor)?((($stats->{YMIN}-$floor)/$span)*$ygrph):0;
	    #		$oy=((($tset[$ox]-$stats->{YMIN})/$span)+$stats->{YMIN} )*$ygrph;
	    $oy=(($tset[$ox]-$stats->{YMIN})/$span)*$ygrph;
	    #		$oy=((($tset[$ox]-$stats->{YMIN})/$span)-$stats->{YMIN})*$ygrph;
	    my $s=($i % 6) + 1;
	    
	    $buf.="\\v'-${oy}p'\\h'${cx}p'";
	    $cx=0;
	    my $cx2=sprintf("%.3f",($barno*$barwidth)-($bars*$barwidth/2));
	    my $dep;
	    my $colo;
	    
	    foreach my $j ($ox+1..$stats->{XSTEPS})
	    {
		$cx+=$xdiv;
		next if !defined($tset[$j]);
		next if $tset[$j] eq '.';
		my $y=(($tset[$j]-$stats->{YMIN})/$span)*$ygrph;
		$dep=$oy+$baseline;
		$dep=sgn($dep)*.5 if abs($dep) < 1;
		if ($grph{POSCOLOUR}->[0])
		{
		    $colo=($dep < 0)?$grph{NEGCOLOUR}->[0]:$grph{POSCOLOUR}->[0];
		}
		else
		{
		    $colo=$grph{SCOLOURS}->[$i];
		}
		#			my $y=((($tset[$j]-$stats->{YMIN})/$span)+$stats->{YMIN} )*$ygrph;
		#			my $y=((($tset[$j]-$stats->{YMIN})/$span)-$stats->{YMIN})*$ygrph;
		$buf.="\\m[$colo]" if $grph{COLOURED}->[0];
		
		$buf.="\\Z~\\D't 0p'\\M[$colo]\\h'${cx2}p'\\D'P ${barwidth}p 0p 0p ${dep}p -${barwidth}p 0p 0p -${dep}p'\\M[]\\D't ${thickness}p'~";
		$buf.="\\h'${cx}p'\\v'".sprintf("%.3f",$oy-$y)."p'";
		# 			$buf.="\\D'l ${cx}p ".sprintf("%.3f",$oy-$y)."p'";
		
		$buf.="\\m[]" if $grph{COLOURED}->[0];
		$oy=$y;
		$cx=0;
	    }
	    
	    $dep=$oy+$baseline;
	    if ($grph{POSCOLOUR}->[0])
	    {
		$colo=($dep < 0)?$grph{NEGCOLOUR}->[0]:$grph{POSCOLOUR}->[0];
	    }
	    else
	    {
		$colo=$grph{SCOLOURS}->[$i];
	    }
	    $buf.="\\Z~\\D't 0p'\\M[$colo]\\h'${cx2}p'\\D'P ${barwidth}p 0p 0p ${dep}p -${barwidth}p 0p 0p -${dep}p'\\M[]\\D't ${thickness}p'~";
	    
	    $buf.="'\\c\n";
	    $barno++;
	}
	
	#	Now  the graph lines
	
	foreach my $i (0..scalar(@{$stats->{DATA}})-1)
	{
	    my $set=$stats->{DATA}->[$i];
	    next if !defined($set);
	    next if $stats->{BAR}->[$i];
	    my @tset=@{$set};
	    my ($oy,$ay,$cx,$ox);
	    
	    $cx=$xdiv/2;
	    
	    for ($ox=0; $ox<=$#tset; $ox++)
	    {
		last if $tset[$ox] ne '.';
		$cx+=$xdiv;
	    }
	    
	    if (!defined($tset[$ox]) or $tset[$ox] eq '.')
	    {
		$stats->{NAME}->[$i]=undef;
		next;
	    }
	    
	    $buf.="\\Z'";
	    $buf.="\\m[$grph{SCOLOURS}->[$i]DK]" if $grph{COLOURED}->[0];
	    $buf.="\\Z!\\D't ${gthickness}p'!";
	    $oy=(($tset[$ox]-$stats->{YMIN})/$span)*$ygrph;
	    my $s=($i % 6) + 1;
	    
	    if (exists($stats->{ANCHOR}) and $stats->{ANCHOR}->[$i] ne '.')
	    {
		$ay=(($stats->{ANCHOR}->[$i]-$stats->{YMIN})/$span)*$ygrph;
		$buf.="\\v'-${ay}p'";
		if ($background and $i == 0)
		{
		    $buf.="\\Z'\\D't 0p'\\M[$grph{SCOLOURS}->[$i]DK]\\D'P ${cx}p ".sprintf("%.3f",$ay-$oy)."p 0p ${oy}p -${cx}p 0p 0p -${ay}p'\\M[]\\D't ${gthickness}p''";
		}
		$buf.="\\D'l ${cx}p ".sprintf("%.3f",$ay-$oy)."p'";
		$cx=0;
	    }
	    else
	    {
		$buf.="\\v'-${oy}p'\\h'${cx}p'";
		$cx=0;
	    }
	    
	    foreach my $j ($ox+1..$stats->{XSTEPS}-1)
	    {
		$cx+=$xdiv;
		next if !defined($tset[$j]);
		next if $tset[$j] eq '.';
		my $y=(($tset[$j]-$stats->{YMIN})/$span)*$ygrph;
		if ($background and $i == 0)
		{
		    $buf.="\\Z'\\D't 0p'\\M[$grph{SCOLOURS}->[$i]DK]\\D'P ${cx}p ".sprintf("%.3f",$oy-$y)."p 0p ${y}p -${cx}p 0p 0p -${oy}p'\\M[]\\D't ${gthickness}p''";
		}
		
		$buf.="\\D'l ${cx}p ".sprintf("%.3f",$oy-$y)."p'";
		
		$oy=$y;
		$cx=0;
	    }
	    
	    $buf.="\\m[]" if $grph{COLOURED}->[0];
	    $buf.="'\\c\n";
	    
	    # Draw points
	    
	    if ($symsize)
	    {
		$cx=$xdiv/2;
		
		for ($ox=0; $ox<=$#tset; $ox++)
		{
		    last if $tset[$ox] ne '.';
		    $cx+=$xdiv;
		}
		
		if (!defined($tset[$ox]) or $tset[$ox] eq '.')
		{
		    $stats->{NAME}->[$i]=undef;
		    next;
		}
		
		$buf.="\\Z'";
		$buf.="\\m[$grph{SCOLOURS}->[$i]]" if $grph{COLOURED}->[0];
		$oy=(($tset[$ox]-$stats->{YMIN})/$span)*$ygrph;
		
		if (exists($stats->{ANCHOR}) and $stats->{ANCHOR}->[$i] ne '.')
		{
		    $ay=(($stats->{ANCHOR}->[$i]-$stats->{YMIN})/$span)*$ygrph;
		    $buf.="\\v'-${ay}p'";
		    $buf.="\\h'${cx}p'\\v'".sprintf("%.3f",$ay-$oy)."p'";
		    $cx=0;
		}
		else
		{
		    $buf.="\\v'-${oy}p'\\h'${cx}p'";
		    $cx=0;
		}
		
		my $sym='';
		$sym="\\*[series$s]" if !$background or $i != 0;
		$buf.=$sym;
		
		foreach my $j ($ox+1..$stats->{XSTEPS}-1)
		{
		    $cx+=$xdiv;
		    next if !defined($tset[$j]);
		    next if $tset[$j] eq '.';
		    my $y=(($tset[$j]-$stats->{YMIN})/$span)*$ygrph;
		    $buf.="\\h'${cx}p'\\v'".sprintf("%.3f",$oy-$y)."p'$sym";
		    $oy=$y;
		    $cx=0;
		}
		
		$buf.="\\m[]" if $grph{COLOURED};
		$buf.="'\\c\n";
	    }
	}
	
	# $buf.=X Labels
	
	$buf.=".nf\n.sp |\\n[grph]u+${ygrph}p+${topmarg}p+${tm}p\n.vs $grph{VS}->[0]p\n";
	
	foreach my $j (0..$lbrows)
	{
	    $buf.="\\m[$grph{TEXTCOLOUR}->[0]]\\c\n";
	    $buf.=".ta ";
	    my $tab=$xmarg;
	    my $tabln='';
	    my $divs=1;
	    my $nd=0;
	    
	    for (my $i=0; $i<scalar(@{$stats->{LABELS}}); $tab+=$divs*$xdiv, $i=$nd+1)
	    {
		#			next if $xskip != 1 and ($i+1) % $xskip != 1;
		$nd=$stats->{LABND}->[$i]->[$j];
		$nd=$i if $nd < 0;
		$divs=$nd-$i+1;
		$i=$nd;
		my $vals=$stats->{LABELS}->[$i];
		next if !defined($vals->[$j]) or $vals->[$j] eq '' or $vals->[$j] eq '.';
		$buf.="".($tab+($divs*$xdiv)/2)."pC ";
		$tabln.="\t$vals->[$j]";
	    }
	    
	    
	    $buf.="\n\\s'+${j}'$tabln\\s'-${j}'\n";
	}
	
	$buf.=".vs\n.fi\n.ta ".($xmarg+$lm-$pointsz*.2-$thickness/2)."pR\n";
	my $y=$stats->{YMIN};
	my $factor=0;
	my $pattern="%.*f";
	if ($grph{PDECIMALS}->[0] ne '')
	{
	    #		$pattern.='%%';
	    $factor=$grph{PDECIMALS}->[0];
	}
	else
	{
	    $factor=length($1) if ($stats->{YSTEP}=~m/\.(\d+)$/);
	}
	
	foreach my $j (0..$stats->{YSTEPS})
	{
	    $buf.=".sp |\\n[grph]u+".(${ygrph}-$ydiv*$j+$pointsz/4+$topmarg+${tm})."p\n\t".sprintf($pattern,$factor,$y)."\n";
	    $y+=$stats->{YSTEP};
	}
	
	$buf.="\\m[]\\D't ${thickness}p'\n";
	
	if (!$grph{KEYBOX}->[0])
	{
	    $buf.=".sp |\\n[grph]u+${pointsz}p+${tm}p\n.in +${xmarg}p+${lm}p+6p\n";
	    foreach my $i (0..scalar(@{$stats->{NAME}})-1)
	    {
		next if !defined($stats->{NAME}->[$i]);
		my $s=($i % 6)+1;
		if ($stats->{BAR}->[$i])
		{
		    $buf.="\\v'-".($pointsz*.4)."p'\\h'-${thick}p'\\Z!\\M[$grph{SCOLOURS}->[$i]]\\v'-${thick}p'\\D'P ${thick2}p 0 0 ${thick2}p -${thick2}p 0'!\\h'${thick2}p'\\v'".($pointsz*.4)."p'\\~$stats->{NAME}->[$i]\\0\\M[]\n";
		}
		else
		{
		    my $symsize=2;
		    $buf.="\\Z'\\D't 2p'\\m[$grph{SCOLOURS}->[$i]DK]'"; 
		    $buf.="\\v'-".($pointsz*.4)."p'\\D'l ".(${symsize}*4)."p 0p'\\Z'\\h'-".(${symsize}*2)."p'\\m[]\\*[series$s]'\\v'".($pointsz*.4)."p'\\~$stats->{NAME}->[$i]\\h'".(${symsize}*2)."p'\n";
		}
	    }
	}
	else
	{
	    my $marg=$symsize*4;
	    
	    my $boxlabels=join("\t",@{$grph{BOXLABELS}});
	    my $boxheads=join("\t",@{$grph{BOXHEADS}});
	    my $boxtabs=join(' ',@{$grph{BOXTABS}});
	    
	    $buf.=".fl\n.vs 0\n.sp |\\n[GRP:mk]u+$grph{BOXFRAME}->[1]p\n.in +$grph{BOXFRAME}->[0]p\n.ta $boxtabs\n.vs $grph{VS}->[0]p\n.in +(1m+4p)\n\\fB$boxheads\\fP\n.sp -.2\n.in -(1m+4p)\n";
	    
	    # 			$buf.=".in +".($fldk->{THICKNESS}->{LEFT}*.5)."p\n.sp -1v\n.sp $fldk->{INDENT}->{TOP}p\n.ll +$fldk->{POSITION}->{WIDTH}p\n";
	    foreach my $i (0..scalar(@{$stats->{NAME}})-1)
	    {
		next if !defined($stats->{NAME}->[$i]);
		my $s=($i % 6)+1;
		$buf.="\\v'-".($pointsz*.4)."p'\\D'l ".(${symsize}*4)."p 0p'\\Z'\\h'-".(${symsize}*2)."p'\\*[series$s]'\\v'".($pointsz*.4)."p'\\~\\c\n";
		$buf.=".in +${marg}p\n.sp -1\n$stats->{NAME}->[$i]\\h'".(${symsize}*2)."p'\n.in -${marg}p\n";
	    }
	}
    }
    
    $buf.=".fl\n.ev\n";
    ###	$srcur=undef;
    # 	outbuf($buf);
}

sub d2
{
    return sprintf("%.2f",$_[0]);
}

sub Swap
{
    my $v1=shift;
    my $v2=shift;
    
    my $t=$$v1;
    $$v1=$$v2;
    $$v2=$t;
}
