# Reconstruction caveats

The supplied script is not safe to execute. It fetches and `loadstring`s remote UI code,
installs executor hooks and can POST to `127.0.0.1:43594/rpc`. No code from the
attachment was executed during this reconstruction.

11,771 encrypted references were statically decoded. 100 decoded byte strings are not valid UTF-8 and 9 contain NUL bytes.
These entries are retained as byte-preserving Luau decimal escapes, **not** guessed
replacement text. Some visibly corrupt strings affect behavior (for example, the
`string.split` fallback assignment and injected UI-library source). Consequently
the output passes a syntax check but is **not claimed to run correctly**.

Names in `tools/function_names.py` were inferred from behavior. Single-character
top-level function names are documented at their declarations rather than renamed
across shadowing inner scopes.

## References yielding non-UTF-8 bytes

| Table index | Key | Bytes | First 80 bytes (Python repr) |
|---:|---:|---:|---|
| 48752 | 301730660633 | 5 | `b'\x87\x99\x9d<S'` |
| 50561 | 901970658120 | 412 | `b'function Library:AddTooltip(\xb4\x04Zt\xfa\x9a\x8c\x93y\xcc\xcd\x9b\x9b\xde\xeb\x0fB\x9d\x83V[\xb7\x98t\xd2\xa8\x84t\xa3\xed\x1e\x1b\xa4r\xa7x \xff\xd8\xa1d\xe0Dk\xb8\xa8\x98p\xf2\xb7\xe63'` |
| 50367 | 26187214774084 | 368 | `b'local BoundsOk, Bounds = pcall(function() return TextService:GetTextBoundsAsync('` |
| 48098 | 34528295812508 | 8 | `b'\x8e\x01*\xac\x1fpW\xde'` |
| 52724 | 2410623961285 | 13 | `b'Disc2\xc2\x9c*\xbbZA\x831'` |
| 53942 | 34478902181230 | 148 | `b"We don't hav\x1a\x86\x0fc/Pv-A\xe8;q\xd7\xfb\xc2;\xcf\xb9\xeb\xee\xc4?\xe0;f;\xfb\x85\x11\t\xa4\xc7K\x1b\xe0\x88\x1eV\xc6\xb5Wom\x1aD~\xa4\x93Q\xfa\x1a3 0\x14#>\xc2\xae\xb8\x0f\xee>\xbcTf-\xe1"` |
| 53336 | 3587480915213 | 6 | `b'P\x15\xd2\xb8K\x88'` |
| 53651 | 32022105912446 | 25 | `b'cheesy/data/userB\x8d,8\xfd\xde@\x8e\x8d'` |
| 51962 | 13170919157738 | 5 | `b'A\x06\x07\xb0\x98'` |
| 49519 | 13444731678953 | 6 | `b'8\x19\xff\xb6\xbeG'` |
| 45754 | 23849607485123 | 7 | `b'^\x8f\x8aD\xecr9'` |
| 43355 | 11241346214117 | 10 | `b'LatestRo\xf4&'` |
| 45677 | 12541687246240 | 16 | `b'Huma\x89=B\xeb\xfd\x8f:yUfw9'` |
| 46568 | 19145400993190 | 14 | `b'SubfloorsFooe\xdb'` |
| 44408 | 12897106636523 | 7 | `b"'\n\xff\xae\x85k\x04"` |
| 43341 | 3779686567360 | 8 | `b'Does\xd0\xc1zx'` |
| 54919 | 4956543521288 | 102 | `b'\xd1\x0c\xb7\xbd\xec\xf1V\xf8\t\xf4\xcc\xa1\xc6\xab\xc2m\xaf[\x1f\x9d\x7f\xe5\xcb\x02\xc0&#124;\x93\xd9?\x8b\xa58a\xbf\x024\x1e\xd1eAK\x0e\x0ec\xee\x7f\xb4\x95b\xcbr\x94D\x7f\xb5\x06\x1bx\x1du\xe21~\xfa\x1b\x88\xd0a\x16\x93-\xee\xc9\xdc0\xcd\x847\x96\xe2'` |
| 45536 | 31242545557928 | 13 | `b'H\x0bz\xad\xc6=4\xe1\xee\xe5\xef\xf5\x0f'` |
| 46800 | 11886684744510 | 12322 | `b'.............                                            \n                      '` |
| 49679 | 2766043351568 | 4 | `b'\x04\x8adG'` |
| 45493 | 18099544539608 | 5 | `b'\x1e\x06\x94\xc2\xd2'` |
| 44193 | 27956795303348 | 7 | `b'{\x8bA,\xa8\x83\x97'` |
| 50201 | 1396980745493 | 49 | `b'*\x8e\x86B\xd4\x88\xa4\xb3\x07\xfb\xf8\x93g`b$\x9d\x108\x1d\x08\x8c\x00\x80\x08\xad\x16\x16\xa9\xa4R\xdb6\xe1\x07A\x95\\2\xfa\xc3\xb9\xe0\xd2]\xcf\x7f?`'` |
| 51218 | 5230356042503 | 6 | `b'\xd6\x07\xb4\xb4\x054'` |
| 46633 | 16717596638417 | 13 | `b'Generato\xcc\xfe\xeb\xa8c'` |
| 45207 | 9611356381943 | 7 | `b'\xdf\x06T\x96\x06#\xe0'` |
| 49421 | 26779938349420 | 6 | `b'Hand\xfe\xb1'` |
| 51975 | 28455026714500 | 25 | `b'MaxActivatio\xec*\x1b\xe8\xeeq\xef\xaf\xb1\xab\x9bx\x8b'` |
| 49854 | 1959638632225 | 22 | `b'Anti Seek Obstructio\xd86'` |
| 45050 | 24384347232437 | 11 | `b'SeekBrid\x9f\x9c\xc1'` |
| 48371 | 12815499767455 | 8 | `b'Base\\/E\xfb'` |
| 45324 | 25492482612413 | 8 | `b'\xf9\x91y4\xb9\t\xbav'` |
| 47400 | 30968733036713 | 6 | `b'O\nr\xbd\xb1D'` |
| 51044 | 24931972274867 | 12 | `b'Transpar\x7f\xa5\xa5-'` |
| 44858 | 30134410177952 | 11 | `b'Attachme\xec)~'` |
| 48964 | 8229408480752 | 15 | `b'Exploits\x08\x7f\x13&\t\x83u'` |
| 47128 | 31708563731290 | 8 | `b"Expl\xf4\xb4'u"` |
| 48583 | 25479597317297 | 51 | `b'Displays\x1c\xab\x9e\x19\x97\x8eZ\xb1\xb1\xa4\xad\x93\x0c@\xd6\xf3\x80{\x0f\n\xba\xb8.u\x99\xf6}S\xad\t\xdcm\x8dX\xear\xb5"\xc1\xba\xb0L/'` |
| 50167 | 8982124470445 | 19 | `b'ExplL8\x9c\xfcn0\nytrf\x99\x82\x80i'` |
| 48904 | 14498104554686 | 27 | `b'HotelEnabledInst&#124;\x1e/\xa6\xcfj\xc6\x1d\x0c\x0e\x1f'` |
| 54117 | 27085964108425 | 22 | `b'HotelPrevGod5V4\xdb(\xc5~5<1'` |
| 53048 | 6325606127363 | 14 | `b'\x92\x15\x9e\xb4\x83\xd3\xb9\xf8\xf8\x05\xe0\xfb\xf3\x1b'` |
| 46102 | 34446688943440 | 11 | `b'Hote\xdc\x1df\xd3\xf8\x7f\xa0'` |
| 53863 | 5777981084933 | 10 | `b'\xb3\xf8{\x94"\xe3{NSa'` |
| 50750 | 15635231848673 | 5 | `b'\xa4\x07\xcb\xc4\xb5'` |
| 47662 | 26758462857560 | 27 | `b'RoomsAutoWalkSpoofFootst\xaaWv'` |
| 53186 | 12026275441600 | 15 | `b'DescendantAd\xe2\xce\x00'` |
| 54641 | 30162328317370 | 21 | `b'MaxActivationDistanc\xcc'` |
| 43947 | 1123168224278 | 7 | `b'+\x8e\x854\xb3\x9f\x8d'` |
| 46545 | 16375062543250 | 9 | `b'Anti=\xbchiI'` |
| 49730 | 28491535050662 | 22 | `b'Assembly$\x1e\xe0\x96\xb4l\xc0"), v\xf7\x93'` |
| 43832 | 30694920515498 | 13 | `b'j\x06\x7f\xac\x84`\xe8qbmmBm'` |
| 50731 | 22754357400263 | 8 | `b'\x9a\x92\xb44{\xa9\xd6q'` |
| 54390 | 5504168563718 | 11 | `b'\xbc\x14\xb0\xb4)\x00\x83\xfc\xfa\xfd\x01'` |
| 43992 | 27122472444587 | 10 | `b'GrumbleR\x0c\x9f'` |
| 44699 | 25443088981135 | 16 | `b'Wardrobe-FOOn:&\xac'` |
| 47813 | 1315373876425 | 6 | `b'Parem\xc4'` |
| 51136 | 14490588132535 | 19 | `b'Transparency<\xd7\xc7\\\x14&\xad'` |
| 54417 | 8160686906800 | 19 | `b'Elec~A\xa3\xec\x11\x8c\x9al\x80Vi+$\xf4\x13'` |
| 45136 | 24123420006338 | 16 | `b'L\x92\x929\x12YEkw#FD;kF\x0c'` |
| 53158 | 14813794285028 | 14 | `b'\xbe\x0e\xd6\xc2e\xd3\xa8\x81Uxl\xa4\x96\xb1'` |
| 44782 | 15348534032342 | 14 | `b'Toolshed\x04\x0b\x01\x96\xccf'` |
| 46533 | 1110282929162 | 14 | `b'GloombatN\x8f\xc5\x1b\xe1('` |
| 52943 | 17744125149325 | 10 | `b'FlyK\xe4\xc5)s\xfb\xdb'` |
| 52433 | 20824784456642 | 11 | `b'RemoveSul\x9f\x01'` |
| 48390 | 29860597656737 | 20 | `b"HotelPat\xf5\x1b\xbd\x9fU\xfdG'\x1f)/\x0e"` |
| 45275 | 31790170600358 | 6 | `b'\x1e\x15n\xaf\x14#'` |
| 52420 | 21303687925120 | 10 | `b'Chil!\x8c\xfaf\x85\x00'` |
| 51142 | 15827437500820 | 10 | `b'Clie\xd5B\xe0\xf7\x8d\xce'` |
| 54233 | 5765095789817 | 24 | `b'ScrapDro\xa0\xadO \xd6$\xa3<B\x1a4\x08\xf9l\x82\xee'` |
| 53038 | 29039160093092 | 16 | `b'RoomsNod\x1f(\xac\xa0\xfe>\xfd\xae'` |
| 54387 | 6243999258295 | 19 | `b'Hote^\x90X&#124;\xbfd\x87qpFhy\xb1\x17\x8e'` |
| 48419 | 6051793606148 | 13 | `b'\x9a\r\x95\xbdk\xd3\xa2{Pyv\xaa\x95'` |
| 53649 | 3574595620097 | 17 | `b'Humanoid\xfa\xb0y.\xf1\x7f\xf4\xbb\xb0'` |
| 52351 | 27053750870635 | 11 | `b'Prim\xe4\xbe\x93T\x1e\xc0\xa6'` |
| 52593 | 15361419327458 | 8 | `b'\xa1\x0f\xd8\xc3\x91\xdf\xcb\xee'` |
| 52532 | 14539981763813 | 8 | `b'\xdc\x15\xe6\xbc\x16\x19\x8a}'` |
| 50126 | 24397232527553 | 7 | `b'<\x84\x81/+Ri'` |
| 43980 | 31229660262812 | 16 | `b'AutoSolv\xa7\xf6\xa4\x94\xf9\xc9\xc8-'` |
| 45175 | 10351187076520 | 16 | `b'Auto\xe5>v\xff\x13\xe0z\xe8\xed\xf4\xf7\xb8'` |
| 50979 | 28504420345778 | 14 | `b'f\x8b5>\x03Z\xcb]A_kC\xbb\xe3'` |
| 53637 | 7681783438322 | 14 | `b'Visuals_\n\x9c+\x1e\xdb\x9e'` |
| 54473 | 4408918478858 | 12 | `b'\x00\x15\xb8\xc4\xa4V\x06r\x81x\x7fS'` |
| 54740 | 1862998918855 | 19 | `b'ESP )\xb9\xabr\xc1x\x14r~*Vs9\x8f\x1e'` |
| 47368 | 11788971256547 | 21 | `b'DisableF\xd0+G\x9a$83\x0c--,\xdaE'` |
| 44996 | 29244251040355 | 14 | `b'Remo\x7f\xaf4j,BU\xe8\xdf\xec'` |
| 46343 | 29325857909423 | 21 | `b"9\x8b\x15@m.\x03\xe4\xeb\xce\xe5\xb5\x15p'\xfb\x0eRZ\x13\x0f"` |
| 47729 | 18086659244492 | 28 | `b'Eyes has/+\xc8\x96\x15\xc8I&\xee\xe2.\x11\xb4\xe9\xe5s1O\xbf3'` |
| 53090 | 28970438519140 | 9 | `b'AR0xg\x8eEW\xe4'` |
| 53104 | 24671045048768 | 10 | `b'3\x98\x8a33?\x84\xec\xf1\xea'` |
| 54658 | 7968481254653 | 16 | `b'?\x08p\xb48\x948\x02\xf2\x02\xf2\xb0\x9b.\xa2\x9f'` |
| 54724 | 2492230830353 | 5 | `b'\xe8\x98c5V'` |
| 49754 | 23494188094840 | 10 | `b'UI L\xae\xad\xd8c\x90\x94'` |
| 45750 | 31466964447865 | 62 | `b'The language\xf9V\xd9\xd8B\xc5\xf8\xebB47w\xee\xb52C\xd3\xcd\x99<nX\x88\xf4\xa3\x1c\x00\x93\x1eZ\xba\x00\x8e\xa6\xd6\xc5/\xf2{\xae\x05\x00\xc5\x80\xe6\\-\xe7ui'` |
| 50337 | 32063983121573 | 59 | `b' \x07"\xaf8\x05qsrcq\x0efbe4\xd0\\"}\xf6a\xa0o\x07\x08\x9f\xb8\xf6d*\xcf~\x14\x17H\xea\xdb\x89\x92\x8c\x9cLU\x16\xdf\x88\xa8+\x17\xb6\xd7\r\xc3\x9d\xcf\x96\x92\xe9'` |
| 53325 | 16759473847544 | 419 | `b'PLEASE READ: This script is ONLY made by one person, and the official discord se'` |
| 44351 | 33077626337365 | 11 | `b'Text\x91\xbd\xf6r\xe7T\xa0'` |
| 49174 | 21947952680920 | 22 | `b'BackgroundTransparen\x8a8'` |
| 45869 | 14266169242598 | 6 | `b'\xdc\x0b\xeb\xc3\x16#'` |
| 48680 | 10077374555305 | 14 | `b'Bypa\x14B]\xf8\xfc$ajsy'` |
