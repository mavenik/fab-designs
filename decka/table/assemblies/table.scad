use <dimensions.scad>
use <top_frame.scad>

module table(width, length, height) {
  translate([0, 0, height])
  rotate([-90,0,0])
  {
    translate([0,0,
    (length - stove_top_dimensions(width, length)[1]) / 2])
    stove_top_frame(stove_top_dimensions(width, length));
    table_top(width, length);
  }
}

module table_top(width, length) {
  for(row = [0:1]) {
    for(column = [0:1]) {
      translate([
        (column%2)*(width+beading_thickness())/2,
        0,
        (row%2) * (length + stove_top_dimensions()[1])/2
      ])
      quarter_frame(quarter_frame_dimensions(width, length));
    }
  }
}
