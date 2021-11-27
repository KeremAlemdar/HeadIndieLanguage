assign_op \=
addition_op \+
substruction_op \-
multiplication_op \*
division_op \/
equal_op \?=
smaller_than_op \<
smaller_or_equal_than_op \<=
larger_than_op \>
larger_or_equal_than_op \>=
not_equal_op \!=
or_op \|
space   [ \t]
new_line [\n]
sign    [-+]
if  (if)
else (else)
for (for)
while (while)
void (free)
return (answer)
letter [a-zA-Z]
digit [0-9]
int {sign}?{digit}+
double {sign}?{digit}*(\.)?{digit}+
string (\"[^\"\n]*\")
closeDoor  (door_close)
openDoor  (door_open)
openChest  (chest_open)
buyFood (buy_food)
buyTools (buy_tool)
eatFood (eat_food)
openMap (open_map)
printStrength (print_strength)
fight (fight)
changeWealth (change_wealth)
printWealth (print_wealth)
printOwnStatus (print_own_status)
equip (equip)
moveUp (move_up)
moveDown (move_down)
moveLeft (move_left)
moveRight (move_right)
equipmentList (show_equipment_list)
switch (switch)
case (case)
comment (\<<[^\"\n]*)
program_begin (xox)
program_end(oxo)
input (ask)
breakWall (break_wall)
and_op (\&)
do (do)
boolean false|true
primitive_object_types boolean|int|double|string|char
symbol \! | \^ | \+ | \% | \& | \/ | \( | \) | \= | \* | \- | \£ | \# | \$ | \½ | \{ | \[ | \] | \} | \_ | \\| \; | \< | \> | \: | \.
print (print)
doorNearby (door_nearby)
chestNearby (chest_nearby)
merchantNearby (merchant_nearby)
enemyNearby (enemy_nearby)
var ([\_]?{letter}|{digit})+



%%
{doorNearby} printf("DOOR_NEARBY ");
{chestNearby} printf("CHEST_NEARBY ");
{merchantNearby} printf("MERCHANT_NEARBY ");
{enemyNearby} printf("ENEMY_NEARBY ");
{print} printf("PRINT ");
{primitive_object_types} printf("PRIMITIVE_OBJECT_TYPES ");
{boolean} printf("BOOLEAN ");
{assign_op} printf("ASSIGNMENT ");
{addition_op} printf("PLUS ");
{substruction_op} printf("MINUS ");
{multiplication_op} printf("MULTIPLICATION ");
{division_op} printf("DIVISION ");
{equal_op} printf("EQUAL_CHECK ");
{smaller_than_op} printf("SMALLER ") ;
{smaller_or_equal_than_op}  printf("SMALLER_OR_EQUAL ");
{larger_than_op} printf("GREATER ");
{larger_or_equal_than_op} printf("GREATER_OR_EQUAL ");
{not_equal_op} printf("NOT_EQUAL ");
{or_op} printf("OR ");
{space}   ;
{new_line} printf("\n");
\;   printf("SEMI_COLON ");
\(   printf("LEFT_PARANTHESES ");
\)   printf("RIGHT_PARANTHESES ");
\{  printf("LEFT_BRACE ");
\}  printf("RIGHT_BRACE ");
\. printf("DOT ");
\: printf("COLON ");
{if}    printf("IF ");
{else}  printf("ELSE ");
{for}   printf("FOR ");
{while} printf("WHILE ");
{void} printf("FREE ");
{return} printf("FUNC_RETURN ");
{int}   printf("INTEGER ");
{string}   printf("STRING ");
{double}   printf("DOUBLE ");
{closeDoor}  printf("CLOSE_DOOR ");
{openDoor}  printf("OPEN_DOOR ");
{openChest} printf("OPEN_CHEST ");
{buyFood}   printf("BUY_FOOD ");
{buyTools}  printf("BUY_TOOLS ");
{eatFood}   printf("EAT_FOOD ");
{openMap}   printf("OPEN_MAP ");
{printStrength}  printf("PRINT_STRENGTH ");
{fight} printf("FIGHT ");
{changeWealth} printf("CHANGE_WEALTH ");
{printWealth} printf("PRINT_WEALTH ");
{printOwnStatus} printf("PRINT_OWN_STATUS ");
{equip} printf("EQUIP ");
{moveUp} printf("MOVE_UP ");
{moveDown} printf("MOVE_DOWN ");
{moveLeft} printf("MOVE_LEFT ");
{moveRight} printf("MOVE_RIGHT ");
{equipmentList} printf("EQUIPMENT_LIST ");
{switch} printf("SWITCH ");
{case} printf("CASE ");
{program_begin} printf("PROGRAM_BEGIN ");
{program_end} printf("PROGRAM_END ");
{input} printf("ASK ");
{breakWall} printf("BREAK_WALL ");
{comment} printf("COMMENT ");
{and_op} printf("AND ");
{do} printf("DO ");
{var} printf("VAR ");

%%

int yywrap() {}

int main() {

extern FILE *yyin;
yyin = fopen("firstTest.txt", "r");
yylex();

printf("--------------- end of first test ------------------------\n");
yyin = fopen("secondTest.txt", "r");
yylex();
printf("--------------- end of second test ------------------------\n");

return 0;
}
