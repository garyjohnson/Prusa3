use <x-carriage.scad>
use <x-end-idler.scad>
use <x-end-motor.scad>
use <y-belt-holder.scad>
use <y-corners.scad>
use <y-idler.scad>
use <y-motor.scad>
use <z-axis-bottom.scad>
use <z-axis-top.scad>
use <spool-holder.scad>
use <fan-grill.scad>
use <motor-fan-duct.scad>
use <power-supply-cover.scad>
use <power-supply-switch-holder.scad>
use <belt-guide.scad>
use <endstop-holder.scad>

%translate([-100, -100, 0]) cube([200, 200, 0.1]);

module platter() {
translate([14, 74, 0]) rotate([0,0,-90]) x_end_idler();
translate([-62, 74, 0]) rotate([0,0,-90]) x_end_motor();
translate([-70, 73, 0]) rotate([0,0,90]) belt_holder();

translate([-86,11,0]) rotate([0,0,90]) corner();
translate([-86+24,11,0]) rotate([0,0,90]) corner();
translate([20,11,0]) rotate([0,0,90]) corner();
translate([52,-44,0]) rotate([0,0,0]) corner();

translate([-17, 25, 0]) rotate([0,0,-90]) y_idler();

translate([0,55,0]) rotate([0,0,-90-35+180]) y_motor(reversed=true);

translate([-51, 22, 0]) rotate([0,0,90]) z_top();
translate([56, 44, 0]) rotate([0,0,0]) mirror([0,1,0]) z_top();

translate([52, 58, 0]) rotate([0,0,180]) z_bottom_holder();
translate([-39, 1, 0]) rotate([0,0,90]) mirror([0,1,0]) z_bottom_holder();

translate([96-25,-16,0]) rotate([0,0,90]) spool_holder();
translate([-28-25,-16,0]) rotate([0,0,-90]) spool_holder();

translate([-98,-82,0]) fan_grill(size=40);
translate([-98,-40,0]) fan_grill(size=40);
translate([53,53,0]) fan_grill(size=45);

translate([73-58,-57,0]) {
	motor_fan_duct(size=40);
	belt_guide();
}
translate([25-58,-57,0]) {
	motor_fan_duct(size=40);
	belt_guide();
}

translate([75,-82,0]) rotate([0,0,90]) psu_cover();

translate([63,-86,0]) rotate([0,0,90]) switch_holder();
translate([-10,-85,0]) rotate([0,0,180]) y_clip();
#translate([53,-60,0]) rotate([0,0,90]) xz_clip();
#translate([70,-45,0]) rotate([0,0,0]) xz_clip();
}

platter();