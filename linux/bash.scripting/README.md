# Bash Scripting

The Bash shell acts as a strong command interpreter that also works as a scripting language to help automate tasks. It lets users run commands move around the file system and execute scripts that can help automate tasks that can be repeated.

## Parameters

#### First run: `vi <file.sh>`

```
#!/bin/bash #Ensures that the interpreter we are using is 'bash'

echo "Paramter1: $1"
echo "Paramter2: $2"

```
#### Execute: `chmod +x <file.sh> | sh ./<file name> Hello World`

#### Output:

```
Paramter1: Hello
Paramter2: World
```
#### Did you see the pattern here? No? Here it is:

So the `$` symbol in this context is the 'argument number' e.g. Hello World ---> 'Hello' is Argument 1 and 'World' is Argument 2. 
So Parameters organise your arguments into a column based on how many arguments you use.

#### Extra point: 

`Paramter1: $@` ----> The `@` refers to the whole set of Paramters, which in this case is `Hello World`

### Real Example:

```bash
#!/bin/bash

"Length: $1"
"Width: $2"
"Height: $3"

echo "The Area is $((Length * Width * Height))"
```
#### Command: `sh <file.sh> 2 2 2`
#### Output:

```bash
Length: 2
Width: 2
Height: 2

The Area is 8
```

## Conditions

#### First Lets get familiar with some symbols:

|Symbol|Meaning|
|-|-|
| `eq`| equals
|`ne`| not equal to
|`lt`| less than
|`le`| less than or equal to
|`gt`| greater than
|`ge`| greater than or equal to

### `if`-`fi` Statement

#### Lets look at an example first:

```bash
#!/bin/bash

grade = 7

if [ $grade -lt 4 ]; then
   echo "You have failed the exam :("
fi

```

#### So in here, we are clearly making the condition that if the value for 'grade' is less than 4 then they've failed their exam.

#### Command: `sh <file.sh>`
#### Output:
```
You have failed the exam :(
```
#### Another condition for the if-fi statement is `else`

```bash
#!/bin/bash

grade = 7

if [ $grade -lt 4 ]; then
   echo "You have failed the exam :("

else
    echo "You have passed!!!"
fi
```

#### As clearly shown, `else` is used when presenting an alternative if the prior condition is not met

### `else` + `if` = `elif`

#### Here's the same previous example, but with `elif`:

```bash
#!/bin/bash

grade = 7

if [ $grade -lt 4 ]; then
   echo "You have failed the exam :("

elif [ $grade -gt 8 ]
    echo "You've smashed it!"
fi
```
## More Symbols!

`||` => `if [ apples || bananas ]; then echo "You've chosen a fruit"`

|Symbol|Meaning|Example|
|-|-|-|
| (on top of the table) | 'OR'| (example also above)
| `&&`| 'AND'| `if[ tall && skinny ]; then echo "You need to gain weight"`
| `==`| 'EQUALS'| `if [ name == John ]; then echo "Hello, John"`
| `!=`| 'NOT EQUALS'| `if [ Number != 24 ]; then echo "Wrong number, please try again"`


## Nested `if` Statements

#### Example:

```
#!/bin/bash

grade = 7

if [ $grade -lt 4 ]; then
   echo "You have failed the exam :("
if [ $age == 18 ]
   echo "You're eligible to resit the exam for free"
fi
elif [ $grade -gt 8 ]
    echo "You've smashed it!"
fi
```

## While Loops 

#### You know how it is... Lets figure out an Example!

```
#!/bin/bash

count = 1

while [ $count -lt 5 ]
do
     echo "Count: $count"
     ((count ++))
done

```

#### This may look abit tricky so lets break it down.

- We have first given `count` a value, which is `1`
- `while` is also used to basically say - 'While `1` is lesser than `5`...`
- `do` is the action that is taken whilst 1 is lesser than 5
- Now the echoed message is a Paramter which will show up in your outputs
- `((count ++))` is used to increment (increase number of) the `count` value, in other words adding 1 to `1` which will be 2 then 3 and so on.

#### Output:

```
Count:1
Count:2
Count:3
Count:4

```
#### Notice how it doesnt list `5`. Thats because we have made it clear that `1` is incremented as long as its LESS THAN `5`.

## Arrays

#### When there are multiple values in a single variable.

#### EXAMPLE!

```
#!/bin/bash

fruits = ("apples" "oranges" "bananas")
echo "Fruit: ${fruits[@]}"

```
#### Output

```
Fruit: apples
Fruit: oranges
Fruit: bananas
```

#### Lets do a harder one using `while` loops:

```bash
#!/bin/bash

animals = ( "dogs" "monkeys" "cats" )
index = 0

while [ $index -lt {#animals[@]} ]  
do
    echo "Animal: ${animals[$index]}
    ((index ++))
done
```

#### Dont worry, its not as bad as it looks!

- We've first assigned 3 values to the variable `animals`
- We've also assigned a number to `index` 
- a `while` loop was made to say 'Whilst `0` (value of `index`) is less than the number of **all** of the animal values, then increment the Animal parameter based on `index`

*side point: `#` means 'number of'*

## `for` Loops

#### Here is a template:

```bash
for *variable* in *value*
do
   command
done
```
#### And here is an example:

```bash
fruits = ( "apples" "oranges" "bananas" )
for FRUIT in ${fruits[@]}
do
   echo "Fruit: $FRUIT"
done
```
#### *Another Example with a new binary*

```bash
for count in ( seq 10 5 25)
do
  echo "Number: $count"
done
```
`seq` = sequence, so the sequence here is from 10 to 25 (in fives)

#### Output:

```
Number: 10
Number: 15
Number: 20
Number: 25
```
## Functions

#### Template:

```bash
Name () {
*value*
}

Name
```
#### 'Name' is repeated at the end to trigger the function/value that you made before

#### Example:

```bash
fruits () {
  local fruit="$1"
  echo "You have chosen the flavour: $fruit
}

fruit "Apple"
```

`local` = this means that the variable preceding it only has effect within the function or statement

And in this case we have assigned the local variable `fruit` to `$1` which (if you remember) is pointing to the **first argument**. So, thats why - when we did `fruit "Apple"`- we basically specified the argument that is the value of the `fruit` variable.

#### New Symbols!
- `$#` = Refers to the number of arguments
- `$0` = Refers to the script name
- `$@` = Refers to all arguments
- `$?` = Refers to the exit status of the previous command (don't worry we will touch on this)

### Lets Introduce the *coolest* Command in Bash Scripting!

```bash
#!/bin/bash

echo "What is your name? "
read response
echo "Hello, $response"
```
*Note: `response` could be anything as its a variable as long as its referenced properly in the preceding lines of your script*

#### So now when you execute the command, this is what happens:

```
~ sh file.sh
What is your name? (you then type the response e.g. Bob)
Hello, Bob
```
### Exit Calls

#### Lets look at an example:
```bash
greet () {
local height="$1"
if [ $height -ge 150 ] 
then
    echo "You are tall enough for the ride!"
fi
return=0

if [ height -lt 150 ]
then
   echo "Sorry, for safety reasons, you cannot board the ride"
fi
return=1
}

echo "How tall are you (cm)? "
read height
greet "$height"
exit_status = $?
if [ exit_status != 0 ]
then
   echo "Height Validation Unsuccessfull"
fi

```
#### `return=0` = Successfull execution
#### `return=1` = Stop execution due to e.g. error
#### Remember as we said before that `$?`, here, is the value for `exit_status` and we are saying in the following 'if Statement' that if the previous exit status or `return` is NOT equal to zero then execute the following error command.
