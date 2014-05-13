/*
	Basic mahjong block

	Created: Patrick Ma
	Date begun: 4/26/2014
	Date completed: 4/26/14

	A simple tempate for mahjong tiles.
	Global variables define the basic parameters of the block
*/

// global variables
length=38.1;
height=18.0;
width=25.4;
r_edge=1.5;


%cube(25.4); // an inch reference

translate([r_edge, r_edge, r_edge])
minkowski(){
cube([width-2*r_edge, length-2*r_edge, height-2*r_edge]);
sphere(r_edge, $fs=0.2);
}