(define (merge-layers-export-to-png xcf-file png-file)
  (let* ((image (car (gimp-file-load RUN-NONINTERACTIVE xcf-file xcf-file)))
         (drawable (car (gimp-image-merge-visible-layers image CLIP-TO-IMAGE))))
    (file-png-save-defaults RUN-NONINTERACTIVE image drawable png-file png-file)
    (gimp-image-delete image)))
