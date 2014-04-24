/* Spacer for CMOY amp knob
Designer: Patrick Ma
Date Started: 4/22
Date completed: 

knob: JD-50-x-5
shaft: Alps Potentiometer RK0971221Z05 
*/

module CMOY_spacer()
{
	difference()
	{
	// adds these parts
		union()
		{
			linear_extrude(height = 7, center=false)
			{
				circle(d=6, $fn=100);
			}
		}

	// cuts these parts
	#	union()
		{
			translate([-1.5,-3,-0.1])
			{
				cube([4.6,6.1,8]);
			}
		}
	}
}

CMOY_spacer();