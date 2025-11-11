--PROGRAMAÇÃO FUNCIONAL, foca em funções que tranformam dados

data Bebida = Bebida { nome  :: String, tipo :: String, preco :: Double }
    deriving (Show) 

data StatusPedido = Aberto | Entregue | Cancelado
    deriving (Show, Eq) 

data Pedido = Pedido { listaBebidas :: [Bebida], statusPedido :: StatusPedido } --lista de bebidas e o status do pedido
    deriving (Show)


precoBebida :: Bebida -> Double
precoBebida (Bebida _ _ p) = p  


calculaSubtotal :: [Bebida] -> Double
calculaSubtotal subtotalBebidas = sum (map precoBebida subtotalBebidas)
-- map aplica sobre cada item da lista, e sum soma os resultados


adicionaTaxa :: StatusPedido -> Double
adicionaTaxa taxafixa
    | taxafixa == Cancelado = 0.0
    | otherwise         = 5.0 


valorTotalPedido :: Pedido -> Double
valorTotalPedido pedido
    | statusPedido pedido  == Cancelado = 0.0 
    | otherwise = total
    where
        somatorio = calculaSubtotal (listaBebidas pedido) 
        taxa = adicionaTaxa (statusPedido pedido)
        total = somatorio + taxa                          


primeiraBebida :: Pedido -> String
primeiraBebida pedido =
    case listaBebidas pedido of
        []    -> "Nenhum pedido feito"
        (x:_) -> nome x                  
                                            

bebida1 = Bebida "Bloody Mary" "Drink" 30.00
bebida2 = Bebida "Skol" "Cerveja" 3.55
bebida3 = Bebida "Vinho Branco" "Vinho" 65.00


pedido1 = Pedido [bebida1, bebida2, bebida3] Aberto
pedido2 = Pedido [bebida2] Entregue
pedido3 = Pedido [bebida2, bebida3] Cancelado


main :: IO ()
main = do

    putStrLn "~ Bem-vindo a Cafeteria Leblanc ~"

    putStr "Pedido 1 - Valor Total: R$ "
    print (valorTotalPedido pedido1)

    putStr "Pedido 2 - Valor Total: R$ "
    print (valorTotalPedido pedido2)

    putStr "Pedido 3 - Valor Total: R$ "
    print (valorTotalPedido pedido3)

    putStrLn "\nPrimeiro nome da bebida do pedido 1: "
    putStrLn (primeiraBebida pedido1)
