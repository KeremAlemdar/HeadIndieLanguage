%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(char* s);
extern int yylineno;
%}


%token PROGRAM_BEGIN
%token PROGRAM_END
 
%token DOOR_NEARBY 
%token CHEST_NEARBY 
%token MERCHANT_NEARBY 
%token ENEMY_NEARBY 
%token CLOSE_DOOR 
%token OPEN_DOOR 
%token OPEN_CHEST 
%token BUY_FOOD 
%token BUY_TOOLS 
%token EAT_FOOD 
%token OPEN_MAP 
%token PRINT_STRENGTH 
%token FIGHT 
%token CHANGE_WEALTH 
%token PRINT_WEALTH 
%token PRINT_OWN_STATUS 
%token EQUIP 
%token MOVE_UP 
%token MOVE_DOWN 
%token MOVE_LEFT 
%token MOVE_RIGHT 
%token EQUIPMENT_LIST 
%token BREAK_WALL 

%token SQRT
%token POW
%token RANDOM
%token PRINT 


%token INTEGER_TYPE 
%token STRING_TYPE 
%token CHAR_TYPE 
%token DOUBLE_TYPE 
%token BOOLEAN_TYPE 
%token INTEGER
%token STRING 
%token CHAR 
%token DOUBLE 
%token BOOLEAN 


%token OR_OP 
%token XOR_OP
%token NOR_OP 
%token NAND_OP 
%token AND_OP 


%token ASSIGNMENT 
%token PLUS 
%token MINUS 
%token MULTIPLICATION 
%token DIVISION 


%token EQUAL_CHECK 
%token SMALLER  
%token SMALLER_OR_EQUAL 
%token GREATER 
%token GREATER_OR_EQUAL 
%token NOT_EQUAL 


%token SEMI_COLON 
%token LEFT_PARENTHESES 
%token RIGHT_PARENTHESES 
%token LEFT_BRACE 
%token RIGHT_BRACE 
%token LEFT_SB 
%token RIGHT_SB 
%token DOT 
%token COLON 
%token COMMA



%token IF 
%token ELSE 
%token FOR 
%token WHILE 
%token DO 
%token SWITCH 
%token CASE 
%token DEFAULT

%token FREE 
%token ASK 
%token COMMENT 
%token VAR 
%token BREAK
%token ANSWER

%token WEAPON
%token WEIGHT
%token DAMAGE
%token PRICE
%token DURABILITY
%token INDEX
%token FOOD
%token ENERGY
%token CHEST
%token INSIDE


%token JUMP_HEIGHT
%token MOVEMENT_SPEED
%token BODY_PART_DAMAGE
%token CHECK_COLLISION
%token GRAVITY
%token PRINT_JUMP_HEIGHT
%token PRINT_MOVEMENT_SPEED
%token PRINT_BODY_PART_INFORMATION
%token PRINT_GRAVITY


%start program
%right ASSIGNMENT
%left PLUS MINUS 
%left MULTIPLICATION DIVISION

 
%%
program : PROGRAM_BEGIN code_block PROGRAM_END {printf("Input is valid and parsing is successful\n");};

//Statement Definitions
code_block : LEFT_BRACE codes RIGHT_BRACE | LEFT_BRACE RIGHT_BRACE
;

codes : code| codes code 
	;

code : game_funcs | loops | condition_stmt  | declaration | function_call | comment_block | assignment | print;



// ASSIGNMENT
assignment : array_assign SEMI_COLON | assign SEMI_COLON | weapon_assign SEMI_COLON | food_assign SEMI_COLON | chest_assign SEMI_COLON;
assign : VAR ASSIGNMENT expr | VAR ASSIGNMENT ask | VAR assignment_ops expr | VAR assignment_ops ask;
array_assign :  VAR LEFT_SB int_expr RIGHT_SB ASSIGNMENT expr | VAR LEFT_SB int_expr RIGHT_SB ASSIGNMENT ask;
assignment_ops : PLUS ASSIGNMENT | MINUS ASSIGNMENT | MULTIPLICATION ASSIGNMENT | DIVISION ASSIGNMENT;

// DECLARATION
declaration : array_declaration SEMI_COLON | array_declaration_with_a_list SEMI_COLON | function_declaration | primitive_declaration SEMI_COLON | weapon_declaration SEMI_COLON | food_declaration SEMI_COLON | chest_declaration SEMI_COLON;
primitive_declaration : primitive_object_types VAR
| primitive_object_types assign;
array_declaration : primitive_object_types VAR LEFT_SB int_expr RIGHT_SB;
array_declaration_with_a_list : array_declaration ASSIGNMENT LEFT_BRACE primitive_objects_list RIGHT_BRACE;


// WEAPON
weapon_declaration : WEAPON VAR;
weapon_weight : VAR DOT WEAPON DOT WEIGHT;
weapon_damage : VAR DOT WEAPON DOT DAMAGE;
weapon_price : VAR DOT WEAPON DOT PRICE;
weapon_index : VAR DOT WEAPON DOT INDEX;
weapon_durability : VAR DOT WEAPON DOT DURABILITY;
weapon_variables : weapon_weight | weapon_damage | weapon_price | weapon_durability | weapon_index;
weapon_assign : weapon_variables ASSIGNMENT int_expr;

// FOOD
food_energy : VAR DOT FOOD DOT ENERGY;
food_declaration : FOOD VAR;
food_price : VAR DOT FOOD DOT PRICE;
food_index : VAR DOT FOOD DOT INDEX;
food_variables : food_price | food_index | food_energy;
food_assign : food_variables ASSIGNMENT int_expr;


// CHEST 
chest_inside_weapon : VAR DOT CHEST DOT WEAPON;
chest_inside_price : VAR DOT CHEST DOT PRICE;
chest_inside_food : VAR DOT CHEST DOT FOOD;
chest_variables : chest_inside_weapon | chest_inside_price | chest_inside_food;
chest_assign : chest_variables ASSIGNMENT int_expr;
chest_declaration : CHEST VAR;




comment_block : COMMENT;




// FUNCTION

primitive_objects_list : VAR | primitive_objects | primitive_objects_list COMMA primitive_objects | primitive_objects_list COMMA VAR ;

function_call : VAR LEFT_PARENTHESES RIGHT_PARENTHESES SEMI_COLON
| VAR LEFT_PARENTHESES primitive_objects_list RIGHT_PARENTHESES SEMI_COLON;

parameter : primitive_object_types VAR;

parameters : parameters COMMA parameter | parameter;

function_declaration : function_declaration_answer | function_declaration_free;

function_declaration_free : FREE VAR LEFT_PARENTHESES parameters RIGHT_PARENTHESES code_block | FREE VAR LEFT_PARENTHESES RIGHT_PARENTHESES code_block;

function_declaration_answer : primitive_object_types VAR LEFT_PARENTHESES parameters RIGHT_PARENTHESES code_block ANSWER VAR
| primitive_object_types VAR LEFT_PARENTHESES RIGHT_PARENTHESES code_block ANSWER VAR;







print : PRINT LEFT_PARENTHESES print_things RIGHT_PARENTHESES SEMI_COLON;

print_things : expr | print_things COMMA expr;

ask : ASK LEFT_PARENTHESES RIGHT_PARENTHESES;

//condition
condition_stmt : if_stmt | if_stmt else_stmt | if_stmt else_if_stmts else_stmt | if_stmt else_if_stmts;

if_stmt : IF LEFT_PARENTHESES logic_exprs RIGHT_PARENTHESES code_block;

else_if_stmts : else_if_stmts else_if_stmt | else_if_stmt;

else_if_stmt : ELSE IF LEFT_PARENTHESES logic_exprs RIGHT_PARENTHESES code_block;

else_stmt : ELSE code_block;













// loops
loops : for | while | do_while | switch_case;

for_indicator : assignment_ops | ASSIGNMENT;

for : FOR LEFT_PARENTHESES primitive_object_types VAR ASSIGNMENT int_expr SEMI_COLON logic_exprs SEMI_COLON VAR for_indicator expr RIGHT_PARENTHESES code_block 
| FOR LEFT_PARENTHESES primitive_object_types VAR COLON VAR RIGHT_PARENTHESES code_block
;

switch_case : SWITCH LEFT_PARENTHESES int_expr RIGHT_PARENTHESES LEFT_BRACE switch_steps RIGHT_BRACE;

switch_steps : switch_step | switch_steps switch_step;

switch_step : switch_ste codes | switch_ste codes BREAK SEMI_COLON | switch_ste DEFAULT COLON codes | DEFAULT COLON codes;

switch_st : CASE INTEGER COLON;

switch_ste : switch_st | switch_ste switch_st;

while : WHILE LEFT_PARENTHESES logic_exprs  RIGHT_PARENTHESES  code_block;

do_while : DO code_block WHILE LEFT_PARENTHESES logic_exprs RIGHT_PARENTHESES;

logic_exprs : boolean_expr | logic_exprs boolean_ops boolean_expr | BOOLEAN | VAR;

boolean_expr :  VAR comparison_op expr | boolean_return_game_funcs LEFT_PARENTHESES RIGHT_PARENTHESES;

boolean_ops : AND_OP | XOR_OP | NOR_OP | NAND_OP | OR_OP;

comparison_op : EQUAL_CHECK | SMALLER | SMALLER_OR_EQUAL  | GREATER  | GREATER_OR_EQUAL | NOT_EQUAL;

primitive_objects : MINUS INTEGER | MINUS DOUBLE | INTEGER | DOUBLE |  STRING | CHAR | BOOLEAN;

array_object : VAR LEFT_SB int_expr RIGHT_SB;

op : PLUS | MINUS | MULTIPLICATION | DIVISION;

expr_objects : primitive_objects | VAR | math_funcs | array_object;

expr : expr op expr_objects | expr_objects ;

int_expr_objects : MINUS INTEGER | MINUS DOUBLE | INTEGER | DOUBLE | VAR | math_funcs;

int_expr: int_expr op int_expr_objects | int_expr_objects;

primitive_object_types : INTEGER_TYPE | DOUBLE_TYPE | STRING_TYPE | CHAR_TYPE | BOOLEAN_TYPE;

math_funcs: sqrt| pow| random;

sqrt : SQRT LEFT_PARENTHESES int_expr RIGHT_PARENTHESES;

pow : POW LEFT_PARENTHESES int_expr RIGHT_PARENTHESES;

random : RANDOM LEFT_PARENTHESES int_expr SEMI_COLON int_expr RIGHT_PARENTHESES;









// game functions
game_funcs_parameter : buy_food | buy_tool | eat_food | change_wealth | equip | gravity | body_part_damage | movement_speed | jump_height;
game_funcs_noparameter : door_close | door_open | chest_open | open_map | print_strength | fight | print_wealth | print_own_status | move_up | move_down | move_left | move_right | show_equipment_list | break_wall | print_jump_height | print_movement_speed | print_body_part_information | print_gravity | check_collision;
game_funcs : game_funcs_parameter LEFT_PARENTHESES int_expr RIGHT_PARENTHESES SEMI_COLON | game_funcs_noparameter LEFT_PARENTHESES RIGHT_PARENTHESES SEMI_COLON;

boolean_return_game_funcs : door_nearby | chestNearby | merchantNearby | enemyNearby;


jump_height : JUMP_HEIGHT;
movement_speed : MOVEMENT_SPEED;
body_part_damage : BODY_PART_DAMAGE;
check_collision : CHECK_COLLISION;
gravity : GRAVITY;


print_jump_height : PRINT_JUMP_HEIGHT;
print_movement_speed : PRINT_MOVEMENT_SPEED;
print_body_part_information : PRINT_BODY_PART_INFORMATION;
print_gravity : PRINT_GRAVITY;
door_close : CLOSE_DOOR
door_open : OPEN_DOOR;
chest_open : OPEN_CHEST;
buy_food : BUY_FOOD;
buy_tool : BUY_TOOLS;
eat_food : EAT_FOOD;
open_map : OPEN_MAP;
print_strength : PRINT_STRENGTH;
fight : FIGHT;
change_wealth : CHANGE_WEALTH;
print_wealth : PRINT_WEALTH;
print_own_status : PRINT_OWN_STATUS;
equip : EQUIP;
move_up : MOVE_UP;
move_down : MOVE_DOWN;
move_left : MOVE_LEFT;
move_right : MOVE_RIGHT;
show_equipment_list : EQUIPMENT_LIST;
break_wall : BREAK_WALL;
door_nearby : DOOR_NEARBY;
chestNearby : CHEST_NEARBY;
merchantNearby : MERCHANT_NEARBY;
enemyNearby : ENEMY_NEARBY;

%%
#include "lex.yy.c"
void yyerror(char *s){
	fprintf(stdout, "line %d: %s\n", yylineno, s);
}

int main(void){
yyparse();
return 0;
}

