// PG35L motor by EiNSTeiN_ <einstein@g3nius.org>


PG35L(false);

module PG35L(mini_hyena=true) {

	difference() {
		union() {
		cylinder(h=42.8,r=35/2); // motor body
		// wings..
		difference() {
			hull() {
				intersection() {
					translate([-50/2, -35/2, 0]) cube([50,35/2,5]);
					cylinder(h=5,r=35/2);
				}
				translate([49/2-7.5/2,0,0]) cylinder(h=5,r=7.5/2);
				translate([-49/2+7.5/2,0,0]) cylinder(h=5,r=7.5/2);
			}
			translate([49/2-7.5/2,0,0]) cylinder(h=5,r=3.5/2);
			translate([-49/2+7.5/2,0,0]) cylinder(h=5,r=3.5/2);
		}
		}
		for(i=[0:2]) {
			rotate([0,0,120*i]) translate([0, -35/2+0.5, 23/2]) cube([8, 3, 23], center=true);
		}
	}

	rotate([0,0,15]) translate([0,50/2-7,42.8-13/2-3]) cube([16, 7, 13], center=true);

	translate([0,0,-4.6]) cylinder(h=4.6,r=10/2); // motor shaft
	translate([0,0,-4.6-8]) cylinder(h=8,r=4.8/2); // motor shaft
	
	// mini hyena: H=10mm, ID=5mm, OD=12.5mm
	if(mini_hyena) #translate([0,0,-5]) rotate([180,0,0]) difference() {
		union() {
			cylinder(h=5.5,r=12.5/2);
			translate([0,0,5.5]) cylinder(h=2,r2=10.5/2, r1=12.5/2);
			translate([0,0,5.5+2]) cylinder(h=2, r2=12.5/2,r1=10.5/2);
			translate([0,0,9.5]) cylinder(h=0.5,r=12.5/2);
		}
		cylinder(h=10,r=5/2);
	}
}