// PRUSA iteration3
// Y frame corners
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

bed_elevation = 6;

module corner_base(){	
 translate([-9,-11,0]) cube([18,22,47+bed_elevation]);
}

module corner_holes(){
 translate([-11,-11,0]){
  // Bottom hole
  translate([0,11,10-1]) rotate([0,90,0]) translate([0,0,-5]) cylinder(h = 270, r=5.4, $fn=30);
  // Top hole
  translate([0,11,30+1]) rotate([0,90,0]) translate([0,0,-5]) cylinder(h = 270, r=5.4, $fn=30);
  // Middle hole
  translate([11,0,20]) rotate([0,0,90]) rotate([0,90,0]) translate([0,0,-5]) cylinder(h = 270, r=5.4, $fn=30);

  // Washer hole
  translate([11,-3+7,20]) rotate([0,0,90]) rotate([0,90,0]) translate([0,0,-5]) cylinder(h = 3, r1=11, r2=11, $fn=30);

  // Top smooth rod insert
  // Smooth rod place
  translate([11,2,45+bed_elevation]) rotate([0,90,90]) cylinder(h = 270, r=4.2, $fn=30); 
  // Ziptie
  translate([-5,9,39+bed_elevation])  cube([30,3.5,2]);
 }
}

module corner_fancy(){
 // Side corner cutouts
  translate([-8,-9,0]) rotate([0,0,-45-180]) translate([-15,0,-1]) cube([30,30,51+bed_elevation]);
  translate([8,-9,0]) rotate([0,0,45-180]) translate([-15,0,-1]) cube([30,30,51+bed_elevation]);
 // Top corner cutouts
  translate([7,0,49-2+bed_elevation]) rotate([0,45,0]) translate([-15,-15,0]) cube([30,30,30]);
  translate([-7,0,49-2+bed_elevation]) rotate([0,-45,0]) translate([-15,-15,0]) cube([30,30,30]);
  rotate([0,0,90]){
   translate([-9,0,49-2+bed_elevation]) rotate([0,-45,0]) translate([-15,-15,0]) cube([30,30,30]);
  }
}


// Final part
module corner(){
 // Rotate the part for better printing
 translate([0,0,0]) rotate([0,0,0]) difference(){
  corner_base();
  corner_holes();
  corner_fancy();
 }
}

corner();
