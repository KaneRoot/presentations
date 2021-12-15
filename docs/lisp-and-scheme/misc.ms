.SECTION LISP vs Scheme
.PARAGRAPH_INDENTED
Scheme dialects are LISP but trying to be more minimalistic.
Both Common LISP and Scheme are standardized, but the many Scheme dialects do not implement the full standard.
This leads to incompatibilities and prevents a shared library for all Scheme dialects to exist.

LISP and Scheme dialects have a lot in common, actually they share most of their syntax and properties.
Going from a dialect to another may even be for purely aesthetic reasons.
In fact, dialects are so absurdly similar they can be
.UL translated
from one to another\*[*].
.FS
Some basic functions from a dialect to another can be translated automatically.
There are websites providing the equivalence between basic functions names in Common LISP and in Scheme.
.FE
.SECTION Macros
.PARAGRAPH_INDENTED
Macros are functions evaluated and called at runtime.
They have
.B NOTHING
special besides
.B WHEN
they are evaluated and called.
Combined with the homoiconicity of the language, they can produce or change the behavior of the language, without any special syntax.
That's the beauty of it.

A great macro is abstract enough to be useful in many contexts, while producing a very specialized code for each context.
.SUBSECTION Hygienic vs Non Hygienic Macros
.PARAGRAPH_INDENTED
The difference between hygienic and non hygienic macros is about the possible side-effects of using functions or variables in the macro that could have been altered.
.SECTION_NO_NUMBER Common LISP non Hygienic Macro
.SOURCE LISP ps=8 vs=9p
;; Transform (unless cond body...) into
;; (if (not cond) (progn body...)).
(defmacro unless (condition &body body)
  `(if (not ,condition)
     (progn
     ,@body))
.SOURCE
.BELLOWEXPLANATION1
In this example, "if" and "not" could have been locally changed prior the macro call.
.TBD
.BELLOWEXPLANATION2
.SECTION_NO_NUMBER Scheme Hygienic Macro
.SOURCE Scheme ps=8 vs=9p
(define-syntax unless
  (syntax-rules ()
      ((unless condition body ...)
           (if (not condition) (begin body ...)))))
.SOURCE
.BELLOWEXPLANATION1
.BELLOWEXPLANATION2

.SECTION Implementations

.SECTION_NO_NUMBER Common LISP
.BULLET Common LISP
.BULLET SBCL
.BULLET Clasp
.BULLET Emacs LISP
.ENDBULLET

.SECTION_NO_NUMBER Scheme
.BULLET Clojure
.BULLET Racket
.BULLET GNU Guile
.BULLET Chicken
.ENDBULLET
