

module y_clip() {

  thickness = 8;
  rod = 10;
  length = 30;

  difference() {
    cylinder(r=rod/2 + 2, h=thickness);
    cylinder(r=rod/2, h=thickness);
    translate([0, -(rod - 1) / 2, 0]) cube([10, rod - 1, thickness]);
    translate([(rod / 2) - 1, -(rod + 4) / 2, 0]) cube([10, rod + 4, thickness]);

    // tiewrap slit.
    hull() {
      translate([-rod/2-3,-5,3]) cube([2,10,3]);
      translate([-rod/2-5,-5,3]) cube([2,10,5]);
    }
  }

  difference() {
    translate([-length-rod/2, -6/2, 0]) cube([length, 6, 3]);
    #for(i=[0:4]) translate([-length-rod/2+3+(i*5.5),0,0]) cylinder(r=4/2, h=6);
  }
}

y_clip();

module xz_clip() {
  thickness = 8;
  rod = 8.3;
  holes_distance = 19; // between the two screw holes on the switch.
  slit_height = 4;
  
  difference() {
    union() {
      translate([-3-rod/2,-(holes_distance+6)/2,0]) cube([4, holes_distance+6, thickness]);
      cylinder(r=rod/2 + 2, h=thickness);
    }
    cylinder(r=rod/2, h=thickness);
    translate([0,0,thickness/2-slit_height/2]) difference() {
      cylinder(r=rod/2 + 4, h=slit_height);
      cylinder(r=rod/2 + 2, h=slit_height);
    }
    translate([0, -(rod - 1) / 2, 0]) cube([10, rod - 1, thickness]);
    translate([(rod / 2) - 1, -(rod + 4) / 2, 0]) cube([10, rod + 4, thickness]);

    for(i=[-1,1]) translate([-20,i*(holes_distance/2),thickness/2]) rotate([0,90,0]) cylinder(r = 4/2, h = 20);
  }
}

*xz_clip();
