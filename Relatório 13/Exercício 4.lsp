(defstruct ocorrencia
  nome
  ritual
  nivel-medo
  agentes-enviados)

(defun soma-medo-recursiva (lista-ocorrencias)
  (cond
    ((null lista-ocorrencias) 0)
    (t (+ (ocorrencia-nivel-medo (car lista-ocorrencias))
          (soma-medo-recursiva (cdr lista-ocorrencias))))))

(defun analise-final (lista-ocorrencias)
  (let* ((total-medo (soma-medo-recursiva lista-ocorrencias))
         (qtde (length lista-ocorrencias))
         (media (/ total-medo qtde))
         (criticas
          (remove-if-not
           (lambda (oc)
             (and (> (ocorrencia-agentes-enviados oc) 3)
                  (> (ocorrencia-nivel-medo oc) media)))
           lista-ocorrencias)))
    (mapcar #'ocorrencia-nome criticas)))

(let ((lista-testada
       (list
        (make-ocorrencia :nome "Incovacao maligna" :ritual "Invocacao" :nivel-medo 70 :agentes-enviados 4)
        (make-ocorrencia :nome "Bruxa do mal" :ritual "Aparicao" :nivel-medo 30 :agentes-enviados 2)
        (make-ocorrencia :nome "Casa das bruxas" :ritual "Possessao" :nivel-medo 90 :agentes-enviados 5)
        (make-ocorrencia :nome "Caverna assombrado" :ritual "Eco" :nivel-medo 50 :agentes-enviados 3)
        (make-ocorrencia :nome "Templo Perdido" :ritual "Ritual" :nivel-medo 85 :agentes-enviados 6))))
  (format t "~A~%" (analise-final lista-testada)))
