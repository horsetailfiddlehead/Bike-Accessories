/*
* Object: Bicycle headlight mount
* Creator: Patrick Ma
* Date started: 5/13/2014
* Date completed: 
* Actual bike mount
*/

/*
 * This uses the top and bottom brackets, and the mounting base
 */
include <mountBase.scad>
include <lowerBracket.scad>

mountBase();
translate([baseW /2, 7, totalH]) lowerBracket(25);
