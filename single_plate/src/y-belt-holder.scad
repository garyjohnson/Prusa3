// PRUSA iteration3
// Y belt holder
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

include <../configuration.scad>

belt_elevation = 3;

module belt_holder_base(){
 translate([-33-8.5,-belt_elevation,-1]) cube([33,15,16]); 
 translate([-33-8.5,11,-1]) cube([33,15,16]);
 translate([-50-7,22,-1]) cube([50+14,4,16]);
}

module belt_holder_beltcut(){
 position_tweak=-0.2;
 // Belt slit
 translate([-66,-0.5+10-belt_elevation,belt_tooth_distance]) cube([67,1.4,15]);
 // Smooth insert cutout
 translate([-66,-0.5+10-belt_elevation,12]) rotate([45,0,0]) cube([67,15,15]);
 // Individual teeth
 *for ( i = [0 : 23] ){
  translate([0-i*belt_tooth_distance+position_tweak,-0.5+8-belt_elevation,3]) cube([belt_tooth_distance*belt_tooth_ratio+0.2,3,15]);
 }
 // Middle opening
 translate([-2-25,-1-belt_elevation,3]) cube([4,11,15]);	
}

module belt_holder_holes(){
 hull() {
  translate([-4.5+7,0,7.5]) rotate([-90,0,0]) cylinder(h=30, r=1.7, $fn=10);
  translate([-4.5,0,7.5]) rotate([-90,0,0]) cylinder(h=30, r=1.7, $fn=10);
 }
 hull() {
  translate([-45.5,0,7.5]) rotate([-90,0,0]) cylinder(h=30, r=1.7, $fn=10);
  translate([-45.5-7,0,7.5]) rotate([-90,0,0]) cylinder(h=30, r=1.7, $fn=10);
 }
}

// Final part
module belt_holder(){
 translate([0,0,1]) difference(){
  belt_holder_base();
  belt_holder_beltcut();
  belt_holder_holes();
 }
}

belt_holder();
