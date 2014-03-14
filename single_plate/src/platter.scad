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
use <y-motor-backing.scad>

%translate([-100, -100, 0]) cube([200, 200, 0.1]);

module platter() {
translate([14, 74, 0]) rotate([0,0,-90]) x_end_idler();
translate([-62, 74, 0]) rotate([0,0,-90]) x_end_motor();
translate([-70, 73, 0]) rotate([0,0,90]) belt_holder();

translate([-79,11,0]) rotate([0,0,90]) corner();
translate([-79+24,11,0]) rotate([0,0,90]) corner();
translate([22,11,0]) rotate([0,0,90]) corner();
translate([88,6,0]) rotate([0,0,0]) corner();

translate([-15, 25, 0]) rotate([0,0,-90]) y_idler();

translate([0,55,0]) rotate([0,0,-90-35+180]) y_motor(reversed=true);

translate([-51, 22, 0]) rotate([0,0,90]) z_top();
translate([56, 44, 0]) rotate([0,0,0]) mirror([0,1,0]) z_top();

translate([52, 58, 0]) rotate([0,0,180]) z_bottom_holder();
translate([-36, 1, 0]) rotate([0,0,90]) mirror([0,1,0]) z_bottom_holder();

translate([77,-16,0]) rotate([0,0,90]) spool_holder();
translate([-98,-15,0]) rotate([0,0,-90]) spool_holder();

translate([53,53,0]) fan_grill(size=45);

translate([45,-60,0]) {
	translate([1,0,0]) belt_guide();
	translate([32,0,0]) belt_guide();
}

translate([90,-38,0]) rotate([0,0,0]) y_clip();
translate([73,18,0]) x_clip();
translate([85,25,0]) rotate([0,0,-90]) z_clip();

translate([-95,-76,0]) import("inc/Vision_12_Volt_Power_Supply_Cover_-_Final.stl");

translate([58,-40,0]) rotate([0,0,95]) y_motor_backing();
}

platter();