/**
 * This file validates the options and outputs warnings if necessary.
 */

/**
 * `SLOT_DEPTH` should be smaller than half the `RADIUS`.
 */
slot_depth_valid = SLOT_DEPTH < .5*RADIUS;
if (!slot_depth_valid) {
	echo("<b>WARNING! SLOT_DEPTH might be too high for given RADIUS</b>");
}

/**
 * `SLOT_TYPE` must be of an allowed type.
 */
SLOT_TYPES_AVAILABLE = ["basic"];
matches = search([SLOT_TYPE], SLOT_TYPES_AVAILABLE, num_returns_per_match=0, index_col_num=0);
slot_type_valid = len(matches[0]) > 0;
if (!slot_type_valid) {
	echo("<b>WARNING! Chosen SLOT_TYPE", SLOT_TYPE, "does not exist.</b>");
}

/**
 * `CHAMFER` should be lower than .5.
 */
chamfer_valid = CHAMFER <= 1 && CHAMFER > 0;
if (!chamfer_valid) {
	echo("<b>WARNING! CHAMFER should be somewhere between 0 and 0.3.</b>");
}

all_valid = slot_depth_valid && slot_type_valid && chamfer_valid;
