# TODO: area volume
$ zzmat		fat		5			#=> 120
$ zzmat	-p3	sen		60g			#=> 0.866
$ zzmat		cos		60g			#=> 0.5
$ zzmat	-p5	tan		30g			#=> 0.57735
$ zzmat		sec		30g			#=> 1.154701
$ zzmat		csc		45g			#=> 1.414215
$ zzmat		cot		45g			#=> 1

$ zzmat	mmc		8	12		#=> 24
$ zzmat	mdc		8	12		#=> 4

$ zzmat	media		3[2]	6[3]		#=> 4.8
$ zzmat	soma		2[4]	3[6]		#=> 26

$ zzmat	arranjo		6	2		#=> 30
$ zzmat	arranjo_r	5	3		#=> 125
$ zzmat	combinacao	6	2		#=> 15
$ zzmat	combinacao_r	5	3		#=> 35

$ zzmat	d2p		4.3,5.1	9,12		#=> 8.348653
$ zzmat	egr		1,2	6,3		#=> -x+5y-9=0
$ zzmat	err		6,3	1,2		#=> y=0.2x+1.8
$ zzmat	egc		7,8	1,1		#=> x^2+y^2-14x-16y+28=0
$ zzmat	egc		1,1	5		#=> x^2+y^2-2x-2y-23=0
$ zzmat	ege		1,2,3	4		#=> x^2+y^2+z^2-2x-4y-6z-2=0
$ zzmat	ege		1,2,3	-1,-2,-3	#=> x^2+y^2+z^2-2x-4y-6z-42=0

$ zzmat	ln		8			#=> 2.079442
$ zzmat	log		8	2		#=> 3
$ zzmat	raiz		3	100		#=> 4.641589
$ zzmat	elevado		3	3.3		#=> 37.540508

$ zzmat	fib		9			#=> 34
$ zzmat	fib		9	s		#=> 0 1 1 2 3 5 8 13 21 34
$ zzmat	trib		9			#=> 44
$ zzmat	trib		9	s		#=> 0 0 1 1 2 4 7 13 24 44
$ zzmat	lucas		9			#=> 76
$ zzmat	lucas		9	s		#=> 2 1 3 4 7 11 18 29 47 76
$ zzmat collatz		3			#=> 3 10 5 16 8 4 2 1
$ zzmat collatz		13			#=> 13 40 20 10 5 16 8 4 2 1
$ zzmat collatz		30			#=> 30 15 46 23 70 35 106 53 160 80 40 20 10 5 16 8 4 2 1
$ zzmat collatz		33			#=> 33 100 50 25 76 38 19 58 29 88 44 22 11 34 17 52 26 13 40 20 10 5 16 8 4 2 1
$ zzmat collatz		300			#=> 300 150 75 226 113 340 170 85 256 128 64 32 16 8 4 2 1
$ zzmat collatz		1300			#=> 1300 650 325 976 488 244 122 61 184 92 46 23 70 35 106 53 160 80 40 20 10 5 16 8 4 2 1

$ zzmat	somatoria	5	2	x^3+2	#=> 232
$ zzmat	produtoria	3	7	x^2+5	#=> 19527480

$ zzmat	pa		7	2	6	#=> 7 9 11 13 15 17
$ zzmat	pa2		7	2	6	#=> 7 9 13 19 27 37
$ zzmat	pg		2	7	6	#=> 2 14 98 686 4802 33614

$ zzmat	eq2g		1	3	0
X1: -3
X2: 0
Vertice: (-1.5, -2.25)
$ zzmat	egc3p		1,1	7,8	4,5
x^2+y^2-57x+33y+22=0
Centro: (28.5, -16.5)
$

$ zzmat	asen		0.5	g			#=> 30
$ zzmat	acos		0.5	g			#=> 60
$ zzmat	atan		2	rad	r2		#=> -2.034444

$ zzmat	-p4	vetor	2,45g,45g	4,-60g,-30g	g
5.5912, 90g, 29.2505g
$

$ zzmat	conf_eq	'x^2+3*(y-1)-2z+5'	7,6.8,9	3,2,5.1
53.4
6.8
$

$ zzmat	area	triangulo	3	4		#=> 6
$ zzmat	area	quadrado	2			#=> 4
$ zzmat	area	esfera		2			#=> 50.265482
$ zzmat	area	icosidodecaedro	truncado	2	#=> 433.767968

$ zzmat	volume	cubo		snub	3		#=> 213.01589
$ zzmat	volume	cilindro	2	5		#=> 62.831853
$ zzmat	volume	icosidodecaedro	truncado	1	#=> 201.803399
$ zzmat	volume	rombicosidodecaedro	3		#=> 1123.613742

$ zzmat	det	1	2	3	4		#=> -2
$ zzmat	det	9	2	4	6		#=> 46

$ zzmat	area	trapezio	7	3	4	#=> 20

$ zzmat	newton	3	-	x	y
(x)^3
- 3 * (x)^2 * (y)
+ 3 * (x) * (y)^2
- (y)^3
$
