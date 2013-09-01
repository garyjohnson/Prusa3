// PRUSA iteration3
// Y motor mount
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

//include <configuration.scad>

module quarter_round(r,h) {
  difference() {
    cube(size = [r,r,h]);
    translate([r,r,-1]) cylinder(r=r,h=h+2);
  }
}

module y_motor_base(){
 // Motor holding part
 translate(v = [29,-21+50,0]){
  translate(v = [-21+4.5,0,5]) cube(size = [9,31,10], center=true);
  translate(v = [-15.5,-15.5,0]) cylinder(h = 10, r=5.5);
  translate(v = [-15.5,+15.5,0]) cylinder(h = 10, r=5.5);
  // Joins motor holder and rod plate
  translate(v = [-29,-21,0]) cube(size = [14,30,10]);
  translate(v = [-29+3+5,-21+30,0]) rotate([0,0,90]) quarter_round(r=5/2,h=10);
 }
 // Front holding part
 translate(v = [-2,10-1,0]) cylinder(h = 10, r=9);
 translate(v = [-2,20,5])cube(size = [16,20,10], center=true);	
 translate(v = [-2,30+1,0])cylinder(h = 10, r=9);
}

module y_motor_holes(){
 translate(v = [29,-21+50,0]){
  // Screw head holes
  translate(v = [-15.5,-15.5,-1]) cylinder(h = 10, r=4/2);
  translate(v = [-15.5,+15.5,-1]) cylinder(h = 10, r=4/2);
  // Screw holes
  translate(v = [-15.5,-15.5,6.5]) cylinder(h = 7, r=3.5);
  translate(v = [-15.5,+15.5,6.5]) cylinder(h = 7, r=3.5);
 }
 translate(v = [-2,10-1,-1]) cylinder(h = 12, r=5.4);
 translate(v = [-2,30+1,-1])cylinder(h = 12, r=5.4);
}

// Final part
module y_motor(reversed=false){
 mirror([reversed ? 1 : 0, 0, 0])
 difference(){
  y_motor_base();
  y_motor_holes();
 }
}

y_motor(reversed=true);
