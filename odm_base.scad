$fn=42;
hole_spacing=25;
standoff_height=15;
main_dimension=5;
base_width=60;
hole_diameter=3.2;


difference(){
    union(){
        cube([ base_width, base_width, main_dimension], true);
        translate([hole_spacing/2, hole_spacing/2, main_dimension])
            cube([main_dimension, main_dimension, standoff_height], center=true);
        translate([hole_spacing/2, -hole_spacing/2, main_dimension])
            cube([main_dimension, main_dimension, standoff_height], center=true);
        translate([-hole_spacing/2, hole_spacing/2, main_dimension])
            cube([main_dimension, main_dimension, standoff_height], center=true);
        translate([-hole_spacing/2, -hole_spacing/2, main_dimension])
            cube([main_dimension, main_dimension, standoff_height], center=true);
    }
    
    translate([hole_spacing/2, hole_spacing/2, main_dimension/2])
        cylinder(42,hole_diameter/2, hole_diameter/2, center = true);
    translate([hole_spacing/2, -hole_spacing/2, main_dimension/2])
        cylinder(42,hole_diameter/2, hole_diameter/2, center = true);
    translate([-hole_spacing/2, hole_spacing/2, main_dimension/2])
        cylinder(42,hole_diameter/2, hole_diameter/2, center = true);
    translate([-hole_spacing/2, -hole_spacing/2, main_dimension/2])
        cylinder(42,hole_diameter/2, hole_diameter/2, center = true);
}