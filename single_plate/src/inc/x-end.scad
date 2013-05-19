// PRUSA iteration3
// X end prototype
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

include <../../configuration.scad>
use <bearing.scad>
use <nuts_and_bolts.scad>

module roundedcube(v, r=0) {
 translate([0,r,r]) minkowski()
 {
  cube([v[0]/2,v[1]-r*2,v[2]-r*2]);
  rotate([0,90,0]) cylinder(r=r,h=v[0]/2, $fn=30);
 }
}

module x_end_base() {
  // Main block
  translate(v=[-14+17/2,-10-2-43/2,0]) rotate([0,0,90]) roundedcube(v=[43,17,55], r=3); //cube(size = [17,39+4,42], center = true);
  // Bearing holder
  vertical_bearing_base();	
  //Nut trap
  // Cube
  translate(v=[-5,-17,4]) cube(size = [10,16,8], center = true);
  // Hexagon
  translate(v=[0,-17,0]) rotate([0,0,30]) cylinder(h = 8, r=8, $fn = 6);
}

module x_end_holes() {
  vertical_bearing_holes();
  // Belt hole
  translate(v=[-5.5-10+1.5,-10-4/2,(35/2)+10]) cube(size = [10,43,35], center = true);
  // Bottom pushfit rod
  translate(v=[-14,-40,5]) rotate(a=[-90,0,0]) cylinder(r=8.3/2, h=50, $fn=30);
  // Top pushfit rod
  translate(v=[-14,-40,5+x_rod_distance]) rotate(a=[-90,0,0]) cylinder(r=8.3/2, h=50, $fn=30);
  // Nut trap
  translate(v=[0,-17,-1]) cylinder(h = 10, r=5.6/2);
  translate(v=[0,-17,4]) rotate([0,0,30]) nutHole(5.2);
}


// Final prototype
module x_end_plain()
{
 difference() {
  x_end_base();
  x_end_holes();
 }
}

x_end_plain();

