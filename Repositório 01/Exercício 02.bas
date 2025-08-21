10 N = INT(RND * 40)   
30 INPUT "Digite seu numero (Dica está entre 0 a 40): "; palpite

40 IF palpite = N THEN GOTO 100
50 IF palpite < N THEN PRINT "O número correto é maior que " + palpite 
55 GOTO 30
60 IF palpite > N THEN PRINT "O número correto é menor que " + palpite
70 GOTO 30

100 PRINT " Isso aí !Você acertou o número"
110 END
