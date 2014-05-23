/*
* Object: Bicycle headlight mount
* Creator: Patrick Ma
* Date started: 5/33/2014
* Date completed: 
* This is only the lower half of the bracket
*/


// global variables

baseW = 20; // x-axis
baseL = 40; // y-axis
baseH = 5; // z-axis
baseTang = 15; // W of center ridge
lipH = 2; 
totalH = 1.5*baseH;// The total height of the base bracket

// locking hole
lockW = 5;	
lockL = 4;


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
#translate([(0.1)*(i-1) + i*(baseTang + slotW), -0.25, 2]) 
				cube([ slotW+0.1, baseL + 0.5, baseH - lipH]);
			}

			// create the locking hole
# translate([(baseW - lockW)/2, 30, -0.1])
			cube([lockW, lockL, totalH + 0.2]); 

			// bevel front of top
#translate([baseW/2, 0.75*baseL-1.4, 1.5*baseH+0.1]) 
			rotate([0, 90, 0]) rotate(60)
				cube([5, 3, baseW+0.1], center=true);

// test holes
translate([baseW/4, baseL/2, 0]) cylinder(d=7, h=20, $fn=6, center=true);
translate([baseW/4, baseL/4, 0]) cylinder(d=7.6, h=20, $fn=6, center=true);
// screw hole
					translate([3*baseW/4, baseL/4, 0])cylinder(d=4.3, h=40, $fn=20, center=true);

					// Countersunk bolt head
					translate([3*baseW/4, baseL/2])cylinder(d=7, h = 20, $fn=20, center=true);
		}
	}
}

mountBase();
//translate([baseW /2, 7, totalH]) lowerBracket(25);
