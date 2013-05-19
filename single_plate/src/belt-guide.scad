// PRUSA iteration3
// 624 bearing belt guide
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

wall = 0.2 * 2.2 * 2;
clearence = 0.2;
OD=22;
width=7;
flap=2;
ID=OD-2;


module belt_guide_base(){
 cylinder(r=OD/2+wall*2+clearence, h=width/2+wall, $fn=50);
 cylinder(r=OD/2+wall*2+clearence+flap, h=wall, $fn=50);
}

module belt_guide_holes(){
 translate([0,0,wall]) cylinder(r=OD/2+clearence, h=10, $fn=50);
 translate([0,0,-1]) cylinder(r=ID/2+clearence, h=10, $fn=50);
}

// Final part
module belt_guide(){
 difference(){
  belt_guide_base();
  belt_guide_holes();
 }
}

belt_guide();
