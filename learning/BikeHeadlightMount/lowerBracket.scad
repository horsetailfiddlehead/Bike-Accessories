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
module lowerBracket(ID){
	verticalOffset = 1.0*(ID-5);
	translate([0, 0, verticalOffset])
		difference() {
			// Adds
			union() {	
				resize([ID + 18.35, 20, ID + 10]) sphere(10); // forms the bracket body
				translate([-0.5*baseW, -7, -1*(ID-5)]) // attach to mountBase
					cube([baseW, 20, 10]);
			}

			// subtracts
			union() {
				#rotate([90, 0, 0])
				cylinder(h=2* ID, r=ID/2, center=true);
#translate([0, 18.5, 14.5-ID]) 
				rotate([0,90,0]) 
					cylinder(h=baseW+0.1, r=11, center=true);
			}
		}
}
