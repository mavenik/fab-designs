module member(width, thickness, length) {
  cube([width, thickness, length]);
}

module top_member(width = 4.5, thickness = 1, length) {
  member(width, thickness, length);
}

module leg() {
  width = 3.5;
  thickness = 1.5;
  length = 31;
  member(width, thickness, length);
}

module beading(width=2, thickness=1, border_radius=0, length) {

  union() {
    member(width-border_radius, thickness, length);
    translate([width-border_radius, border_radius, 0]) {
      member(border_radius, thickness - border_radius, length);
    }
    translate([width-border_radius, border_radius, 0]) {
      cylinder(h=length, r=border_radius);
    }
  }
}
