(define (script-fu-save-all-images)
  (do ((i 0 (+ i 1)))
      ((= i (car (gimp-image-list))))
    (let* (
          (image (vector-ref (car (cdr (gimp-image-list))) i))
          (drawable (car (gimp-image-get-active-drawable image)))
          (filename (car (gimp-image-get-filename image))))
        (gimp-file-save RUN-NONINTERACTIVE image drawable filename filename))))

(script-fu-register
 "script-fu-save-all-images"
 "Save all images"
 "Save all images"
 "Your Name"
 "Your Name"
 "2024"
 ""
 '()
 '()
)

(script-fu-menu-register "script-fu-save-all-images" "<Toolbox>/Xtns/Languages/Script-Fu/Utilities")

