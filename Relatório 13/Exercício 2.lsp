(defstruct criatura
  nome
  ambiente
  periculosidade
  vida-media)
  
;; fiz em uma escala de 0 a 10 de vida
(defvar *catalogo*
  (list
    (make-criatura :nome "Safe Shallows Fish"
                   :ambiente "mar aberto"
                   :periculosidade "Baixa"
                   :vida-media 3)

    (make-criatura :nome "Reaper Leviathan"
                   :ambiente "ambiente úmido"
                   :periculosidade "Alta"
                   :vida-media 6)

    (make-criatura :nome "Criatura esquisita"
                   :ambiente "Deep"
                   :periculosidade "Media"
                   :vida-media 8)

    (make-criatura :nome "Monstro do Lago"
                   :ambiente "Deep"
                   :periculosidade "Media"
                   :vida-media 10)))


(defun filtra-por-perigo (catalogo)
  (remove-if
   (lambda (cri)
     (string= (criatura-periculosidade cri) "Baixa"))
   catalogo))


(defun relatorio-profundidade (catalogo)
  (let ((deep-only
         (remove-if-not
          (lambda (cri)
            (string= (criatura-ambiente cri) "Deep"))
          catalogo)))
    (mapcar
     (lambda (cri)
       (format nil "[~a]: Vive em ~a"    ;;esse ~a indica aonde o argumento deve ser colocado 
               (criatura-nome cri)
               (criatura-ambiente cri)))
     deep-only)))


(format t "~% - Original -~%")
(dolist (c *catalogo*)
  (format t "~a (~a) tem ~a vidas ~%"
          (criatura-nome c)
          (criatura-periculosidade c)
          (criatura-vida-media c)))

(format t "~% - Criaturas Perigosas -~%")
(let ((lista (filtra-por-perigo *catalogo*)))
  (dolist (c lista)
    (format t "~a - Taxa de perigo: ~a~%"
            (criatura-nome c)
            (criatura-periculosidade c))))

(format t "~% - Ambiente Deep - ~%")
(let ((result (relatorio-profundidade *catalogo*)))
  (dolist (linha result)
    (format t "~a~%" linha)))
