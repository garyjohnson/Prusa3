// PRUSA iteration3
// Compact extruder
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <inc/42BYG48HJ50.scad>;

// supported hotends: jhead
// comment the line to disable
with_hotend_mount = "jhead";

// extruder body.
for(i=[0,1]) mirror([i,0,0])
translate([-6,0,0]+i*[-14,-14,0]) extruder(hotend=with_hotend_mount, is_mirror=i);

// idler
for(i=[0,1]) mirror([i,0,0])
translate([19+30, -9, 11]+i*[-110,-18,0]) rotate([0,180,i*-90]) idler();

// printed rods for the 608zz bearings.
for(i=[0,1]) mirror([i,0,0])
translate([6, 35, 0]+i*[-12,-10,0]) cylinder(r=8/2, h=14);

translate([-34, -42, 11.2]) rotate([-90,0,0]) translate([-16,-54,24]) union() {
//translate([3,10,0]) {
	union() {
		translate([0,2,0]) extruder_hotend(with_hotend_mount);
		translate([0,2,52]) mirror([0,0,1]) extruder_hotend(with_hotend_mount);
	}
}

///-

module motor() {
	motor_42BYG48HJ50(mini_hyena=true);
}

module nut(d,h,horizontal=true){
    cornerdiameter =  (d / 2) / cos (180 / 6);
    cylinder(h = h, r = cornerdiameter, $fn = 6);
    if(horizontal){
        for(i = [1:6]){
            rotate([0,0,60*i]) translate([-cornerdiameter-0.2,0,0]) rotate([0,0,-45]) cube([2,2,h]);
        }
    }
}

module bolt(length=10, d=3.3) {
	cylinder(r=d/2,h=length);
	translate([0,0,length]) cylinder(r=d*1.5/2,h=3);
}

module jhead_mount(second_extruder=false) {
   top_d=16;
   top_h=5;
   groove_d=12.3;
   groove_h=4.2;

   difference() {
	// body
	union() {
	
      translate([0,54,0]) {
		// main cube
		translate([-2,0,3/2+3]) cube([top_d+14,top_h+groove_h,24]);

		// rounded corner
		hull() {
			translate([3/2-2, 0, 3/2+3]) rotate([-90,0,0]) cylinder(r=3/2, h=top_h+groove_h, $fn=20);
			translate([2+top_d+10-3/2, 0, 3/2+3]) rotate([-90,0,0]) cylinder(r=3/2, h=top_h+groove_h, $fn=20);
		}

		// tabs for screws
		translate([41-10,2-10,12-2]) rotate([-90,-90,180]) {
	   		translate([0,0,-17-10+10]) {
				translate([0, 0, -0.2]) cylinder(r=10/2,h=9.2);
				translate([-5, 0, -0.2]) cube([10,5,9.2]);
			}
		}
	 }
     }
     translate([0,0,1.8]) union() {
		// filament path through the top
		translate([16,40,11]) rotate([-90,0,0]) cylinder(r=4/2, h=20, $fn=20);
		// j-head recess cutout
		translate([16,54,11]) rotate([-90,0,0]) cylinder(r=groove_d/2+0.5, h=top_h+groove_h+1);
		// j-head top cutout
		translate([16,54-0.2,11]) rotate([-90,0,0]) cylinder(r=top_d/2+0.5, h=top_h);
		*%translate([16,54-0.2,11]) rotate([-90,0,0]) cylinder(r=top_d/2+0.5, h=top_h);
		// middle space for sliding j-head in
		hull() {
	   		translate([1.5+11+3.5,54,11+(groove_d/2)+1]) rotate([-90,0,0]) cylinder(r=(groove_d+4)/2, h=top_h+groove_h+10);
	    		translate([1.5+11+3.5,54,11+15]) rotate([-90,0,0]) cylinder(r=(groove_d+4)/2, h=top_h+groove_h+1);
      	}
	   	*%translate([1.5+11+3.5,54,11+(groove_d/2)+1]) rotate([-90,0,0]) cylinder(r=(groove_d+4)/2, h=top_h+groove_h+10);
		// create snap-fit for top part
     	hull() {
	    		translate([1.5+11+3.5,54-0.2,11+(groove_d/2)-1]) rotate([-90,0,0]) cylinder(r=(groove_d+4)/2+0.5, h=top_h);
	    		translate([1.5+11+3.5,54-0.2,11+15]) rotate([-90,0,0]) cylinder(r=(groove_d+4)/2+0.5, h=top_h);
      	}
		
      	*hull() {
	    		translate([1.5+11+3.5,54+top_h+groove_h,11+(groove_d/2)-6]) rotate([-90,0,0]) cylinder(r=(groove_d+4)/2+0.5, h=top_h);
	    		translate([1.5+11+3.5,54+top_h+groove_h,11+15]) rotate([-90,0,0]) cylinder(r=(groove_d+4)/2+0.5, h=top_h);
      	}

		// sideways bolt to hold j-head in place
		translate([40,61,18.5]) rotate([0,-90,0]) bolt(length=40, d=3.6, $fn=20);
      	translate([5.5,61,18.5]) rotate([0,-90,0]) cylinder(h=10, r=6/2, $fn=20);

		// fan nut trap
	 	translate([7.5,58,-3.5/2+52/2-36/2]) rotate([0,-90,0]) union() {
		   	translate([0,0,-4]) cylinder(r=3.5/2,h=20,$fn=20);
		   	hull() {
	     		translate([1,0,0]) nut(5.8, 3);
	    			translate([-10,0,0]) nut(5.8, 3);
	   		}
		}

		// bolt through body for attaching to extruder
		translate([13-9-2,58-10,10]) rotate([-90,-90,180]) union() {
	   		translate([0,0,-17]) cylinder(r=4.3/2,h=25, $fn=20);
	   		translate([0,0,-17-25]) cylinder(r=7/2,h=25, $fn=20);
		}
		translate([41-10,58,10-2]) rotate([-90,-90,180]) union() {
	  		translate([0,0,-17]) cylinder(r=4.3/2,h=25, $fn=20);
	   		translate([0,0,-17-25+10]) cylinder(r=7/2,h=25, $fn=20);
		}
	}
   }
}

elongation = 36;

module extruder_body(is_mirror) {
 // Main body
 translate([14,0,0]) cube([16,66+elongation,52/2+4]);
 translate([9,57,0]) cube([37,9+elongation,26]);

 *translate([26,66,0]) cube([20,30,4]);
 *translate([40,66,0]) cube([6,30,20]);

 // Idler holder tab
 translate([19, 25, 0]) {
  translate([10,13.5+7.5,0]) {
	cube([6,7,10]);
     translate([6,3.5,0]) cylinder(r=3.5, h=10, $fn=25);
  }
 }
}

module extruder_holes(is_mirror) {
	translate([13,25-3+4,0]) {
		// Main shaft opening
		translate([5.5,0,-1]) cylinder(r=9, h=50);
		
		// Idler bearing cutout
		translate([19,-2,4]) cylinder(r=12, h=50);
	
		// screw hole for holding idler in place
		translate([22,17+6.5,15]) rotate([0,180,0]) bolt(25, 3.4, $fn=25);
	}

	// nicer filament path
	difference() {
		hull() {
			translate([15, 49+elongation, 30]) rotate([0,90,0]) cylinder(r=10/2, h=20, $fn=30);
			translate([15, 49+elongation, 15]) rotate([0,90,0]) cylinder(r=10/2, h=20, $fn=30);
			translate([15, 30, 15]) rotate([0,90,0]) cylinder(r=10/2, h=20);
		}
		hull() {
			translate([25, 59+elongation, 13]) rotate([90,0,0]) cylinder(r=6/2, h=30+elongation, $fn=20);
			translate([25, 59+elongation, 8]) rotate([90,0,0]) cylinder(r=6/2, h=30+elongation, $fn=20);
		}
		translate([30, 59+elongation, 12]) difference() {
			translate([-2, 0, -2]) rotate([90,0,0]) cube([2,2,30+elongation]);
			rotate([90,0,0]) cylinder(r=4/2, h=30+elongation, $fn=30);
		}
		hull() for(i=[0,1]) translate([32,61,8-i*10]) rotate([0,30,0]) cylinder(r=10/2, h=20, $fn=30);
	}

	translate([0,77+elongation,-16]) rotate([65,0,0]) cube([50,20,20]);

	// angle cut at entrance of filament path
	translate([20, 28, 9]) rotate([-30,0,0]) cube([10,5,20]);
	
	translate([22,0,26-4] - (is_mirror ? 1 : 0)*[8,0,0]) cube([8,20,8]);

	// nut and bolt hole for keeping both extruder parts together.
	translate([26,9,26]) rotate([0,90,0]) union() {
	   translate([0,0,-17]) cylinder(r=3.3/2,h=50, $fn=20);
	   if(is_mirror == 1) hull() {
	     translate([1,0,0]) nut(5.8, 3);
	     translate([-3,0,0]) nut(5.8, 3);
	   }
	}

	// remove material
	hull() for(x=[-2,17]) {
		translate([x,22,0]) cylinder(r=10/2, h=30);
		translate([x,50+elongation,0]) cylinder(r=10/2, h=30);
	}
	hull() for(x=[33,38]) {
		translate([x,70,0]) cylinder(r=10/2, h=30);
		translate([x,50+elongation,0]) cylinder(r=10/2, h=30);
	}
	translate([20.5,87,-5]) hull() for(i=[0,1]) translate([0,i*-37,0]) rotate([0,-10,0]) cylinder(r=4, h=16);
	translate([30,87,-5]) hull() for(i=[0,1]) translate([0,i*-18,0]) rotate([0,10,0]) cylinder(r=4, h=20);

	// Filament path
	translate([25,65+4+elongation,13]) rotate([90,0,0]) cylinder(r=4/2, h=70+elongation, $fn=20);

	// tiltscrew for idler
	union() {
		translate([12,-5+4,0]) cube([10,10-4,50]);
		translate([12+2+6,5+4,4.5]) tiltscrew();
	}

	// holes for motors
    for(i=[0,36]) {
	 translate([26,8+i,2]) rotate([0,0,180]) union() {
	   translate([0,0,-7]) cylinder(r=3.5/2,h=10);
	   hull() {
	     translate([1,0,0]) nut(5.8, 3);
	     translate([-7,0,0]) nut(5.8, 3);
	   }
	 }
    }

	// hole for holding extruder body to hotends holder
	translate([13,58+elongation,12]) rotate([-90,-90,180]) union() {
	   translate([0,0,-17]) cylinder(r=4.3/2,h=25, $fn=30);
	   translate([0,0,-17-25]) cylinder(r=7/2,h=25, $fn=30);
	   hull() {
	     translate([0,0,0]) nut(7, 10);
	     //translate([-10,0,0]) nut(7, 3);
	   }
	 }

	// hole for holding extruder body to hotends holder
	translate([41,58+elongation,10]) rotate([-90,-90,180]) union() {
	   translate([0,0,-17]) cylinder(r=4.3/2,h=25, $fn=30);
	   translate([0,0,-17-25]) cylinder(r=7/2,h=25, $fn=30);
	   hull() {
	     translate([0,0,0]) rotate([0,0,90]) nut(7, 3);
	     translate([0,0,2]) rotate([0,0,90]) nut(7, 3);
	   }
	 }

	// rounded corners
	translate([43,50,3]) difference() {
		translate([0,0,-3]) cube([3,20+elongation,3]);
		rotate([-90,0,0]) cylinder(r=6/2, h=20+elongation, $fn=30);
	}
	translate([13,50+elongation,4]) difference() {
		translate([-4,0,-4]) cube([4,20,4]);
		rotate([-90,0,0]) cylinder(r=8/2, h=20, $fn=30);
	}

	hull() {
		translate([49,67+elongation,30]) rotate([90,0,0]) cylinder(r=14/2,h=35+elongation);
		translate([49,67+elongation,24]) rotate([90,0,0]) cylinder(r=14/2,h=35+elongation);
		translate([10,67+elongation,30]) rotate([90,0,0]) cylinder(r=14/2,h=35+elongation);
		translate([10,67+elongation,24]) rotate([90,0,0]) cylinder(r=14/2,h=35+elongation);
	}

	for(i=[0,1]) translate([36, 61, 14]+i*[0,36,0]) rotate([-90,0,90]) union() {
		translate([0,0,-20]) cylinder(r=3.5/2,h=24, $fn=20);
		hull() {
	     	translate([0,1,0]) rotate([0,0,90]) nut(5.5, 3);
	     	translate([0,-5,0]) rotate([0,0,90]) nut(5.5, 3);
	     	*translate([0,-5,2]) rotate([0,0,90]) nut(5.5, 3);
	   	}
	}
}

module extruder_hotend(hotend=undef, second_extruder=false) {
 if(hotend == "jhead") {
   jhead_mount(second_extruder=second_extruder);
 }
}

module extruder_full(hotend=undef, is_mirror=false) {
  extruder_body(is_mirror);
  translate([18.5-10,26,0]) %rotate([180,0,-90]) motor();
}

module extruder_full_holes(is_mirror=false) {
  extruder_holes(is_mirror);
}

module tiltscrew() {
    for(r=[0:5:-30]) rotate([0,0,r])
      translate([-2,-15,0]) cube([3.4,20,7.4]);
    for(r=[0:5:-30]) rotate([0,0,r])
      translate([-10,0,7.4/2]) rotate([0,90,0]) cylinder(r=5/2,h=40, $fn=30);
}

module bearing() {
  difference() {
	rotate([0,90,0]) cylinder(r=22/2,h=8);
	rotate([0,90,0]) cylinder(r=8/2,h=8);
  }
}

module extruder_idler_base(bearing_indent){
  translate([0,10,3-0.5]) cube([19.5,34+6.5,8.5]);
  intersection() {
    translate([0,8,-(8)]) cube([19.5,36,8+3]);
    translate([0,25+5,6.1-bearing_indent]) rotate([0,90,0]) cylinder(r=16/2, h=19.5);
  }
  // bearing
  %translate([6,30,6]) bearing();
  // tab to connect the idler to the body
  translate([-3+8, 43+6.5, 11]) rotate([0,90,0]) {
	translate([0, 0, 3]) cube([8.5,5,7.5]);
     translate([8.5/2, 5, 3]) cylinder(r=8.5/2, h=7.5, $fn=30);
  }
}

module extruder_idler_holes(bearing_indent){
 translate([10,25+5,0]){
  // Main cutout
  difference() {
    cube([10,23,25], center= true);
    translate([3.7,0,4.1+2-bearing_indent]) rotate([0,90,0]) cylinder(r1=6, r2=8, h=1.3);
    translate([-5,0,4.1+2-bearing_indent]) rotate([0,90,0]) cylinder(r1=8, r2=6, h=1.3);
  }
  // Idler shaft
  translate([-8,0,4.1+2-bearing_indent]) rotate([0,90,0]) cylinder(r=4.1, h=16);
  hull() {
    translate([-8,0,4.1+2+6-bearing_indent]) rotate([0,90,0]) cylinder(r=6, h=16);
    translate([-8,0,4.1+2+6-bearing_indent]) rotate([0,90,0]) cylinder(r=6, h=16);
  }
 }

  hull() {
    translate([5.5,13,-1]) cylinder(r=5.5/2, h=15);
    translate([5.5,0,-1]) cylinder(r=5.5/2, h=15);
  }
  translate([0,48+6.5,11-8.4/2]) rotate([0,90,0]) bolt(25, 3.4, $fn=25);

  hull() {
  	cube([30,16+2,4]);
  	translate([0,2.5+2,-4]) cube([30,16,4]);
  }
  translate([5,0,0]) cube([10,20,4]);
}

// Idler final part
module idler(bearing_indent=-1) {
	difference() {
		extruder_idler_base(bearing_indent);
		extruder_idler_holes(bearing_indent);
	}
}

// Extruder final part
module extruder(hotend=undef, is_mirror=false){
	echo(is_mirror);
	difference() {
		extruder_full(hotend=hotend, is_mirror);
		extruder_full_holes(is_mirror);
	}
}
