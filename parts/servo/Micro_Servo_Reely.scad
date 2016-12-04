$fn = 50;

// Main Body
bodyDx = 18.75;
bodyDy = 19;
bodyDz = 8;

// Wings
wingDx = 0.75;
wingDy = 4;
wingDz = bodyDz;

// Big gear on top
bigGearR = bodyDz/2;
bigGearDx = 4;

// Small gear on top
smallGearR = 2;
smallGearDx = 3;

// Main connector
connectorR = 1.75;
connectorDx = 3;

module microServo_body() {
	cube(size=[bodyDx,bodyDy,bodyDz], center=false);
}

module microServo_wings() {
	tLeft = [bodyDx-4,bodyDy,0];
	translate(tLeft)
		cube(size=[wingDx,wingDy,wingDz]);
	
	tRight = [bodyDx-4,-wingDy,0];
	translate(tRight)
		cube(size=[wingDx,wingDy,wingDz]);
}

module microServo_topgears() {
	tBigGear = [bodyDx, bodyDy-bigGearR, bigGearR];
	translate(tBigGear)
		rotate([0,90,0])
			cylinder(h=bigGearDx,r=bigGearR);

	
	tSmallGear = [bodyDx, bodyDy-8.5, bodyDz/2];
	translate(tSmallGear)
		rotate([0,90,0])
			cylinder(h=smallGearDx,r=smallGearR);
}

module microServo_connector() {
	tConnector = [bodyDx+bigGearDx, bodyDy-bigGearR, bodyDz/2];
	translate(tConnector)
		rotate([0,90,0])
			cylinder(h=connectorDx,r=connectorR);
}


// Micro Servo
module MicroServo() {
	translate(-[bodyDx+bigGearDx, bodyDy-bigGearR, bigGearR]) {
		color("green") {
			microServo_body();
			microServo_wings();
			microServo_topgears();
		}
		color("red")
			microServo_connector();
	}
}



MicroServo();
