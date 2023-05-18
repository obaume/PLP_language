# **Auteurs** 
## **Oscar Baume & Dorian Gillioz**
## Déclaration
|Types|Definition|
|-|-|
|`int`|Entier appartenant à Z|
|`bool`|Booléan|
|`(Type,Type,...)`|Tuples pouvant avoir 2 ou + Types. `Type` = (int, bool ou Tuple)|

|Variable|Explication|
|-|-|
|`Type nom_var = expr`|Déclaration d'une variable constante qui a le nom `nom_var` et prenne comme valeur une expression|

|Fonction|Explication|
|-|-|
|`Type nom_fct (arg_fct) Expr`|Déclaration d'une fonction qui a le nom `nom_fct`, `arg_fct` peut avoir 0 ou n `Type` ceux-ci sont séparé par des `,`. Le corps de la fonction est défini dans `Expr`|

## Expression
|Littéraux|Explication|
|-|-|
|`1, 42, -17, ...`|Entier de type `int`|
|`true, false`|Booléan|
|`(1,2), (true,false), (true,10), ...`|Tuple|

|Fonctions|Explication|
|-|-|
|`int f(int) expr;`|décalration d'une fonction `f` avec comme type de retour `int`, avec 1 argument de type int qui retourne une expression|
|`f(14,x,true);`|appel d'une fonction `f` avec 3 arguments.|

|Conditionnel|Explication|
|-|-|
|`if (cond) expr`|Si cond est true expr est executer|
|`if (cond) expr1 else expr2`|Lorsque cond est vrai expr1 est executé sinon expr2 est executé|

### Déclaration locale avec corps
```C
let
    def,
    def,
    def
in expr
```
On fait autant de definition entre le `let` et le `in` (variables constantes ou fonction).Ces definitions sont utilisé dans l'expression du `in`.

## Pattern matching
```C++
case expr of
    x -> expr,
    0 -> 0,
    _ -> 1
```
Si `expr` est égal a la variable x alors le case retourne une expression, si expr est égal à 0 case retourne 0. Si aucun des patterns n'est matché alors on retourne 1 depuis la wildcard.

## Opérateurs 
### Opérateurs unaire
|Opérateur|Utilisation|Explication|
|-|-|-|
|`-`|`-x`|Retourne l'inverse de la variable x de type int|
|`!`|`!b`|Retourne l'inverse de la variable b de type bool|
|`++`|`++x`|Incrémente la valeur de x de 1|
|`--`|`--x`|Décrémente la valeur de x de 1|

### Opérateurs binaire
|Opérateur|Utilisation|Explication|
|-|-|-|
|`+`|`x + 12`|Additionne la valeur de x avec 12|
|`-`|`x - 12`|Soustrait 12 à x|
|`*`|`x + 12`|Multiplie x par 12|
|`/`|`x / 12`|Divise x par 12|
|`%`|`x % 4`|Retourne le reste de la division entière entre x et 4|
|`&&`|`true && false`|ET logique, retourne true que dans le cas ou les 2 opérandes sont true|
|`\|\|`| `true \|\| false`| OU logique, retourne true si l'un des 2 opérandes est true|
|`==`| `1 == 2`| opérateur de comparaison, retourne true si les 2 opérandes sont identiques|
|`!=`| `1 != 3`| opérateur de comparaison, retourne true si les 2 opérandes son différents`|
|`<`|`1 < 2`| retourne true si l'opérande gauche est strictement plus petit que l'opérande droite|
|`<=`|`1 <= 2`| retourne true si l'opérande gauche est plus petit ou égal que l'opérande droite|
|`>`|`1 > 2`| retourne true si l'opérande gauche est strictement plus grand que l'opérande droite|
|`>=`|`1 >= 2`| retourne true si l'opérande gauche est plus grand ou égal que l'opérande droite|


## Exemples de code
```C
int t = 12; 
int coolfct(int value, int cool) 
    if (func(value) && !fact(123)) 
        case value of 
            cool -> f(t), 
            123 -> value * 5, 
            _ -> value / 2 
    else 
        let int fct(int val) 2 * val, 
            bool youhou = false 
        in ret(fct(value), false);
```

Notre language accepte seulement des definitions en début de ligne des definitions, on ne peut pas executer une expressions du style `f(12);`.