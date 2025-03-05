function top_member_width() = 4.5;

function beading_thickness() = 1;

function beading_width() = 2;

function rounding_radius() = 1/4;

function stove_top_dimensions(width, length) = [width, top_member_width()*3 + 2*beading_thickness()];

function quarter_frame_dimensions(width, length) = [
                (width - beading_thickness()) / 2,
                (length - stove_top_dimensions(width, length)[1]) / 2
              ];
