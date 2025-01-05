/**
 * Gridfinity module for Facom screwdriver with 120mm handle
 *
 * Copyright © 2024 Clemens Boos
 * Licensed under the Creative Commons 4.0 BY-NC-SA license
 */

include <../../modules/screwdriver_holder.scad>
include <../../modules/facom_handle.scad>


handle_offset = 2.5;
clearance = 0.5;
ridge_left = true;
ridge_right = true;

$fa = 1;
$fs = 0.5;


screwdriver_holder(handle_offset, ridge_left, ridge_right)
    facom_handle_120mm(clearance);
