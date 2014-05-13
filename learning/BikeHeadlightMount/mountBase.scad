/*
Object: Bicycle headlight mount
Creator: Patrick Ma
Date started: 5/33/2014
Date completed: 
This is only the lower half of the bracket
*/


// global variables

baseW = 20; // x-axis
baseL = 40; // y-axis
baseH = 5; // z-axis
baseTang = 15; // W of center ridge
lipH = 2; 
totalH = 1.5*baseH;// The total height of the base bracket

// locking hole
lockW = 4;	
lockL = 3;

/* 
 * Creates the lower bracket for the light proper
 * ID: inner diameter of bracket -- aka the outer dia of the light
 */
module lowerBracket(ID){
	verticalOffset = 1.0*(ID-5);
	translate([0, 0, verticalOffset])
		difference() {
			// Adds
			union() {	//TODO use resize to better fit the screws
				resize([ID + 18.35, 20, ID + 10]) sphere(10); // forms the bracket body
				translate([-0.5*baseW, -7, -1*(ID-5)]) // attach to mountBase
					cube([baseW, 20, 10]);
			}
			// subtracts
			union() {
#rotate([90, 0, 0])
				cylinder(h=2* ID, r=ID/2, center=true);
#translate([0, 17.2, 14-ID]) 
rotate([0,90,0]) 
cylinder(h=baseW+0.1, r=10, center=true);
			}
		}
}


/*
 * creates the section of the bracket that insets into the mounting bracket on
 * the bike.
 */
module mountBase() {
	slotW = (baseW - baseTang) /2;	// calculate the depth of the retaining slot
	difference(){

		// add these
		union() {
			cube([baseW, baseL, baseH]); // bottom
			translate([0,0,baseH]) 
				cube([baseW, 0.75*baseL, baseH/2]); // top
		}

		// subtract these
		union() {
			// create the slots
			for (i = [0,1]) {
# translate([(0.1)*(i-1) + i*(baseTang + slotW), -0.25, 2]) 
				cube([ slotW+0.1, baseL + 0.5, baseH - lipH]);
			}

			// create the locking hole
# translate([(baseW - lockW)/2, 30, -0.1])
			cube([lockW, lockL, totalH + 0.2]); 
		}
	}
}

mountBase();
translate([baseW /2, 7, totalH]) lowerBracket(25);
//lowerBracket(25);
