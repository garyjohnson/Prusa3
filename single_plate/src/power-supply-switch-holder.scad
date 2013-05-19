
switch_height = 25;
switch_width = 13;
switch_length = 19;
thickness = 2;


module switch_holder() {

 difference() {
  union() {
   cube([switch_width+thickness*2, switch_length+thickness*2, switch_height]);
   hull() {
    translate([0, switch_length+10, 14/2]) rotate([0, 90, 0]) cylinder(r=14/2, h=4);
    translate([0, switch_length, 0]) cube([4, 10, 14]);
   }
  }
  translate([-1, switch_length+10, 14/2]) rotate([0, 90, 0]) cylinder(r=5/2, h=6);
  translate([thickness, thickness, 0]) cube([switch_width, switch_length, switch_height]);
  translate([(switch_width+thickness*2)/2-6/2, thickness/2, switch_length]) cube([6, switch_length+thickness, 3]);
 }
 
}

switch_holder();