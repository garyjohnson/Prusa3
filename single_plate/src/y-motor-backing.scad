// PRUSA iteration3
// Y motor backing plate
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

module y_motor_backing_base(){

 // Front holding part
 hull() {
  translate(v = [-2,10-1,0]) cylinder(h = 10, r=11);
  translate(v = [-2,30+1,0]) cylinder(h = 10, r=11);
 }
}

module y_motor_backing_holes(){
 translate(v = [-2,10-1,-1]) cylinder(h = 12, r=5.4);	
 translate(v = [-2,30+1,-1])cylinder(h = 12, r=5.4);
 translate([0,-8,0]) cube([10,40,10]);
 translate([-7,-10,0]) cube([10,40,10]);
}

// Final part
module y_motor_backing(){
 mirror([1,0,0]) 
 difference(){
  y_motor_backing_base();
  y_motor_backing_holes();
 }
}

y_motor_backing();
