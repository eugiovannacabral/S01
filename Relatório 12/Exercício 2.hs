-- PROGRAMAÇÃO FUNCIONAL - Sistema de Compras Zelda

data Item = Item { nome :: String, categoria :: String, preco :: Double }
    deriving (Show)

data StatusCompra = Aberta | Finalizada | Devolvida
    deriving (Show, Eq)

data CompraZelda = CompraZelda { itensComprados :: [Item], statusCompra :: StatusCompra }
    deriving (Show)

-- Funções puras

precoItem :: Item -> Double
precoItem (Item _ _ p) = p

calculaSubtotal :: [Item] -> Double
calculaSubtotal listaDeItens = sum (map precoItem listaDeItens)

calculaDesconto :: [Item] -> Double
calculaDesconto listaDevalores
    | total > 200 = total * 0.10
    | otherwise   = 0.0
  where
    total = calculaSubtotal listaDevalores

valorFinal :: CompraZelda -> Double
valorFinal compra
    | total > 200 = total - desconto
    | otherwise   = total + 15.0
  where
    total = calculaSubtotal (itensComprados compra)
    desconto = calculaDesconto (itensComprados compra)

listarItens :: CompraZelda -> [String]
listarItens compra = map nome (itensComprados compra)

-- Exemplos de itens e compras
item1 = Item "Pocao de Sabedoria" "Pocao" 45.0
item2 = Item "Espada dos Espadachins" "Arma" 255.0

compra1 = CompraZelda [item1, item2] Aberta
compra2 = CompraZelda [item2] Finalizada

main :: IO ()
main = do
    putStrLn "\nCompra nas Lojas Zelda - Compra 1:"
    print (listarItens compra1)
    putStr "Valor da sua compra: R$ "
    print (valorFinal compra1)

    putStrLn "\nCompra nas Lojas Zelda - Compra 2:"
    print (listarItens compra2)
    putStr "Valor da sua compra: R$ "
    print (valorFinal compra2)
