parser: y.tab.c lex.yy.c
	gcc -o parser y.tab.c
y.tab.c: CS315s21_team02.y
	yacc CS315s21_team02.y
lex.yy.c: CS315s21_team02.l
	lex CS315s21_team02.l
clean:
	rm -f lex.yy.c y.tab.c parser

run:
	./parser