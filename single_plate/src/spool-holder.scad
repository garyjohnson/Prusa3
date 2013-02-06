// spool holder for the Prusa i3
// designed by EiNSTeiN_ <einstein@g3nius.org>

clip_width = 10;
clip_thickness = 6;
clip_height = 25;
plate_thickness = 6.2;
beam_thickness = 4;
beam_height = 90;
beam_width = clip_thickness*2+plate_thickness;
bar_diameter = 10;
bar_outer_diameter = bar_diameter+6;
cross_thickness = 3;

difference() {
union() {
cube([beam_width, clip_height, clip_width]);
hull() {
cube([beam_width, clip_height, cross_thickness]);
translate([beam_width/2-beam_thickness/2, clip_height, 0]) cube([beam_thickness, beam_height-20, cross_thickness]);
}
}
#translate([clip_thickness, 0,0]) cube([plate_thickness, clip_height-4, clip_width]);
}

translate([beam_width/2-beam_thickness/2, clip_height, 0]) cube([beam_thickness, beam_height, clip_width]);

translate([beam_width/2, clip_height+beam_height+bar_outer_diameter/2-2, 0]) 
difference() {
cylinder(r=bar_outer_diameter/2, h=clip_width);
cylinder(r=bar_diameter/2, h=clip_width);
translate([-bar_outer_diameter/2, 5,0]) cube([bar_outer_diameter, bar_outer_diameter/2, clip_width]);
translate([-bar_diameter/2+3/2, 0,0]) cube([bar_diameter-3, bar_outer_diameter/2, clip_width]);
}
