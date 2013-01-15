// PRUSA iteration3
// Y idler
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org


module y_idler_base(){
 translate(v = [0,0,0]) cylinder(h = 19, r=8);	
 translate(v = [0,20,0]) cylinder(h = 19, r=8);
 translate(v = [0,10,9.5]) cube(size = [16,20,19], center=true);
 translate(v = [-4,10,9.5]) cube(size = [8,16+20,19], center=true);
}

module y_idler_holes(){
 translate(v = [0,0,-1]) cylinder(h = 120, r=9/2);
 translate(v = [0,20,-1]) cylinder(h = 25, r=5.4);
 difference() {
   translate(v = [0,0,4]) cylinder(h = 11, r=22/2+3);

   // The fake bearing
   %translate([0,0,1+4+0.5]) cylinder(h = 8, r=(22/2)+2*0.66);

   // The two bumps around the center of the bearing
   translate([0,0,4]) cylinder(r1=15/2, r2=12/2,h=1.5);
   translate([0,0,9+6]) rotate([0,180,0]) cylinder(r1=15/2, r2=12/2,h=1.5);
}
}

// Final part
module y_idler(){
 translate(v = [0,0,8])rotate([0,-90,0]) difference(){
  y_idler_base();
  y_idler_holes();
 }
}

y_idler();
