/**
 * A parametric press-fit kit designed for laser cutting.
 *
 * It outputs a single round disk with an adjustable number
 * of slots where it can be connected to duplicates of the
 * same part.
 */

/*
|--------------------------------------------------------------------------
| SETTINGS
|--------------------------------------------------------------------------
|
| Change the following parameters to configure and fine-tune the model.
|
| Remeber to note down the settings or commit/tag a revision of this file
| in git so you can reproduce the same parts later on, if you need to.
|
*/

/**
 * Diameter of the disk.
 *
 * @type {Number} Float (mm)
 */
DIAMETER = 30;

/**
 * Thickness of the material used.
 *
 * @type {Number} Float (mm)
 */
MATERIAL = 3;

/**
 * Width of a cut produced by the lasercutter. This value shoud be
 * determined precisely for each machine/material combination!
 *
 * @type {Number} Float (mm)
 */
KERF = .05;

/**
 * Tolerance for joints. Should be a small value close to 0.
 * Very soft materials might require negative values.
 *
 * @type {Number} Float (mm)
 */
CLEARANCE = .01;

/**
 * The number of slots in one disk.
 *
 * @type {Number} Integer
 */
N_SLOTS = 3;

/**
 * Depth of each slot. Mind that the total
 * overlap of two parts is twice as much.
 *
 * @type {Number} Float (mm)
 */
SLOT_DEPTH = 6;

/**
 * The type of slot to use.
 *
 * Options currently available:
 * 	- basic
 *
 * @type {String}
 */
SLOT_TYPE = "basic";

/**
 * The depth of the chamfer as fraction of `SLOT_DEPTH`.
 *
 * @type {Number} Float
 */
CHAMFER = .1;

/**
 * Diameter of the center hole. Set to 0 to disable.
 *
 * @type {Number} Float (mm)
 */
CENTER_HOLE = 4;

/**
 * Number of circle fragments per 360. Higher numbers
 * mean smoother circles. Can be set to `N_SLOTS`
 * or a multiple of it for fun effects.
 *
 * @type {Number} Integer
 */
FN = 100; //N_SLOTS*2;


/*
|--------------------------------------------------------------------------
| DERIVED VALUES
|--------------------------------------------------------------------------
|
| Do not edit the following section!
|
*/
SLOT_ANGLE = 360/N_SLOTS;
SLOT_WIDTH = MATERIAL + 2*CLEARANCE - KERF;
RADIUS = (DIAMETER + KERF)/2;
N0_SLOTS = N_SLOTS - 1;  // Just an alias for the highest 0-index of slots


/*
|--------------------------------------------------------------------------
| MODEL
|--------------------------------------------------------------------------
*/

include <validate.scad>;
include <slots.scad>;

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
	difference()
	{
		circle(r = RADIUS, $fn=FN);
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
	3D();
}
else {
	echo("<b>ERROR validating parameters – please check.</b>");
}

