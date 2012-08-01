(define-module fxxk
  (use gauche.generator)
  (export
    make-f**k))
(select-module fxxk)

(define (run-f**k codes)
  (let ([m (make-vector 32768 0)]
        [p 0])
    (let/cc brk
      (let %run ([codes codes])
        (if (null? codes)
          0
          (let1 code (car codes)
            (if (pair? code)
              (until (= (ref m p) 0)
                (%run code))
              (case code
                [(nxt) (inc! p)]
                [(prv) (dec! p)]
                [(inc) (inc! (vector-ref m p))]
                [(dec) (dec! (vector-ref m p))]
                [(get) (set! (vector-ref m p) (let1 c (read-byte)
                                                (if (eof-object? c) (brk 0) c)))]
                [(put) (write-byte (vector-ref m p)) (flush)]
                [else => (pa$ error "Unknown command:")]))
            (%run (cdr codes))))))))

(define (make-f**k :optional (binding '((nxt . ">")
                                        (prv . "<")
                                        (inc . "+")
                                        (dec . "-")
                                        (get . ",")
                                        (put . ".")
                                        (opn . "[")
                                        (cls . "]"))))
  (define (compile prog)
    (let1 matchgen (gmap ($ rassoc-ref binding $ rxmatch-substring $)
                         (grxmatch (string->regexp (string-join (map ($ regexp-quote $ cdr $) binding) "|"))
                                   prog))
      (let parse ([codes '()])
        (let1 p (matchgen)
          (if (eof-object? p)
            (reverse codes)
            (case p
              [(nxt prv inc dec get put)
               (parse (cons p codes))]
              [(opn)
               (parse (cons (parse '()) codes))]
              [(cls)
               (reverse codes)]
              [else
               (parse codes)]))))))

  (^[prog]
    (run-f**k (compile prog))))
