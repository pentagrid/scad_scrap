$fn=42;
hole_diameter = 3.2;
center_dist = 10.5;
stand_height = 10;


beam_len = center_dist + hole_diameter * 1.5;
beam_core_thickness = 3;
main_dimension = 5;

difference(){
    union(){
        cube([ beam_len, main_dimension, 3], true);
        translate([beam_len/2 - main_dimension, -main_dimension/2, beam_core_thickness/2])
            cube([main_dimension,main_dimension,stand_height]);
        translate([-1 * (beam_len/2), -main_dimension/2, beam_core_thickness/2])
            cube([main_dimension,main_dimension,stand_height]);
    }
    
    translate([center_dist / 2, 0, 0])
        cylinder(42,hole_diameter/2, hole_diameter/2, center = true);
    translate([-1*center_dist / 2, 0, 0])
        cylinder(42,hole_diameter/2, hole_diameter/2, center = true);
}

