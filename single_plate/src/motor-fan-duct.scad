
use <inc/PG35L.scad>;

motor_fan_duct(size=40);

%translate([0,0,60]) rotate([180,0,0]) PG35L(mini_hyena=true);


module nut(d,h,horizontal=true){
    cornerdiameter =  (d / 2) / cos (180 / 6);
    cylinder(h = h, r = cornerdiameter, $fn = 6);
    if(horizontal){
        for(i = [1:6]){
            rotate([0,0,60*i]) translate([-cornerdiameter-0.2,0,0]) rotate([0,0,-45]) cube([2,2,h]);
        }
    }
}

module motor_fan_duct(size=40) {
	// Body Parameters
	borderthickness=2;
	cornerradius=2;
	thickness=2;
	
	// Screw Hole Parameters
	screwradius=4/2;
	screwinset=4;
	
	// Spine Parameters
	spines=10;
	spinesize=2;
	spineoffset=7;
	spinerotation=0;

	wall_thickness=0.44*3;
	
	
	// Below are not parameters //
	
	// Calculate helper variables
	holeradius=size/2-borderthickness;

	translate([-size/2, -size/2, 0]) fan_grill();
	
	difference() {
		duct_flat();
		screw_holes();
	}
	intersection() {
		hull() duct_flat(height=60);
		screw_shell();
	}
	intersection() {
		hull() duct_flat(height=60);
		for(i=[0:2]) {
			rotate([0,0,120*i]) {
				translate([-size/2-cornerradius-1,-2,0]) 
					difference() {
						cube([5.3, 4, 40]);
						translate([3.5/2,0,33]) cube([1.5, 5, 4]);
					}
			}
		}
	}

	module screw_shell() {
		difference() {
			for(i=[0:3]) {
				rotate([0,0,i*90]) translate([size/2-screwinset, size/2-screwinset, thickness]) {
					rotate([0,0,-45]) nut(d=7,h=4);
				}
			}
			screw_holes();
		}
	}

	module screw_holes() {
		for(i=[0:3]) {
			rotate([0,0,i*90]) translate([size/2-screwinset, size/2-screwinset, thickness]) {
				rotate([0,0,-45]) nut(d=6,h=3);
			}
		}
	}

	module duct_flat(height=20) {
		difference() {
			duct(height);
			translate([-size/2,size/2,0]) cube([size,size,60]);
		}
		// perform projection sorcery in order to flatten the side of the shape
		translate([0,size/2-wall_thickness,0]) rotate([-90,0,0]) linear_extrude(height=wall_thickness) projection(cut=false) rotate([90,0,0]) intersection() {
			duct(height);
			translate([-size/2,size/2,0]) cube([size,size,60]);
		}
	}

	module duct(height=20) {
		translate([0,0,10]) difference() {
			cylinder(r=46/2,h=height-10);
			cylinder(r=46/2-wall_thickness,h=height-10);
		}
		difference() {
			cylinder(r1=39/2, r2=46/2,h=10);
			cylinder(r1=39/2-wall_thickness, r2=46/2-wall_thickness,h=10);
		}
	}
	
	module fan_grill()
	{
		difference()
		{
			body();
	
			// hole
			translate([size/2,size/2,0]) cylinder(r=holeradius,h=thickness);
	
			// screws
			translate([screwinset,screwinset,0]) cylinder(r=screwradius,h=thickness+1);
			translate([screwinset,size-screwinset,0]) cylinder(r=screwradius,h=thickness+1);
			translate([size-screwinset,screwinset,0]) cylinder(r=screwradius,h=thickness+1);
			translate([size-screwinset,size-screwinset,0]) cylinder(r=screwradius,h=thickness+1);
		}
		translate([size/2,size/2,0])
		*interrior();
	}
	
	module body()
	{
		translate([0,cornerradius,0]) cube(size=[size,size-(cornerradius*2),thickness]);
		translate([cornerradius,0,0]) cube(size=[size-(cornerradius*2),size,thickness]);
		translate([cornerradius,cornerradius,0]) cylinder(r=cornerradius,h=thickness);
		translate([cornerradius,size-cornerradius,0]) cylinder(r=cornerradius,h=thickness);
		translate([size-cornerradius,cornerradius,0]) cylinder(r=cornerradius,h=thickness);
		translate([size-cornerradius,size-cornerradius,0]) cylinder(r=cornerradius,h=thickness);
	}
}