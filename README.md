# CompilerLab
1.ifelse=>
	 if a given "if" statement doesnt have a corresponding "else", add an empty "else{}" statement.
(i.e.),removing dangling else ambiguity
Execution:
	lex filename.l
	yacc filename.y
	gcc lex.yy.c y.tab.c 
	./a.out

2.loop conversion=>
	 convert the given "for" loop and "dowhile" loop to "while" loop such that its semantic meaning is maintained.
Execution:
	lex filename.l
	yacc filename.y
	gcc lex.yy.c y.tab.c 
	./a.out
	
3.3addarithmetic=>
	generates 3 address code for arithmetic expressions
Execution:
	lex filename.l
	yacc filename.y
	gcc lex.yy.c y.tab.c 
	./a.out
	
4.final3dcodegen=>
	creates three address statements for any kind of c statements,including array reference of any dimension).
Execution:
	lex filename.l
	bison -d filename.y
	g++ lex.yy.c filename.tab.c -ll
	./a.out<inputfilename.txt
	
5.SyntaxTree=>
	creates a syntax tree for given arithmetic expression.
Execution:
	lex filename.l
	yacc filename.y
	gcc lex.yy.c y.tab.c 
	./a.out<input.txt
	
6.Boolean=>
	for a given set of boolean expressions,backpatches by creating  true list,false list and labels.
Execution:
	lex filename.l
	bison -d filename.y
	g++ lex.yy.c filename.tab.c -ll
	./a.out<inputfilename.txt
	
7.Block=>
	generation of three address statements for the given c code,finds the leaders and generates the blocks,removes copy propagation, constant folding and common sub expression and generates dag .
	
8.SymbolTable=>
	generates symbol table for given set of declaration statements, it .
Execution:
	lex filename.l
	bison -d filename.y
	g++ lex.yy.c filename.tab.c -ll
	./a.out<inputfilename.txt
	
9.LabelTree=>
	given an arithmetic expression ,generates its postfix expression,assignes labels for the operators and generates the corresponding Assembly code
Execution:
	lex filename.l
	bison -d filename.y
	g++ lex.yy.c y.tab.c -ll
	./a.out<inputfilename.txt

