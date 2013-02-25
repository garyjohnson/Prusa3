// Power supply cover for S-350 model.

psu_cover();

module psu_cover() {

	translate([0,0,3]) rotate([180,0,0]) union() {
		difference() {
			cube([110, 13, 3]);
			hull() {
				translate([110-14,3,0]) cylinder(r=6/2,h=6);
				translate([110-14,0,0]) cylinder(r=6/2,h=6);
				translate([110-9,3,0]) cylinder(r=6/2,h=6);
				translate([110-9,0,0]) cylinder(r=6/2,h=6);
			}
		}
		translate([0,0,-10+3]) cube([2,13,10]);
		translate([110-2,0,-10+3]) cube([2,13,10]);
		
		translate([0,12-7.5,(3/2)-5]) sphere(r=3.5/2);
		translate([110,12-7.5,(3/2)-5]) sphere(r=3.5/2);
	
		translate([0,13,-6+3]) cube([110,3,6]);
	}
}
