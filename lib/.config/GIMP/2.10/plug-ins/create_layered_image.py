#!/usr/bin/env python

from gimpfu import *

def create_layered_image(input_image_1, input_image_2, output_path):
    # Load the first image
    image_1 = pdb.gimp_file_load(input_image_1, input_image_1)

    # Load the second image
    image_2 = pdb.gimp_file_load(input_image_2, input_image_2)

    # Add the second image as a new layer to the first image
    layer_2 = pdb.gimp_layer_new_from_visible(image_2, image_1, "Layer 2")
    pdb.gimp_image_insert_layer(image_1, layer_2, None, 0)

    # Create a layer mask for layer_2 with full opacity (white)
    layer_mask = pdb.gimp_layer_create_mask(layer_2, ADD_WHITE_MASK)
    pdb.gimp_layer_add_mask(layer_2, layer_mask)
    # Optionally, fill the mask with white explicitly if needed
    # pdb.gimp_bucket_fill(layer_mask, 0, 0, 100, False, False, 0, 0)

    # Save the combined image as an XCF file
    pdb.gimp_xcf_save(0, image_1, image_1.active_layer, output_path, output_path)

    pdb.gimp_quit(0)

register(
    "create_layered_image",
    "Create a new image with two layers from two PNG files.",
    "Create a new image with two layers from two PNG files.",
    "Your Name", "Your Name", "2024",
    "<Toolbox>/Xtns/Languages/Python-Fu/_Create Layered Image...",
    "",
    [
        (PF_FILE, "input_image_1", "Input Image 1", None),
        (PF_FILE, "input_image_2", "Input Image 2", None),
        (PF_STRING, "output_path", "Output Path", None),
    ],
    [],
    create_layered_image
)

main()
