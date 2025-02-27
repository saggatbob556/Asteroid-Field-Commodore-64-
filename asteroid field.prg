1 PRINT "{rvon}{clr}{lgrn}ASTEROID FIELD"
2 PRINT "{rvof}{white}AVOIDE ASTEROIDS WITH A AND D KEYS"
3 poke 53280,0: poke 53281,0: rem sets background and border to black
4 gosub 65: goto 8
5 PRINT "{rvon}{clr}{lgrn}ASTEROID FIELD"
6 PRINT "{rvof}{white}AVOIDE ASTEROIDS WITH A AND D KEYS"
7 gosub 65: goto 19: rem setup
8 poke 53285,12: poke 53286,3: poke 53269,255: rem sets global sprite settings
9 for x=12800 to 12800+255: read y: poke x,y: next x: rem sets location of sprite data
10 :: rem sprite_0
11 poke 53287,14: poke 2040,200: poke 53248, 174: poke 53249, 200
12 :: rem sprite_1
13 poke 53288,11: poke 2041,201: poke 53250, 92: poke 53251, 20
14 :: rem sprite_2
15 poke 53289,11: poke 2042,202: poke 53252, 92: poke 53253, 20
16 :: rem sprite_3
17 poke 53290,11: poke 2043,203: poke 53254, 188: poke 53255, 120: poke 53276, 15: poke 53277, 0: poke 53271, 0

18 :: rem main loop
19 x=174: s=0: n=0: sp=5: q=230: w=23: e=250: v=18: b=15: l=70: h=10:rem sets starting variables
20 gosub 27
21 y1=20: y3=20: y5=20: poke 53251,y1: poke 53253,y3: poke 53255,y5: poke 53248,x: rem sets y positions of asteroid sprites
22 gosub 32
24 n=n+p: s=n*50: poke 53248,x: rem score and asteroid number increment
25 goto 20

26 :: rem pick random ast pos subroutine
27 if n>4 then r2=rnd(1)*q+w: p=int(rnd(1)*3+1): if p=4 then p=3
28 r=rnd(1)*q+w: if n<4 then p=1
29 poke 53250,r: poke 53252,r2: if n>6 then r3=rnd(1)*q+w: poke 53254,r3: poke 53248,x
30 return

31 :: rem drop subroutine
32 if peek(53251)+sp>e then return: rem returns to main loop once the asteroid hits the lower part of the screen
33 if peek(D01E)and 3=3 then goto 42: rem 
34 if sp<l then sp=(n/l)+sp: poke 53248,x: if sp>l then s=s+e+e: goto 49
35 if n>4 and p>1 then y3=y3+sp: if n>6 and p>2 then y5=y5+sp
36 get k$
37 if k$<>="" and k$="A" and x-h>w then x=x-h: poke 53248,x: 
38 if k$<>="" and k$="D" and x+h<q+w+h then x=x+h: poke 53248,x: 
39 y1=y1+sp
40 poke 53251,y1: poke 53253,y3: poke 53255,y5
41 goto 32

42 x0=peek(53248): x1=peek(53250): x2=peek(53252): x3=peek(53254): poke 53248,x:rem collision checking subroutine
43 y0=peek(53249): y2=peek(53251): y4=peek(53253): y6=peek(53255): c=0
44 if x0+v<x1 or x0>x1+v or y0+b<y2 or y0>y2+b then c=c+1: rem no collision
45 if x0+v<x2 or x0>x2+v or y0+b<y4 or y0>y4+b then c=c+1
46 if x0+v<x3 or x0>x3+v or y0+b<y6 or y0>y6+b then c=c+1
47 if c=3 then goto 34
48 goto 49 :rem collsion

49 print "": print "": print "":rem game over section
50 print tab(14): print "{rvon}{red}GAME OVER": print ""
51 if s<500 then gosub 59
52 if s=<1500 and s>500 then gosub 61
53 if s>1500 then gosub 64
54 print "": print tab(14): print "{cyn}Score:";s
56 print "": PRINT TAB(14) "PLAY AGAIN?": print tab(12) "(YES-1   NO-2)";
57 INPUT W: if w=1 then goto 5
58 end
59 print tab(14): print "{red}You SUCK": print tab(14): print "{red}TRY HARDER"
60 return
61 print tab(14): print "{yel}EH DECENT"
62return
63 print tab(14): print "{cyn}GOOD JOB!"
64 return
65

100 :: rem sprite_0 / multicolor / color: 14
101 data 0,20,0,0,20,0,0,85,0,0,125,0,1,215,64,1
102 data 85,64,1,85,64,5,85,80,21,105,84,101,105,89,101,105
103 data 89,21,105,84,5,85,80,1,85,64,1,85,64,1,85,64
104 data 0,85,0,0,20,0,0,105,0,1,85,64,1,85,64,142
105 :: rem sprite_1 / multicolor / color: 11
106 data 0,0,0,0,0,0,0,0,0,0,5,0,0,86,64,1
107 data 85,80,5,101,84,22,85,101,25,86,85,101,85,149,85,154
108 data 89,85,101,84,105,85,148,21,86,80,5,165,64,1,89,0
109 data 1,84,0,0,80,0,0,0,0,0,0,0,0,0,0,139
110 :: rem sprite_2 / multicolor / color: 11
111 data 0,0,0,0,0,0,0,0,0,0,5,0,0,86,64,1
112 data 85,80,5,101,84,22,85,101,25,86,85,101,85,149,85,154
113 data 89,85,101,84,105,85,148,21,86,80,5,165,64,1,89,0
114 data 1,84,0,0,80,0,0,0,0,0,0,0,0,0,0,139
115 :: rem sprite_3 / multicolor / color: 11
116 data 0,0,0,0,0,0,0,0,0,0,5,0,0,86,64,1
117 data 85,80,5,101,84,22,85,101,25,86,85,101,85,149,85,154
118 data 89,85,101,84,105,85,148,21,86,80,5,165,64,1,89,0
119 data 1,84,0,0,80,0,0,0,0,0,0,0,0,0,0,139