%{
#include <stdio.h>
void yyerror(char *);
%}

print(print)
space   [ \t]
newLine [\n]
sign[-+]
letter[a-zA-Z]
digit[0-9]

int {digit}+
double {digit}*(\.)?{digit}+
char (\'[^\"\n]\')
string (\"[^\"\n]*\")
boolean false|true

comment (\<<[^\"\n]*)
symbol \!| \^ | \+ | \% | \& | \/ | \( | \) | \= | \* | \- | \£ | \#  | \$ | \½  | \[| \]  | \_ | \\  | \< | \> | \: | \.
var ([\_]?{letter}|{digit})+ 


%option yylineno
%%
xox return PROGRAM_BEGIN;
oxo return PROGRAM_END;


int return INTEGER_TYPE;
string return STRING_TYPE;
char return CHAR_TYPE;
double return DOUBLE_TYPE;
boolean return BOOLEAN_TYPE;


sqrt return SQRT;
pow return POW;
random return RANDOM;


\= return ASSIGNMENT;
\+ return PLUS;
\- return MINUS;
\* return MULTIPLICATION;
\/ return DIVISION;
\?= return EQUAL_CHECK;
\<  return SMALLER;
\<= return SMALLER_OR_EQUAL;
\>  return GREATER;
\>= return GREATER_OR_EQUAL;
\!= return NOT_EQUAL;




\( return LEFT_PARENTHESES;
\) return RIGHT_PARENTHESES;
\; return SEMI_COLON;
\{ return LEFT_BRACE;
\} return RIGHT_BRACE;
\[ return LEFT_SB;
\] return RIGHT_SB;
\. return DOT;
\: return COLON;
\, return COMMA;
{space}   ; 
{newLine} ;
 


OR return OR_OP;
AND return AND_OP;
NOR  return NOR_OP;
XOR return XOR_OP;
NAND return NAND_OP;

if   return IF;
else  return ELSE;
for   return FOR;
do return DO;
while return WHILE;
switch return SWITCH;
case return CASE;
free return FREE;
break return BREAK;
default return DEFAULT;

answer return ANSWER;
{int}  return INTEGER;
{string}   return STRING;
{char} return CHAR;
{double}   return DOUBLE;
{boolean} return BOOLEAN;

weapon return WEAPON;
index return INDEX;
weight return WEIGHT;
damage return DAMAGE;
price return PRICE;
durability return DURABILITY;

food return FOOD;
energy return ENERGY;

chest return CHEST;
inside return INSIDE;


jump_height return JUMP_HEIGHT;
movement_speed return MOVEMENT_SPEED;
body_part_damage return BODY_PART_DAMAGE;
check_collision return CHECK_COLLISION;
gravity return GRAVITY;
print_body_part_information return PRINT_BODY_PART_INFORMATION;
print_movement_speed return PRINT_MOVEMENT_SPEED;
print_gravity return PRINT_GRAVITY;



door_close return CLOSE_DOOR;
door_open return OPEN_DOOR;
chest_open return OPEN_CHEST;
buy_food return BUY_FOOD;
buy_tool return BUY_TOOLS;
eat_food return EAT_FOOD;
open_map return OPEN_MAP;
print_strength return PRINT_STRENGTH;
fight return FIGHT;
change_wealth return CHANGE_WEALTH;
print_wealth return PRINT_WEALTH;
print_own_status return PRINT_OWN_STATUS;
equip return EQUIP;
move_up return MOVE_UP;
move_down return MOVE_DOWN;
move_left return MOVE_LEFT;
move_right return MOVE_RIGHT;
show_equipment_list return EQUIPMENT_LIST;
break_wall return BREAK_WALL;
door_nearby return DOOR_NEARBY;
chest_nearby return CHEST_NEARBY;
merchant_nearby return MERCHANT_NEARBY;
enemy_nearby return ENEMY_NEARBY;


{print} return PRINT;
ask return ASK;
{comment} return COMMENT;
{var} return VAR;

%%

int yywrap(void){
	return 1;
}