use <../parts/member.scad>
use <dimensions.scad>

module beading_vertical(width, length, rounding=0) {
  translate([-width/2,
              beading_width(), 0
             ]) rotate([0, 0, 270])
  beading(beading_width(), beading_thickness(), rounding, length);
}

module beading_horizontal(width, length, rounding=0) {
  translate([width/2 - beading_thickness(),
            beading_width(), -length/2])
  rotate([90,0,0]) rotate([0,-90,0])
  beading(beading_width(), beading_thickness(), rounding,
           width - 2*beading_thickness());
}

module quarter_frame_border(width, length) {
  translate([width/2, 0, 0]) {
    beading_vertical(width, length, rounding_radius());
    mirror([1,0,0]) beading_vertical(width, length);
  }
 
  translate([width/2, 0, length/2]) { 
    beading_horizontal(width, length, rounding_radius());
    mirror([0,0,1]) beading_horizontal(width, length);
  }
}

module stove_top_border(width, length) {
  translate([width/2, 0, 0]) {
    beading_vertical(width, length, rounding_radius());
    mirror([1,0,0]) beading_vertical(width, length, rounding_radius());
  }
 
  translate([width/2, 0, length/2]) { 
    beading_horizontal(width, length);
    mirror([0,0,1]) beading_horizontal(width, length);
  }

}

module quarter_frame(dimensions) {
  width = dimensions[0];
  length = dimensions[1];

  quarter_frame_border(width, length);

  // Members
  members = (width - 2*beading_thickness()) / top_member_width();

  for(i = [1: members]) {
    translate([(i-1)*top_member_width()+beading_thickness(),
               0, beading_thickness()]){
      top_member(
        width=top_member_width(),
        length=length - beading_thickness()*2);
    }
  }
}

module stove_top_frame(dimensions) {
  width = dimensions[0];
  length = dimensions[1];

  stove_top_border(width, length);

  // Members
  members = (length - 2*beading_thickness()) / top_member_width();

  for(i = [1: members]) {
    translate([beading_thickness(),0,
              i*top_member_width()+beading_thickness()]){
      rotate([0,90,0]) top_member(
        width=top_member_width(),
        length=width - beading_thickness()*2);
    }
  }

}
