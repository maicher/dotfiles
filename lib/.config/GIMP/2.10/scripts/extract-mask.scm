(define (script-fu-extract-mask-to-png-cli input-path output-path)
  (let* ((image (car (gimp-xcf-load RUN-NONINTERACTIVE input-path input-path)))
      (drawable (car (gimp-image-get-active-drawable image))))
    (gimp-image-convert-grayscale image)
    ; Save as PNG
    (file-png-save RUN-NONINTERACTIVE
                   image drawable
                   output-path output-path
                   0 9 0 0 0 0 0)))
    ;(gimp-edit-fil 2 0))))
