// PRUSA iteration3
// X end motor
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

include <../configuration.scad>
use <inc/x-end.scad>

// increase this if the motor hits the electronics.
// for example, when using an arduino, the motor may block the RAMPS reset button if this value is zero.
motor_separation = 10;

module x_end_motor_base(){
 x_end_base();
 translate(v=[-14,31+motor_separation/2,26.5-23/2]) cube(size = [17,44+motor_separation,30], center = true);
 translate(v=[-14,31-24/2+motor_separation/2,47/2]) cube(size = [17,20+motor_separation,47], center = true);
}

module x_end_motor_holes(){
 x_end_holes();

 translate([-40,-45,0]) cube([40,20,60]);
 translate([-10,-22,11]) roundedcube([10,12,33], 4);
 translate([-25,-22,11]) roundedcube([10,30,33], 4);

 // Position to place
 translate(v=[-0,32+motor_separation,21]){
  *translate([-4,-0.5-motor_separation/2,11]) cube([20,44+motor_separation,44], center=true);
  
  hull() {
    translate([-9, 14, -12]) cube([10,14,20], center=true);
    translate([0, -15-motor_separation, -12]) cube([10,14,20], center=true);
  }

  hull() {
    translate([-18,2.5,-3]) {
      translate([1,0,0]) rotate([90,0,0]) cylinder(r=4/2, h=25+motor_separation, $fn=20);
      translate([10,0,0]) rotate([90,0,0]) cylinder(r=4/2, h=25+motor_separation);
      translate([1,0,14]) rotate([90,0,0]) cylinder(r=4/2, h=25+motor_separation, $fn=20);
      translate([10,0,23]) rotate([90,0,0]) cylinder(r=4/2, h=25+motor_separation);
    }
  }
  translate(v=[-2,-10-motor_separation/2+6,7]) cube(size = [20,25+motor_separation,40], center = true);
  translate(v=[-6,-(32+motor_separation)+15.5,7]) cylinder(r=12/2, h = 40, center=true, $fn=30);

  // Motor mounting holes
  translate([0,0,-21+(x_rod_distance/2)+5]) {
  translate(v=[-10,-15.5,-15.5]) rotate([0,90,0]) cylinder(h=30, r=4.4/2, center=true);
  translate(v=[-10,-15.5,15.5]) rotate([0,90,0]) cylinder(h=30, r=4.4/2, center=true);
  translate(v=[-10,15.5,-15.5]) rotate([0,90,0]) cylinder(h=30, r=4.4/2, center=true);
  translate(v=[-10,-15.5,-15.5]) rotate([0,90,0]) cylinder(h=14, r=7/2, center=true);
  translate(v=[-10,-15.5,15.5]) rotate([0,90,0]) cylinder(h=14, r=7/2, center=true);
  translate(v=[-10,15.5,-15.5]) rotate([0,90,0]) cylinder(h=14, r=7/2, center=true);
  }
  translate([-10,-1,6]) hull() {
	translate([0,-8,-8]) rotate([0,90,0]) cylinder(h=30, r=4.4/2, center=true);
	translate([0,30,-8]) rotate([0,90,0]) cylinder(h=30, r=4.4/2, center=true);
	translate([0,-8,30]) rotate([0,90,0]) cylinder(h=30, r=4.4/2, center=true);
	translate([0,30,30]) rotate([0,90,0]) cylinder(h=30, r=4.4/2, center=true);
  }
  translate([-10,0,7]) hull() {
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

 // side nut trap for Z endstop
 difference() {
   translate([0,13,46]) {
     difference() {
       hull() {
         cylinder(r=10/2, h=4, $fn=20);
         translate([-10/2, -10/2, -8]) cube([10, 1, 12]);
       }

       translate([0,0,-10]) cylinder(r=3.5/2, h=20, $fn=6);
       translate([0,-1,0]) {
         cylinder(r=6/2, h=3, $fn=6);
         translate([-6/2, 0, 0]) cube([6, 10, 3]);
       }
       translate([-12/2, 4, -10/2]) cube([12, 6, 10]);
     }
   }

   
 }
}

x_end_motor();