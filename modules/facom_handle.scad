// Copyright © 2024 Clemens Boos
// Licensed under the Creative Commons 4.0 BY-NC-SA license

include <BOSL2/std.scad>


// Generic Facom handle based on STL from TraceParts.
module facom_handle(stl_path, length, diameter, clearance)
{
    extra_d = 1 + 2 * clearance;
    extra_l = clearance;

    xrot(90)
    scale([1 + extra_d / diameter,
           1 + extra_l / length,
           1 + extra_d / diameter])
        back_half(s=150)
        back(length)
        xrot(90)
        rotate_extrude()
        intersection()
        {
            zrot(-90)
            projection(cut=false)
            import(stl_path, convexity=2);

            polygon([[0, 0], [0, 250], [20, 250], [20, 0]]);
        }
}

// 120mmx36mm Facom handle.
module facom_handle_120mm(clearance)
{
    facom_handle("../assets/facom/screwdriver_anxr30x125.stl", 121.5, 36, clearance);
}

// 110mmx30mm Facom handle.
module facom_handle_110mm(clearance)
{
    facom_handle("../assets/facom/screwdriver_anxr15x75.stl", 111, 30, clearance);
}

// 105mmx25mm Facom handle.
module facom_handle_105mm(clearance)
{
    facom_handle("../assets/facom/screwdriver_anxr10x75.stl", 105, 25, clearance);
}

// 96mmx19mm Facom handle.
module facom_handle_96mm(clearance)
{
    facom_handle("../assets/facom/screwdriver_anx7x50.stl", 96.5, 19, clearance);
}
