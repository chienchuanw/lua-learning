# lua-tutorial by kaochenlong

## Install

- win: `scoop install lua`
- mac: `brew install lua`

> Remember to install scoop or homebrew first.

## Class

### Declare a variable

```lua
age = 18 

print(age)
```

The example above will print out `18`. However, it will also throw an warning message since we didn't declare the variable `age` before using it. To fix this, we should add `local` before the variable name.

```lua
local age = 18 

print(age)
```

If you use an undefined variable, it will throw an error. And if you try to print a undefined variable, it will print out `nil`.

```lua
print(asdasdgs)
```

#### Naming

Lua prefers `snake_case` for variable name.

These are illegal variable names:

```lua
local 1age = 18 
local age-1 = 18 
local age 1 = 18 
```

So it is not allowed to start a variable name with a number or use `-` or `space` in the variable name.

### Comment

```lua
-- This is a comment
```

```lua
age = 18 -- This is a comment
```

```lua
--[[
This is a comment
]]
```

### Strings

To concatenate two strings, we can use `..`.

```lua
local name = "kitty"
local age = 18
print("my name is " .. name .. " and I am " .. age .. " years old.")
```

### Type conversion

```lua
local age = 18
print(type(age)) -- number

age = tostring(age)
print(type(age)) -- string
```

```lua
local name = "99"
print(type(name)) -- string

name = tonumber(name)
print(type(name)) -- number
```

### logic operator

```lua
local a = 1
local b = 2
print(a > b) -- false
print(a < b) -- true
print(a == b) -- false
print(a ~= b) -- true
```

```lua
-- and
print(true and true) -- true
print(true and false) -- false
print(false and true) -- false
print(false and false) -- false

-- or
print(true or true) -- true
print(true or false) -- true
print(false or true) -- true
print(false or false) -- false

-- not
print(not true) -- false
print(not false) -- true
```

### if statement

```lua
local a = 1
local b = 2

if a > b then
    print("a is greater than b")
elseif a < b then
    print("a is smaller than b")
else
    print("a is equal to b")
end
```

> In Lua, user has to use `end` to end a block of code.

### Table

```lua
local numbers = {1, 2, 3, 4, 5}
print(numbers[1]) -- 1
print(numbers[2]) -- 2
print(numbers[3]) -- 3
print(numbers[4]) -- 4
print(numbers[5]) -- 5
```

In lua, index starts at 1 instead of 0. If you try to access an index that doesn't exist, it will return `nil`.

To insert or update an element in a table, we can simply assign a value to an index.

```lua
local numbers = {1, 2, 3, 4, 5}
print(numbers[6]) -- nil

numbers[6] = 10
print(numbers[6]) -- 10
```

If you want to insert an element to the end of a table, you can use `#` to get the length of the table.

```lua
local numbers = {1, 2, 3, 4, 5}
numbers[#numbers + 1] = 10
print(numbers[6]) -- 10
```

#### How to count the number of elements in a table?

To count the number of elements in a table, we can use `#`.

```lua
local numbers = {1, 2, 3, 4, 5}
print(#numbers) -- 5
```

#### How to insert and remove an element in a table?

To insert an element to a table, we can use `table.insert()`.

```lua
local numbers = {1, 2, 3, 4, 5}
table.insert(numbers, 6) -- insert 6 to the end of the table
print(numbers[6]) -- 6
```

```lua
local numbers = {1, 2, 3, 4, 5}
table.insert(numbers, 1, 0) -- insert 0 to the beginning of the table
print(numbers[1]) -- 0
```

To remove an element from a table, we can use `table.remove()`.

```lua
local numbers = {1, 2, 3, 4, 5}
table.remove(numbers, 1) -- remove the first element
print(numbers[1]) -- 2
```

```lua
local numbers = {1, 2, 3, 4, 5}
table.remove(numbers) -- remove the last element
print(numbers[5]) -- nil
```

Besides treating table as an array, we can also treat it as a dictionary.

```lua
local student = {name = "kitty", age = 18}
print(student.name) -- kitty
print(student.age) -- 18
```

You can also access the element in a table using `[]`.

```lua
local student = {name = "kitty", age = 18}
print(student["name"]) -- kitty
print(student["age"]) -- 18
```

To delete an element in a table, we can simply assign `nil` to it.

```lua
local student = {name = "kitty", age = 18}
student.name = nil
print(student.name) -- nil
```

### Iterate a table

To iterate a table, we can use `for` loop.

```lua
local numbers = {1, 2, 3, 4, 5}
for i = 1, #numbers do
    print(numbers[i])
end
```

You can also add step to the loop.

```lua
local numbers = {1, 2, 3, 4, 5}
for i = 1, #numbers, 2 do
    print(numbers[i])
end
```

If you use `-1` as the step, it will iterate the table in reverse order.

```lua
local numbers = {1, 2, 3, 4, 5}
for i = #numbers, 1, -1 do
    print(numbers[i])
end
```

#### Use ipairs

```lua
local numbers = {1, 2, 3, 4, 5}
for i, v in ipairs(numbers) do
    print(i, v)
end
```

`ipairs` will only iterate the elements that have a positive integer index.

#### Use pairs

```lua
local student = {name = "kitty", age = 18}
for k, v in pairs(student) do
    print(k, v)
end
```

`pairs` will iterate all the elements in a table.

#### How to access a two dimensional array?

```lua
local numbers = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}}
print(numbers[1][1]) -- 1
print(numbers[1][2]) -- 2
print(numbers[1][3]) -- 3
print(numbers[2][1]) -- 4
print(numbers[2][2]) -- 5
```

### What will happen if there is a `nil` in the middle of a table?

```lua
local numbers = {1, 2, 3, nil, 5}
for i, v in ipairs(numbers) do
    print(i, v)
end
```

> Answer: The loop will stop at the first `nil` it encounters.

If we use `#` to get the length of the table, it will return 5 normally. However it depends on the version of lua. For example, in lua 5.1, it might return 3.

```lua
-- In lua 5.4.7
local numbers = {1, 2, 3, nil, 5}
print(#numbers) -- 5
```

### while loop

```lua
local i = 1
while i <= 10 do
    print(i)
    i = i + 1
end
```

### repeat until loop

```lua
local i = 1
repeat
    print(i)
    i = i + 1
until i > 10
```

Difference between `while` and `repeat until` is that `repeat until` will always execute the loop at least once.

### Format String

```lua
local name = "kitty"
local age = 18
print(string.format("my name is %s and I am %d years old.", name, age))
```

### Function

To define a function, we can use `function` keyword.

```lua
function add(a, b)
    return a + b
end
```

