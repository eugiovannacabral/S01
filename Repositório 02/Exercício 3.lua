local numeros = {}
local valor
local tabela = {}

print("Digite números (digite 0 para parar): ")

while true do
    valor = tonumber(io.read())
    if valor == 0 then
        break
    end
    table.insert(numeros, valor)
end

for i = 1, #numeros do --# pega o tamanho da tabela
    if numeros[i] % 2 == 0 then
        table.insert(tabela, numeros[i])
    end
end

print("Sua tabela somente com números pares:")
for i, v in ipairs(tabela) do
    print(v)
end
