from gimpfu import *

def save_and_close(image, drawable):
    pdb.gimp_file_save(image, drawable, image.filename, image.filename)
    pdb.gimp_image_delete(image)

register(
    "python_fu_save_and_close",
    "Save and close the image",
    "Saves the current image and closes it",
    "Your Name", "Your Name", "2024",
    "<Image>/File/Save and Close",
    "*",
    [],
    [],
    save_and_close)

main()
