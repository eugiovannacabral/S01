--PROGRAMAÇÃO FUNCIONAL, foca em funções que tranformam dados

-- ** 1. Tipos Personalizados (data) **

-- Tipo que representa um livro
data Bebida = Bebida { nome  :: String, tipo :: String, preco :: Double }
    deriving (Show) -- permite exibir o valor no terminal

-- Tipo enumerado com possíveis status de uma compra
data StatusPedido = Aberto | Entregue | Cancelado
    deriving (Show, Eq) -- Eq permite comparar com ==

-- Tipo que representa uma compra com lista de livros e status
data Pedido = Pedido { listaBebidas :: [Bebida], statusPedido :: StatusPedido } --lista de bebidas e o status do pedido
    deriving (Show)

-- ** 2. Funções Puras **

-- Retorna o preço de um livro (função pura)
precoBebida :: Bebida -> Double
precoBebida (Bebida _ _ p) = p  -- usa pattern matching e ignora campos do livro com _ (salva apenas preco)

-- Soma todos os preços de uma lista de livros
calculaSubtotal :: [Bebida] -> Double
calculaSubtotal subtotalBebidas = sum (map precoBebida subtotalBebidas)
-- map aplica precoLivro em cada item, e sum soma os resultados

-- **3. Condicional com Guards **

-- Define o valor do frete
adicionaTaxa :: StatusPedido -> Double
adicionaTaxa taxafixa
    | statusPedido taxafixa == Cancelado = 0.0
    | otherwise         = 5.0  -- caso contrário, frete padrão

-- ** 4. Função principal de cálculo do valor total **

valorTotalPedido :: Pedido -> Double
valorTotalPedido pedido
    | statusPedido pedido  == Cancelado = 0.0 -- devolvida: valor zero
    | otherwise = total
    where
        somatorio = calculaSubtotal (listaBebidas pedido) --soma dos preços
        taxa = adicionaTaxa somatorio                     --calcula o frete
        total = somatorio + taxa                          -- total final

-- ** 5. Uso de Pattern Matching em Listas **

-- Retorna o título do primeiro livro da compra
primeiraBebida :: Pedido -> String
primeiraBebida pedido =
    case listasBebidas pedido of
        []    -> "Nenhum pedido feito"  -- lista vazia
        (x:_) -> nome x                  -- (x:_) é o padrão de correspondência de lista (“cabeça e cauda”): 
                                            -- pega o título do primeiro livro

-- ** 6. Exemplos de dados **

livroA = Livro "Neuromancer" "William Gibson" 45.0
livroB = Livro "Call of Cthulhu" "H.P. Lovecraft" 65.0
livroC = Livro "O Corvo" "Edgar Alan Poe" 30.0

-- Cria três compras diferentes
compra1 = Compra [livroA, livroB] Aberta      -- frete grátis
compra2 = Compra [livroA, livroC] Aberta      -- com frete
compra3 = Compra [livroA, livroB] Devolvida   -- devolvida

-- ** 7. Função Principal (IO) **

main :: IO ()
main = do
    putStrLn "--- Simulação de Compras na Livraria ---"

    -- Exibe o valor total das compras
    putStr "Compra 1 (Frete Grátis) - Valor Total: R$ "
    print (valorTotalCompra compra1)

    putStr "Compra 2 (Com Frete) - Valor Total: R$ "
    print (valorTotalCompra compra2)

    putStr "Compra 3 (Devolvida) - Valor Total: R$ "
    print (valorTotalCompra compra3)

    -- Mostra o primeiro livro da compra 2
    putStrLn "\nPrimeiro livro na Compra 2: "
    putStrLn (primeiroTitulo compra2)
