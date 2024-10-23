local function calculator()
    print("Enter first number:")
    local a = io.read("*n") -- read a number from user input and assign to variable 'a'
    
    local _ = io.read() -- act as a buffer for hitting 'enter' in case Lua accidentally treat linebreak as an input

    print("Enter operation (+, -, *, /):")
    local op = io.read():match("%S+") -- use :match("%S+") to look for characters only without getting whitespace

    print("Enter second number:")
    local b = io.read("*n")

    local result
    if op == "+" then
        result = a + b
    elseif op == "-" then
        result = a - b
    elseif op == "*" then
        result = a * b
    elseif op == "/" then
        -- return a integer if a can be fully divided by a, else return a float
        if a % b == 0 then
            result = math.floor(a / b)
        else
            result = a / b
        end
    else 
        print("Invalid operation!")
        return
    end

    print("Result: " .. result)
end

calculator()