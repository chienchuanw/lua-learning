-- Variable
-- In Lua, we use 'local' to declare a local variable
local a = 5 -- integer
local b = "Hello" -- string
local c = true -- boolean

-- If you declare a variable without 'local, it will become a global variable which should be avoided.
X = 10 -- This is a global variable

-- Notice that Lua is a case-sentive language. In other words, variable 'x' and 'X' are two different variables.

-- Lua uses 4 spaces as indentation.

-- Lua can also use 'if', 'else', 'elseif', 'for', 'while' to achieve flow control.
local x = 10

if x > 5 then
    print("x is greater than 5.")
else
    print("x is equal or smaller than 5.")
end



-- For Loop
-- In Lua, a For Loop needs 'starting value', 'ending value', and 'adding value'.
for i = 1, 10, 1 do -- notice that this variable 'i' only exists in this For Loop.
    print(i)
end


-- Let's try another example
local j = 99
for _ = 1, 10, 1 do
    print(j) -- Since there is no variable 'j' in For Loop, Lua will use local variable 'j' instead

    -- As result, it will print out '99' ten times.
end

-- One things should be aware is in this for loop, all three value (start, end, add) should be a number (either a integer or a float). String is not acceptable in this kind of For Loop.

-- If you want to iterate a string, see example below:
local my_string = "Hello"
for i = 1, #my_string do -- The '#' operator in Lua is used to get the length of a string. In this case, the length of 'my_string' is 5.
    local char = my_string:sub(i, i) -- The 'sub' function is used to extract a substring from the string, starting at the start index and ending at end index. In this case, both start and end are set to i.
    print(char) -- Prints out 'H', 'e', 'l', 'l', 'o' indivdually.
end
-- !!Important: In Lua, index starts at 1 instead of 0.



-- Function
