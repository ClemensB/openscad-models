/**
 * Gridfinity module for Facom screwdriver with 96mm handle - Alternate version
 *
 * Alternative slim model with only one half-pitch Gridfinity row
 * and some overhang to perfectly fit the space left in my drawer.
 *
 * Copyright © 2024 Clemens Boos
 * Licensed under the Creative Commons 4.0 BY-NC-SA license
 */

include <../../modules/screwdriver_holder.scad>
include <../../modules/facom_handle.scad>


handle_offset = 13;
clearance = 0.5;
ridge_left = true;
ridge_right = true;

$fa = 1;
$fs = 0.5;


// Cut off part of one side
right_half(s=300, x=gf_pitch/2 - 8.5)
difference()
{
    screwdriver_holder(handle_offset, ridge_left, ridge_right, x_offset=3.7)
        facom_handle_96mm(clearance);

    // Cut off second Gridfinity half-pitch row
    cube([gf_pitch / 2, gf_pitch * num_y, 5],  anchor=BOTTOM+LEFT+FRONT);
}
