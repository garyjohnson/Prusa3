// PRUSA iteration3
// X end idler
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <inc/x-end.scad>

module x_end_idler_base(){
 x_end_base();

   // The fake bearing
   %translate(v=[-5.5-(17/2)+(8/2),-25-2,30.25]) rotate(a=[0,-90,0]) cylinder(h = 8, r=(22/2)+2*0.66);

   // The two bumps around the center of the bearing

   translate([0,0,9+6]) rotate([0,180,0]) cylinder(r1=15/2, r2=12/2,h=1.5);
}

module x_end_idler_holes(){

 difference() {
   x_end_holes();
   translate(v=[-5.5-(17/2)+(8/2)+1,-25-2,30.25]) rotate(a=[0,-90,0]) cylinder(r1=15/2, r2=12/2,h=1);
   translate(v=[-5.5-17/2-8/2-1,-25-2,30.25]) rotate(a=[0,90,0]) cylinder(r1=15/2, r2=12/2,h=1);
}
 #translate(v=[-5.5,-25-2,30.25]) rotate(a=[0,-90,0]) cylinder(h = 17, r=4.2, $fn=30);
}

// Final part
module x_end_idler(){
 mirror([0,1,0]) difference(){
  x_end_idler_base();
  x_end_idler_holes();
 }
}

x_end_idler();


