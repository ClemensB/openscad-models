// Copyright © 2024 Clemens Boos
// Licensed under the Creative Commons 4.0 BY-NC-SA license

include <BOSL2/std.scad>

include <gridfinity_extended_openscad/modules/gridfinity_constants.scad>
include <gridfinity_extended_openscad/modules/module_gridfinity.scad>

include <../../modules/wera_star.scad>


// Total height
height = 25;

// Clearance on each side of the star
clearance = 0.5;

// Number of Gridfinity cells
num_xy = 1.5;

// Inset of the star in the bottom plate
star_inset = 2.5;


center_pos_xy = 0.5 * num_xy * gf_pitch;
center_pos = [center_pos_xy, center_pos_xy, 0];

// Star XY scaling to include clearance
star_scaling = 1 + clearance * 2 / wera_star_width;
    
difference()
{
    grid_block(num_z=height/gf_zpitch,
            num_x=num_xy, num_y=num_xy,
            lipStyle="none",
            cupBase_settings=CupBaseSettings(halfPitch=true));

    center_pos_xy = 0.5 * num_xy * gf_pitch;
    star_start_pos = center_pos_xy - wera_star_width / 2 - clearance;
    
    // Cut out everything except corners
    up(gf_zpitch + star_inset)
    difference()
    {
        cube([num_xy * gf_pitch,
              num_xy * gf_pitch,
              height - gf_zpitch],
             anchor=BOTTOM+LEFT+FRONT);
        
        for (a = [0:90:270])
        {
            zrot(a, cp=center_pos)
                cube([star_start_pos + wera_star_tip_start_pos,
                      star_start_pos + wera_star_tip_start_pos,
                      height - gf_zpitch],
                     anchor=BOTTOM+LEFT+FRONT);
        }
    }
    
    // Cut out star shape
    back(star_start_pos) right(star_start_pos)
        up(gf_zpitch)
        linear_extrude(height - gf_zpitch)
        scale([star_scaling, star_scaling, 1])
        wera_star();
    
    // Cut out rounded shape
    up(gf_zpitch + 7.9)
    back(center_pos_xy) right(center_pos_xy)
        sphere(d=num_xy * gf_pitch * 3, anchor=BOTTOM, $fa=1, $fs=0.2);
}