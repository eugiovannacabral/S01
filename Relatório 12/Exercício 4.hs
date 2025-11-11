import Data.List (intercalate)


data Servico = Servico { nome :: String, tipo :: String, preco :: Double }
    deriving (Show)

data StatusAtendimento = EmAndamento | Finalizado | Cancelado
    deriving (Show, Eq)

data Atendimento = Atendimento { servicos :: [Servico], statusAtendimento :: StatusAtendimento }
    deriving (Show)


bonusEspiritual :: [Servico] -> Double
bonusEspiritual lista
    | total > 500 = total - (total * 0.10) 
    | length lista > 3 = total + (total * 0.25)
    | otherwise = total
  where
    total = sum (map preco lista)


valorFinalAtendimento :: Atendimento -> Double
valorFinalAtendimento atendimento
    | statusAtendimento atendimento == Cancelado = 0.0
    | otherwise = bonusEspiritual (servicos atendimento)


descricaoPrimeiroServico :: Atendimento -> String
descricaoPrimeiroServico atendimento =
    case servicos atendimento of
        [] -> "Nenhum serviço realizado ainda."
        (x:_) -> "Primeiro serviço: " ++ nome x ++ " (" ++ tipo x ++ ")"


listarServicos :: Atendimento -> String
listarServicos atendimento =
    case servicos atendimento of
        [] -> "Nenhum serviço disponivel"
        xs -> intercalate ", " (map nome xs)


servico1 = Servico "Banho de oleo na agua quente" "Banho" 190.0
servico2 = Servico "Banho de Sais" "Banho" 2768.0
servico3 = Servico "Banquete dos Espiritos" "Banquete" 350.0


atendimento1 = Atendimento [servico1, servico2] Finalizado
atendimento2 = Atendimento [servico3, servico1, servico2] EmAndamento
atendimento3 = Atendimento [servico1] Cancelado


main :: IO ()
main = do

    putStrLn "\nCLIENTE 1"
    putStrLn ("Serviços: " ++ listarServicos atendimento1)
    putStrLn (descricaoPrimeiroServico atendimento1)
    putStr "Valor final: R$ "
    print (valorFinalAtendimento atendimento1)

    putStrLn "\nCLIENTE 2"
    putStrLn ("Serviços: " ++ listarServicos atendimento2)
    putStrLn (descricaoPrimeiroServico atendimento2)
    putStr "Valor final: R$ "
    print (valorFinalAtendimento atendimento2)

    putStrLn "\nCLIENTE 3"
    putStrLn ("Serviços: " ++ listarServicos atendimento3)
    putStrLn (descricaoPrimeiroServico atendimento3)
    putStr "Valor final: R$ "
    print (valorFinalAtendimento atendimento3)
