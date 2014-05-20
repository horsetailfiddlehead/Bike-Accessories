/*
 * Object: lower bracket for bike headlight mount
 * Creator: Patrick Ma
 * Date started: 5/13/2014
 * Date completed: 
 * This is only the lower half of the bracket
 */

include <mountBase.scad>

/* 
 * Creates the lower bracket for the light proper
 * ID: inner diameter of bracket -- aka the outer dia of the light
 */
module lowerBracket(ID, lower){
	verticalOffset = 1.0*(ID-5);
	outerWidth = ID + 2*(3.65 + 4.3 + 3.65);	// the outer width is the ID + 2*(3.65mm + 4.3 + 3.65mm)
screwCenter = ID/2 + 3.65 + 4.3/2;	// = inner radius + offset + screw dia /2

	translate([0, 0, verticalOffset])
		difference() {
			// Adds
			union() {	
				resize([outerWidth, 20, ID + 10]) sphere(10); // forms the bracket body
				translate([-0.5*baseW, -7, -1*(ID-5)]) // attach to mountBase
					cube([baseW, 20, 10]);
			}

			// subtracts
			union() {
*				translate([0, 50, 0])cube(100, center=true); // for cross-section

				rotate([90, 0, 0])
					cylinder(h=2* ID, r=ID/2, center=true);	// hole for light

				translate([0, 18.5, 14.5-ID]) 
					rotate([0,90,0]) 
					cylinder(h=baseW+0.1, r=11, center=true);	// curve the front

				// On both side
				for(i =[-1,1])
				{
					// captured nut
					translate([i * screwCenter, 0, -10])
						rotate([180,0,0])
						cylinder(d=7.61, $fn=6, h=10, center=true);

					// screw hole
					translate([i*screwCenter, 0, -20])cylinder(d=4.3, h=40, $fn=20);

					// Countersunk bolt head
					translate([i*screwCenter, 0, 10])cylinder(d=7, h = 10, $fn=20, center=true);
				}

				// separate the top and bottom bracket
				cube ([100, ID + 20, 1], center=true);

				// top or bottom of bracket?
				if (lower) {
					translate([-50, -50, 0])cube(100);
				} else {
					rotate([180,0,0])translate([-50, -50, 0])cube(100);
				}
			}
		}
}

//// an example
//lowerBracket(25, true);
//lowerBracket(25);
