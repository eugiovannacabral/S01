print("Digite seu primeiro numero: ")
local m = tonumber(io.read())
print("Digite seu segundo numero: ")
local n = tonumber(io.read())

print("Digite o número que você deseja saber o múltiplo: ")
local x = tonumber(io.read())

for i = m, n, 1 do --start, end, step
  if i % x == 0 then
    print(i)
  end
end
