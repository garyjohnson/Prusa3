// PRUSA iteration3
// X end motor
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <inc/x-end.scad>

module x_end_motor_base(){
 x_end_base();
 translate(v=[-14,31,26.5-23/2]) cube(size = [17,44,30], center = true);
 translate(v=[-14,31-24/2,26.5]) cube(size = [17,20,53], center = true);

}

module x_end_motor_holes(){
 x_end_holes();
 // Position to place
 translate(v=[-0,32,30.25]){
  translate([-4,-0.5,2]) cube([20,44,44], center=true);
  
  #hull() {
    translate([-9, 14, -25]) cube([10,14,12], center=true);
    translate([0, -15, -25]) cube([10,14,12], center=true);
  }

  // Belt hole
  hull() {
    translate(v=[-14+5/2,-20,0]) cube(size = [10-5,25,20], center = true);
    translate(v=[-14,-20,0-5/2]) cube(size = [10,25,20-5], center = true);
  }

  // Motor mounting holes
  translate(v=[-10,-15.5,-15.5]) rotate([0,90,0]) cylinder(h=30, r=4.4/2, center=true);
  translate(v=[-10,-15.5,15.5]) rotate([0,90,0]) cylinder(h=30, r=4.4/2, center=true);
  translate(v=[-10,15.5,-15.5]) rotate([0,90,0]) cylinder(h=30, r=4.4/2, center=true);
  translate(v=[-10,-15.5,-15.5]) rotate([0,90,0]) cylinder(h=14, r=7/2, center=true);
  translate(v=[-10,-15.5,15.5]) rotate([0,90,0]) cylinder(h=14, r=7/2, center=true);
  translate(v=[-10,15.5,-15.5]) rotate([0,90,0]) cylinder(h=14, r=7/2, center=true);

  translate([-10,0,0]) hull() {
	translate([0,-8,-8]) rotate([0,90,0]) cylinder(h=30, r=4.4/2, center=true);
	translate([0,30,-8]) rotate([0,90,0]) cylinder(h=30, r=4.4/2, center=true);
	translate([0,-8,30]) rotate([0,90,0]) cylinder(h=30, r=4.4/2, center=true);
	translate([0,30,30]) rotate([0,90,0]) cylinder(h=30, r=4.4/2, center=true);
  }
  translate([-10,0,0]) hull() {
	translate([0,14,-8]) rotate([0,90,0]) cylinder(h=30, r=4.4/2, center=true);
	translate([0,8,-14]) rotate([0,90,0]) cylinder(h=30, r=4.4/2, center=true);
	translate([0,-8,-14]) rotate([0,90,0]) cylinder(h=30, r=4.4/2, center=true);
	translate([0,-14,-8]) rotate([0,90,0]) cylinder(h=30, r=4.4/2, center=true);
	translate([0,-14,8]) rotate([0,90,0]) cylinder(h=30, r=4.4/2, center=true);
	translate([0,-8,14]) rotate([0,90,0]) cylinder(h=30, r=4.4/2, center=true);
	translate([0,8,14]) rotate([0,90,0]) cylinder(h=30, r=4.4/2, center=true);
	translate([0,14,8]) rotate([0,90,0]) cylinder(h=30, r=4.4/2, center=true);
  }
 }
}

// Final part
module x_end_motor(){
 difference(){
  x_end_motor_base();
  x_end_motor_holes();
 }
}

x_end_motor();