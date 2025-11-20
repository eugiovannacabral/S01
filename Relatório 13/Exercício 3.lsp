(defstruct item
  nome
  tipo
  preco
  forca-magica)

(defvar *catalogo*
  (list
    (make-item :nome "Arma de fogo"
               :tipo "Arma"
               :preco 80
               :forca-magica 55)

    (make-item :nome "Pocao morte silenciosa"
               :tipo "Pocao"
               :preco 50
               :forca-magica 23)

    (make-item :nome "Esmeralda"
               :tipo "Artefato"
               :preco 1678
               :forca-magica 120)))

(defun adiciona-imposto (preco)
  (* preco 1.15))

(defun bonus-maldicao (forca)
  (if (> forca 80)
      (* forca 1.5)
      forca))

(defun processa-venda (catalogo)
  (let ((armas
         (remove-if-not
          (lambda (it)
            (string= (item-tipo it) "Arma"))
          catalogo)))
    (let ((armas-com-imposto
           (mapcar
            (lambda (it)
              (make-item
                :nome (item-nome it)
                :tipo (item-tipo it)
                :preco (adiciona-imposto (item-preco it))
                :forca-magica (item-forca-magica it)))
            armas)))
      (mapcar
       (lambda (it)
         (format nil "~a ->forca: ~a"
                 (item-nome it)
                 (bonus-maldicao (item-forca-magica it))))
       armas-com-imposto))))

(format t "~%Venda:~%")
(dolist (linha (processa-venda *catalogo*))
  (format t "~a~%" linha))
