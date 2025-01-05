/**
 * Gridfinity module for Wera screwdrivers with 82mm handle
 *
 * Copyright © 2024 Clemens Boos
 * Licensed under the Creative Commons 4.0 BY-NC-SA license
 */

include <../../modules/screwdriver_holder.scad>
include <../../modules/wera_kraftform_82mm.scad>


handle_offset = 25;
clearance = 1;
ridge_left = true;
ridge_right = true;

$fa = 1;
$fs = 0.5;


screwdriver_holder(handle_offset, ridge_left, ridge_right)
    wera_kraftform_82mm(clearance, 2 * clearance);
