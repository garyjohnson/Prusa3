// PRUSA iteration3
// 624 bearing belt guide
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

include <../configuration.scad>;
include <inc/nuts_and_bolts.scad>;

wall = layer_width * 3;
clearence = 0.3;

bearings = [
 [ 8, 22, 7 ], // 608 bearing
 [ 4, 13, 5 ], // 624 bearing
];

function inner_diameter() = bearings[bearing_y_idler][0];
function outer_diameter() = bearings[bearing_y_idler][1];
function thickness() = bearings[bearing_y_idler][2];

module belt_guide_base(){
 cylinder(r=(outer_diameter()/2)+wall+clearence, h=(thickness()/2) + wall + 0.5, $fn=50);
 cylinder(r=(outer_diameter()/2)+wall+clearence+wall, h=wall, $fn=50);
}

module belt_guide_holes(){
 translate([0,0,wall]) cylinder(r=(outer_diameter()/2)+clearence, h=10, $fn=50);
 translate([0,0,-1]) cylinder(r=(inner_diameter()/2)+clearence, h=10, $fn=50);
}

// Final part
module belt_guide(){
 difference(){
  belt_guide_base();
  belt_guide_holes();
 }
}

belt_guide();