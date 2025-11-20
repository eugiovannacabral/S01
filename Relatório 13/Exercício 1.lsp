;;  que linguagem ruiim :(((

(defun calcula-dosagem (peso idade)
  (cond
    ((or (< idade 5) (< peso 20)) 10)
    ((and (<= 5 idade) (<= idade 12)) 25)
    (t 50)))

(defun ajusta-preco (preco-base nome-erva)
  (cond
    ((string= nome-erva "Ginseng") (* preco-base 3.0))
    ((string= nome-erva "Lotus") (* preco-base 1.5))
    (t preco-base)))

(format t "Farmacia do MAOMA~%")

(let* ((peso 60)
       (idade 14)
       (erva "Lotus")
       (preco-base 10)
       (dosagem (calcula-dosagem peso idade))
       (preco-final (ajusta-preco preco-base erva)))
  
  (format t "Idade: ~A anos  Peso: ~A kg~%" idade peso)
  (format t "Erva usada: ~A  Dosagem: ~A ml~%" erva dosagem)
  (format t "Preco final: ~A moedas~%" preco-final))
