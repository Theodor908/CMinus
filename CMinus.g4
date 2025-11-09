grammar CMinus;

program : declarationList;

declarationList : declarationList declaration
                | declaration
                ;
declaration : varDeclaration
            | funDeclaration
            ;
varDeclaration : typeSpecifier ID SEMI
                | typeSpecifier ID LBRACKET NUM RBRACKET SEMI
                ;

typeSpecifier : INT
              | VOID
              ;

funDeclaration : typeSpecifier ID LPAREN params RPAREN compoundStmt
               ;

params : paramList
       | VOID
       ;

paramList : paramList COMMA param
          | param
          ;

param : typeSpecifier ID
      | typeSpecifier ID LBRACKET RBRACKET
      ;

compoundStmt : LCURLY localDeclarations statementList RCURLY;

localDeclarations : localDeclarations varDeclaration
                  |
                  ;


statementList : statementList statement
              |
              ;

statement : expressionStmt
          | compoundStmt
          | selectionStmt
          | iterationStmt
          | returnStmt
          ;

expressionStmt : expression SEMI
               | SEMI
               ;

selectionStmt : IF LPAREN expression RPAREN statement
              | IF LPAREN expression RPAREN statement ELSE statement
              ;

iterationStmt : WHILE LPAREN expression RPAREN statement
              ;

returnStmt : RETURN SEMI
           | RETURN expression SEMI
           ;

expression : var ASSIGN expression
           | simpleExpression
           ;

var : ID
    | ID LBRACKET expression RBRACKET
    ;

simpleExpression : additiveExpression relop additiveExpression
                 | additiveExpression
                 ;

relop   : LE
        | LT
        | GT
        | GE
        | EQ
        | NE
        ;

additiveExpression  : additiveExpression addop term
                    | term
                    ;

addop : PLUS
      | MINUS
      ;

term : term mulop factor
     | factor
     ;

mulop  : TIMES
       | DIV
       ;

factor  : LPAREN expression RPAREN
        | var
        | call
        | NUM
        ;

call : ID LPAREN args RPAREN
     ;

args : argList
     |
     ;

argList : argList  COMMA expression
        | expression
        ;


ELSE :  'else';
IF : 'if';
INT: 'int';
RETURN : 'return';
VOID : 'void';
WHILE : 'while';


PLUS :  '+';
MINUS : '-';
TIMES : '*';
DIV : '/';
LE : '<=';
LT : '<';
GT : '>';
GE : '>=';
EQ : '==';
NE : '!=';
ASSIGN : '=';
SEMI : ';';
COMMA : ',';
LPAREN : '(';
RPAREN : ')';
LBRACKET : '[';
RBRACKET : ']';
LCURLY : '{';
RCURLY : '}';


ID : LETTER (LETTER | DIGIT | '_')*;
NUM : DIGIT+;

fragment LETTER : 'a'..'z' | 'A'..'Z';
fragment DIGIT : '0'..'9';

WS : [ \t\r\n]+ -> skip;
COMMENT : '/*' .*? '*/' -> skip;

