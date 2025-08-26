print("Digite seu primeiro numero: ")
local n1 = tonumber(io.read())
print("Digite seu segundo numero: ")
local n2 = tonumber(io.read())

print("Digite um operador matemático: ")
local op = tonumber(io.read())

function calculadora(n1, n2, op)
    if op == "+" then
        print(n1 + n2)
    elseif op == "-" then
        print(n1 - n2)
    elseif op == "*" then
        print(n1 * n2)
    elseif op == "/" then
        print(n1 / n2)
    end
        
end
