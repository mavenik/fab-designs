// Top frame dimensions

function member_thickness() = 1;
function top_member_width() = 4.5;

function beading_thickness() = 1;

function beading_width() = 3;

function rounding_radius() = 1/4;

function stove_top_dimensions(width, length) = [width, top_member_width()*4 + 2*beading_thickness()];

function quarter_frame_dimensions(width, length) = [
                width / 2,
                (length - stove_top_dimensions(width, length)[1]) / 2
              ];

// Stand dimensions

function leg_width() = 3.5;
function leg_thickness() = 1.5;

function stand_margin() = 2;
