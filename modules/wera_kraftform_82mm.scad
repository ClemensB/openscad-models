// Copyright © 2024 Clemens Boos
// Licensed under the Creative Commons 4.0 BY-NC-SA license

include <BOSL2/std.scad>


// Wera Kraftform 82mm handle.
module wera_kraftform_82mm(extra_l, extra_r)
{
    length = 82;
    width_length_ratio = 25.5 / 82;
    
    rotate_extrude()
        scale([1 + extra_r / (width_length_ratio * length),
               1 + extra_l / length])
        scale(length)
        xflip()
        zrot(90)
        scale(0.7625 / 100)
        import("../assets/wera/kraftform_82mm_outline.svg");
}
