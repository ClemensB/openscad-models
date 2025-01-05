// Copyright © 2024 Clemens Boos
// Licensed under the Creative Commons 4.0 BY-NC-SA license

include <BOSL2/std.scad>

include <gridfinity_extended_openscad/modules/gridfinity_constants.scad>
include <gridfinity_extended_openscad/modules/module_gridfinity.scad>


// Total height
height = 25;

// Diameter of the cutout for the shaft
shaft_diameter = 10;

// Distance of the recess from the front
recess_pos = gf_pitch;

// Size of the gridfinity module
num_x = 1;
num_y = 3;


// Gridfinity screwdriver holder.
// Accepts upright model of the screwdriver handle as child.
module screwdriver_holder(handle_offset, ridge_left, ridge_right, x_offset=0)
{
    difference()
    {
        grid_block(num_z=height/gf_zpitch,
                   num_x=num_x,
                   num_y=num_y,
                   lipStyle="none",
                   cupBase_settings=CupBaseSettings(halfPitch=true));

        back(handle_offset)
            up(height)
            right(gf_pitch / 2 + x_offset)
            zrot(180)
            xrot(90)
            children();

        right(gf_pitch / 2 + x_offset)
            up(height)
            cylinder(gf_pitch, d=shaft_diameter, orient=BACK);


        if (ridge_left)
        {
            right(gf_pitch)
                up(height)
                cylinder(num_y * gf_pitch, d=shaft_diameter, orient=BACK);
        }

        if (ridge_right)
        {
            up(height)
                cylinder(num_y * gf_pitch, d=shaft_diameter, orient=BACK);
        }

        up(gf_zpitch)
        back(recess_pos)
        cube([gf_pitch, height, height - gf_zpitch + 0.1], anchor=BOTTOM+LEFT+FRONT);
    }
}
