/**
 * Dummy 1.5x1.5 Gridfinity module (25mm height).
 *
 * Copyright © 2024 Clemens Boos
 * Licensed under the Creative Commons 4.0 BY-NC-SA license
 */
include <BOSL2/std.scad>

include <gridfinity_extended_openscad/modules/gridfinity_constants.scad>
include <gridfinity_extended_openscad/modules/module_gridfinity.scad>


// Total height
height = 25;

// Number of Gridfinity cells
num_xy = 1.5;


grid_block(num_z=height / gf_zpitch,
           num_x=num_xy, num_y=num_xy,
           lipStyle="none",
           cupBase_settings=CupBaseSettings(halfPitch=true));
