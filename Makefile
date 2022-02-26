###
# This Makefile can be used to make a scanner for the b language
# (Yylex.class) and to make a program that tests the scanner (P2.class).
#
# The default makes both the scanner and the test program.
#
# make clean removes all generated files.
#
# Note: P2.java will not compile unless Yylex.class exists.
#
###

# define the java compiler to be used and the flags
JC = javac
FLAGS = -g -cp $(CP)
CP = ./deps:.

P2.class: P2.java Yylex.class sym.class
	$(JC) $(FLAGS) P2.java

Yylex.class: minim.jlex.java ErrMsg.class sym.class
	$(JC) $(FLAGS) minim.jlex.java

minim.jlex.java: minim.jlex sym.class
	java -cp $(CP) JLex.Main minim.jlex

sym.class: sym.java
	$(JC) $(FLAGS) sym.java

ErrMsg.class: ErrMsg.java
	$(JC) $(FLAGS) ErrMsg.java

	
###
# testing - add more here to run your tester and compare its results
# to expected results
###
test:
	java -cp $(CP) P2 
	diff allTokens.in allTokens.out
	diff testCommentTokensType1.in testCommentTokensType1.out
	diff testCommentTokensType2.in testCommentTokensType2.out
	diff testReservedWordTokens1.in testReservedWordTokens1.out
	diff testOperatorTokens1.in testOperatorTokens1.out
	diff testIntLitTokens.in testIntLitTokens.out
	diff testStrLitTokens.in testStrLitTokens.out

###
# clean up
###

clean:
	rm -f *~ *.class minim.jlex.java

cleantest:
	rm -f allTokens.out
	rm -f testCommentTokensType1.out
	rm -f testCommentTokensType2.out
	rm -f testReservedWordTokens1.out
	rm -f testOperatorTokens1.out
	rm -f testIntLitTokens.out
	rm -f testStrLitTokens.out
