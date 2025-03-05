use <dimensions.scad>
use <top_frame.scad>

module quarter_frame_placement(width, length) {
     translate([-width/2,0,0]) quarter_frame(quarter_frame_dimensions(width, length));
}

module two_quarter_placement(width, length) {
  translate([0, 0, -length/2]) {
    quarter_frame_placement(width, length);
    mirror([1,0,0]) quarter_frame_placement(width, length);
  }
}

module table_top(width, length) {
  translate([width/2,0,length/2]) {
    two_quarter_placement(width, length);
    mirror([0,0,1]) two_quarter_placement(width, length);
  }
}

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

