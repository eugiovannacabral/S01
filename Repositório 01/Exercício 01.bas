10 INPUT "Digite sua primeira nota: "; n1
20 INPUT "Digite sua segunda nota: "; n2
30 LET media = (VAL(n1) + VAL(n2))/ 2

40 IF media > 60 THEN GOTO 100
50 IF media < 30 THEN GOTO 200
    
60 IF media <= 60 AND media > 30 THEN GOTO 65
65 INPUT "Digite a sua nota de NP3: "; np3
68 LET media_np3 = media + VAL(np3)
      
70 IF media_np3 > 50 THEN PRINT "Aprovado pela NP3" ELSE PRINT "Reprovado pela NP3"
75 END

100 PRINT "Aprovado Direto!"
110 END

200 PRINT "Reprovado Direto!"
210 END
