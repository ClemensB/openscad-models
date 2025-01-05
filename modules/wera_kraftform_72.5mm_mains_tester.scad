// Copyright © 2024 Clemens Boos
// Licensed under the Creative Commons 4.0 BY-NC-SA license

include <BOSL2/std.scad>


// Wera Kraftform 72.5mm mains tester handle.
module wera_kraftform_72_5mm_mains_tester(extra_l, extra_r)
{
    length = 72.5;
    width_length_ratio = 23 / 72.5;
    
    rotate_extrude()
        scale([1 + extra_r / (width_length_ratio * length),
               1 + extra_l / length])
        scale(length)
        intersection()
        {
            zrot(90)
                translate([0, -0.5 / length, 0])
                scale(0.8513 / 100)
                translate([0, -17.735, 0])
                import("../assets/wera/kraftform_72.5mm_mains_tester_outline.svg");

            polygon([[0, 0], [0, 10], [2, 10], [2, 0]]);
        }
        
        scale([1, 1, 1 + extra_l / length])
        cylinder(h=length, d=2);
}
