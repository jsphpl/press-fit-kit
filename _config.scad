/**
 * Change the following parameters to configure and fine-tune the model.
 *
 * Remeber to note down the settings or commit/tag a revision of this file
 * in git so you can reproduce the same parts later on, if you need to.
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
MATERIAL = 2.9;

/**
 * Width of a cut produced by the lasercutter. This value shoud be
 * determined precisely for each machine/material combination!
 *
 * @type {Number} Float (mm)
 */
KERF = .0576;

/**
 * Tolerance for joints. Should be a small value close to 0.
 * Very soft materials might require negative values.
 *
 * @type {Number} Float (mm)
 */
CLEARANCE = 0;

/**
 * The number of slots in one disk.
 *
 * @type {Number} Integer
 */
N_SLOTS = 6;

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
CHAMFER = .15;

/**
 * Diameter of the center hole. Set to 0 to disable.
 *
 * @type {Number} Float (mm)
 */
CENTER_HOLE = 6;

/**
 * Number of circle fragments per 360. Higher numbers
 * mean smoother circles. Can be set to `N_SLOTS`
 * or a multiple of it for fun effects.
 *
 * @type {Number} Integer
 */
FN = 100; //N_SLOTS*2;

params = [
	["DIAMETER", DIAMETER],
	["MATERIAL", MATERIAL],
	["KERF", KERF],
	["CLEARANCE", CLEARANCE],
	["N_SLOTS", N_SLOTS],
	["SLOT_DEPTH", SLOT_DEPTH],
	["SLOT_TYPE", SLOT_TYPE],
	["CHAMFER", CHAMFER],
	["CENTER_HOLE", CENTER_HOLE],
	["FN", FN]
];

for (item = params)
{
	echo(str(item[0], ":", item[1]));
}
