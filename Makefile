a1: a1.l a1.y
	bison -d a1.y
	flex a1.l
	g++ -o $@ a1.tab.c lex.yy.c -lfl
