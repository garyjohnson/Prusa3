

fan_grill(45);

module fan_grill(size=40) {
// Body Parameters
borderthickness=2;
cornerradius=2;
thickness=2;

dxf=false;

// Screw Hole Parameters
screwradius=4/2;
screwinset=4;

// Spine Parameters
spines=10;
spinesize=2;
spineoffset=7;
spinerotation=0;


// Below are not parameters //

// Calculate helper variables
holeradius=size/2-borderthickness;

// Create the grill
if (dxf)
	projection(cut=false) fan_grill();
else
	fan_grill();

module fan_grill()
{
	union()
	{
		difference()
		{
			body();

			// hole
			translate([size/2,size/2,0]) cylinder(r=holeradius,h=thickness);

			// screws
			#translate([screwinset,screwinset,0]) cylinder(r=screwradius,h=thickness+1);
			translate([screwinset,size-screwinset,0]) cylinder(r=screwradius,h=thickness+1);
			translate([size-screwinset,screwinset,0]) cylinder(r=screwradius,h=thickness+1);
			translate([size-screwinset,size-screwinset,0]) cylinder(r=screwradius,h=thickness+1);
		}
		translate([size/2,size/2,0])
		interrior();
	}
}

module body()
{
	union()
	{
		translate([0,cornerradius,0]) cube(size=[size,size-(cornerradius*2),thickness]);
		translate([cornerradius,0,0]) cube(size=[size-(cornerradius*2),size,thickness]);
		translate([cornerradius,cornerradius,0]) cylinder(r=cornerradius,h=thickness);
		translate([cornerradius,size-cornerradius,0]) cylinder(r=cornerradius,h=thickness);
		translate([size-cornerradius,cornerradius,0]) cylinder(r=cornerradius,h=thickness);
		translate([size-cornerradius,size-cornerradius,0]) cylinder(r=cornerradius,h=thickness);

		translate([screwinset,screwinset,0]) cylinder(r=screwradius+2,h=thickness+1);
		translate([screwinset,size-screwinset,0]) cylinder(r=screwradius+2,h=thickness+1);
		translate([size-screwinset,screwinset,0]) cylinder(r=screwradius+2,h=thickness+1);
		translate([size-screwinset,size-screwinset,0]) cylinder(r=screwradius+2,h=thickness+1);
	}
}

module interrior()
{
	for(i=[0:spines-1])
	{
		  rotate(a=[0,0,i*(360.0/spines)+spinerotation]) 
		  translate([spineoffset,-spineoffset/3.141,0])
		  cube([spinesize,holeradius+(spineoffset/3.141),thickness]);
	}
}
}
