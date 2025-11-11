import Data.List (intercalate) 
--apenas para poder separar atraves de virgulas

data Banda = Banda { nome :: String, genero :: String, cache :: Double }
    deriving (Show)

data StatusEvento = Ativo | Encerrado | Cancelado
    deriving (Show, Eq)

data Evento = Evento { bandas :: [Banda], statusEvento :: StatusEvento }
    deriving (Show)


precoBanda :: Banda -> Double
precoBanda (Banda _ _ p) = p

calculaTotalCache :: [Banda] -> Double
calculaTotalCache listaBandas = sum (map precoBanda listaBandas)


custoTotalEvento :: Evento -> Double
custoTotalEvento evento
    | statusEvento evento == Cancelado = 0.0
    | otherwise = total + taxa
  where
    total = calculaTotalCache (bandas evento)
    taxa = total * 0.20


bandaAbertura :: Evento -> String
bandaAbertura evento =
    case bandas evento of
        []    -> "Nenhuma banda por enquanto"
        (x:_) -> "Banda de abertura: " ++ nome x


bandaEncerramento :: Evento -> String
bandaEncerramento evento =
    case bandas evento of
        [] -> "Nenhuma banda de encerramento"
        completa -> "Banda de encerramento: " ++ nome (last completa)


banda1 = Banda " The Beatles" "Rock" 12000.0
banda2 = Banda "Marron 5" "Soft Rock" 4500.0
banda3 = Banda "The Chainsmokers" "Pop" 3800.0


evento1 = Evento [banda1, banda2, banda3] Ativo
evento2 = Evento [banda3] Encerrado
evento3 = Evento [banda1, banda2] Cancelado


listarBandas :: Evento -> String
listarBandas evento =
    case bandas evento of
        [] -> "Sem bandas"
        xs -> intercalate ", " (map nome xs) --Usei essa propriedade apenas para separar por virgulas e nao por espaços

-- Programa principal
main :: IO ()
main = do
    putStrLn "\n~Evento 1~ "
    putStrLn ("Bandas: " ++ listarBandas evento1)
    putStrLn (bandaAbertura evento1)
    putStrLn (bandaEncerramento evento1)
    putStr "Custo: R$ "
    print (custoTotalEvento evento1)

    putStrLn "\n~Evento 2~ "
    putStrLn ("Bandas: " ++ listarBandas evento2)
    putStrLn (bandaAbertura evento2)
    putStrLn (bandaEncerramento evento2)
    putStr "Custo: R$ "
    print (custoTotalEvento evento2)

    putStrLn "\n~Evento 3~ "
    putStrLn ("Bandas: " ++ listarBandas evento3)
    putStrLn (bandaAbertura evento3)
    putStrLn (bandaEncerramento evento3)
    putStr "Custo: R$ "
    print (custoTotalEvento evento3)
