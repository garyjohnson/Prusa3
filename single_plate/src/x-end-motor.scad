// PRUSA iteration3
// X end motor
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <inc/x-end.scad>

// increase this if the motor hits the electronics.
// for example, when using an arduino, the motor may block the RAMPS reset button if this value is zero.
motor_separation = 10;

module x_end_motor_base(){
 x_end_base();
 translate(v=[-14,31+motor_separation/2,26.5-23/2]) cube(size = [17,44+motor_separation,30], center = true);
 translate(v=[-14,31-24/2+motor_separation/2,26.5]) cube(size = [17,20+motor_separation,53], center = true);

}

module roundedcube(v, r=0) {
 translate([0,r,r]) minkowski()
 {
  cube([v[0]/2,v[1]-r*2,v[2]-r*2]);
  rotate([0,90,0]) cylinder(r=r,h=v[0]/2);
 }
}


module x_end_motor_holes(){
 x_end_holes();

 translate([-40,-45,0]) cube([40,20,60]);
 translate([-10,-22,15]) roundedcube([10,12,30], 4);
 translate([-25,-22,15]) roundedcube([10,30,30], 4);

 // Position to place
 translate(v=[-0,32+motor_separation,30.25]){
  translate([-4,-0.5-motor_separation/2,2]) cube([20,44+motor_separation,44], center=true);
  
  hull() {
    translate([-9, 14, -25]) cube([10,14,12], center=true);
    translate([0, -15-motor_separation, -25]) cube([10,14,12], center=true);
  }

  // Belt hole
  hull() {
    translate(v=[-14+5/2,-20-motor_separation/2,0]) cube(size = [10-5,25+motor_separation,20], center = true);
    translate(v=[-14,-20-motor_separation/2,0-5/2]) cube(size = [10,25+motor_separation,20-5], center = true);
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