# Preparativos
$ sed 's/:/♦/g' _dados.txt > _tmp1
$ echo 'abcdefghijklmnopqrstuvwxyz0123456789€®ŧ←↓→øþæßðđŋħł»©“”nµ·§¬¹²³£¢' > _tmp2
$ echo 'abcde:fghij:klmno:pqrst:uvwxy:z0123:45678:9€®ŧ←:↓→øþæ:ßðđŋħ:ł»©“”:nµ·§¬:¹²³£¢' > _tmp3
$

$ zzcut		-c7,3	_dados.txt
nu
:d
:t
rq
oc
$ zzcut	-v	-c7,3	_dados.txt
1:m:oe
2:oistwo
3:resthree
4:uato:four
5:inc:five
$ zzcut	-d:	-f1,3	_dados.txt
1:one
2:two
3:three
4:four
5:five
$ zzcut	-v	-d:	-f1,3	_dados.txt
um
dois
tres
quatro
cinco
$ zzcut	-d:	-f	-2	_dados.txt
1:um
2:dois
3:tres
4:quatro
5:cinco
$ zzcut	-v	-d:	-f	-2	_dados.txt
one
two
three
four
five
$ zzcut		-c-5	_tmp1
1♦um♦
2♦doi
3♦tre
4♦qua
5♦cin
$ zzcut	-c	7-	_tmp1
ne
♦two
♦three
ro♦four
o♦five
$ zzcut	-v	-c	-5	_tmp1
one
s♦two
s♦three
tro♦four
co♦five
$ zzcut	-d	♦	-f1,3	_tmp1
1♦one
2♦two
3♦three
4♦four
5♦five
$ zzcut	-v	-d♦	-f	1,3	_tmp1
um
dois
tres
quatro
cinco
$ zzcut	-c	~2	_dados.txt
:moe
:osto
:rstre
:utofu
:ic:ie
$ zzcut	-c	1~3	_tmp1
1mne
2o♦o
3r♦r
4urfr
5ioi
$ zzcut	-v	-c	1~3	_tmp1
♦u♦oe
♦distw
♦testhee
♦qato♦ou
♦cnc♦fve
$ zzcut	-c	30-45,15-10,75-,-8	_tmp2
3456789€®ŧ←↓→øþæonmlkjabcdefgh
$ zzcut	-v	-c	10-55,15-10,62-,-2	_tmp2
cdefghinµ·§¬¹
$ zzcut	-d:	-f5-3	_tmp3
uvwxy:pqrst:klmno
$ zzcut	-d:	-f-3,12-	_tmp3
abcde:fghij:klmno:nµ·§¬:¹²³£¢
$ zzcut	-d:	-f	-3,6,7,12-	--od	zzz	_tmp3
abcdezzzfghijzzzklmnozzzz0123zzz45678zzznµ·§¬zzz¹²³£¢
$ zzcut	-v	-d:	-f-3,5-8,12-	_tmp3
pqrst:↓→øþæ:ßðđŋħ:ł»©“”
$ zzcut	-c	35-45,d,12-18,d,50-60	--od	.oOo.	_tmp2
89€®ŧ←↓→øþæ.oOo.lmnopqr.oOo.ħł»©“”nµ·§¬
$ zzcut	-c	1,d,10-12,d,40-50	--od	";"	_tmp2
a;jkl;←↓→øþæßðđŋħ
$ zzcut	--od:	-c 2-5,d,10-12,d,40-50	_tmp2
bcde:jkl:←↓→øþæßðđŋħ
$ zzcut	-c	d,60-,d,15-25,d,-7,d --od _	_tmp2
_¬¹²³£¢_opqrstuvwxy_abcdefg_
$ echo "abcde12345" | zzcut -c 1-5,5-1,10-6,6-10
abcdeedcba5432112345
$

# Faxina
$ rm -f _tmp[123]
$
