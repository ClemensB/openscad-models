// Copyright © 2024 Clemens Boos
// Licensed under the Creative Commons 4.0 BY-NC-SA license

wera_star_width = 47.8;
wera_star_tip_width = 14.2;
wera_star_corner_distance = 14.3;

wera_star_tip_start_pos = wera_star_width / 2 - wera_star_tip_width / 2;


// 2D shape of the Wera Star magnetizer.
module wera_star()
{
    polygon([
        [wera_star_tip_start_pos, 0],
        [wera_star_tip_start_pos + wera_star_tip_width, 0],
        [wera_star_width - wera_star_corner_distance, wera_star_corner_distance],
        [wera_star_width, wera_star_tip_start_pos],
        [wera_star_width, wera_star_tip_start_pos + wera_star_tip_width],
        [wera_star_width - wera_star_corner_distance, wera_star_width - wera_star_corner_distance],
        [wera_star_tip_start_pos + wera_star_tip_width, wera_star_width],
        [wera_star_tip_start_pos, wera_star_width],
        [wera_star_corner_distance, wera_star_width - wera_star_corner_distance],
        [0, wera_star_tip_start_pos + wera_star_tip_width],
        [0, wera_star_tip_start_pos],
        [wera_star_corner_distance, wera_star_corner_distance]
    ]);
}
