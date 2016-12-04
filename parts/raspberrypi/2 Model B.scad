$fn = 50;

// Bohrungen
module bohrungen(x,y,r) {
	translate([x,-y,-50])
		cylinder(h=100,r=r);
	translate([-x,y,-1])
		cylinder(h=100,r=r);
	translate([x,y,-50])
		cylinder(h=100,r=r);
	translate([-x,-y,-50])
		cylinder(h=100,r=r);
}

module abgerundetePlatte(h,w,d,r) {
	cube(size=[h-2*r,w,d], center=true);
	cube(size=[h,w-2*r,d], center=true);

	x = (h-2*r)/2;
	y = (w-2*r)/2;
	translate([x,y,0])
		cylinder(h=d, r=r, center=true);
	translate([-x,y,0])
		cylinder(h=d, r=r, center=true);
	translate([x,-y,0])
		cylinder(h=d, r=r, center=true);
	translate([-x,-y,0])
		cylinder(h=d, r=r, center=true);
}

module print() {
	abgerundetePlatte(56.0, 85.6, 1, 2);
}

// Platine
module Pi2B() {
	color("green") {
		difference() {
			translate([0,(56-85.6)/2])
				print();
			bohrungen(56/2-2,56/2-2,1);
		}
	}
}



Pi2B();

