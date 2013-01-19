use <x-carriage.scad>
use <x-end-idler.scad>
use <x-end-motor.scad>
use <y-belt-holder.scad>
use <y-corners.scad>
use <y-idler.scad>
use <y-motor.scad>
use <z-axis-bottom.scad>
use <z-axis-top.scad>


%translate([-100, -100, 0]) cube([200, 200, 0.1]);


module platter() {
translate([86, 42, 0]) x_carriage();
translate([6, 74, 0]) rotate([0,0,-90]) x_end_idler();
translate([-60, 74, 0]) rotate([0,0,-90]) x_end_motor();
translate([-70, 73, 0]) rotate([0,0,90]) belt_holder();

translate([-86,11,0]) rotate([0,0,90]) corner();
translate([-86+24,11,0]) rotate([0,0,90]) corner();
translate([20,11,0]) rotate([0,0,90]) corner();
translate([23,11+23,0]) rotate([0,0,0]) corner();

translate([-17, 25, 0]) rotate([0,0,-90]) y_idler();

translate([-45.5,79,0]) rotate([0,0,-90-45]) y_motor(reversed=true);

translate([-51, 22, 0]) rotate([0,0,90]) z_top();
translate([97, 18, 0]) rotate([0,0,180]) mirror([0,1,0]) z_top();

translate([52, 58, 0]) rotate([0,0,180]) z_bottom_holder();
translate([-39, 1, 0]) rotate([0,0,90]) mirror([0,1,0]) z_bottom_holder();
}

platter();
//rotate([0,0,180]) platter();