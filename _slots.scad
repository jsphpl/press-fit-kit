/**
 * This file contains 2D-positives of different slot variations.
 *
 * Call the main `slot()` module with the `type={type}` argument.
 */

/**
 * A single slot as 2D positive for subtraction.
 *
 * Its position accounts for `SLOT_DEPTH`, so it can be positioned
 * by translating it by `RADIUS` and it automatically aligns with
 * the outer bound of the circle.
 *
 * @param  {String} type An identifier for the type of slot to return
 * @param  {Number} chamfer_depth Length of chamfer as percentage of SLOT_DEPTH
 */
module slot(type, chamfer_depth=0)
{
	translate([- SLOT_DEPTH/2, 0, 0])
		union()
		{
			chamfer(chamfer_depth);

			if (type == "basic")
			{
				slot_basic();
			}
		}
}

/**
 * A 2D shape to add to the slot for chamfer.
 */
module chamfer(depth)
{
	lower_y = SLOT_WIDTH/2;
	upper_y = lower_y + depth*SLOT_DEPTH;
	lower_x = SLOT_DEPTH/2 - depth*SLOT_DEPTH;
	upper_x = SLOT_DEPTH/2;

	polygon(points = [[upper_x,upper_y], [upper_x,-upper_y], [lower_x,-lower_y], [lower_x,lower_y]]);
}

module slot_basic()
{
	square(size = [SLOT_DEPTH, SLOT_WIDTH], center = true);
}
