/**
 * A parametric press-fit kit designed for laser cutting.
 *
 * It outputs a single round disk with an adjustable number
 * of slots where it can be connected to duplicates of the
 * same part.
 */

include <_config.scad>;
include <_derived.scad>;
include <_validate.scad>;
include <_slots.scad>;

/*
|--------------------------------------------------------------------------
| MODEL
|--------------------------------------------------------------------------
*/


/**
 * 3D-version of the part
 */
module 3D()
{
	linear_extrude(MATERIAL)
		2D();
}

/**
 * 2D-shape of the part
 */
module 2D()
{
	offset(r = KERF/2)
		difference()
		{
			circle(r = RADIUS, $fn=FN);
			// -
			circle(d = CENTER_HOLE, $fn=FN);
			for (index = [0:N0_SLOTS])
			{
				rotate([0, 0, SLOT_ANGLE*index])
				translate([RADIUS, 0, 0])
					slot(SLOT_TYPE, CHAMFER);
			}
		}
}

if (all_valid) {
	echo("<b>Parameters look good, let's render!</b>");
	2D();
}
else {
	echo("<b>ERROR validating parameters – please check.</b>");
}

