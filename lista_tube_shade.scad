include <lib/chamfer3d.scad>

function in2mm(dim) = dim * 25.4;

//unitless quantities
number_mounts = 9; //number of holes along the length of the shade, inclusive of the first and last hole

// z axis pointing out of the floor
// x axis along the face of the desk
// y axis going into the face of the desk

//units in inches
mounting_pitch_in = 3;
mount_hole_dia_in = 0.25;
lamp_z_in=2.5;
lamp_y_in=3.5;


//convert to mm
mounting_pitch = in2mm(mounting_pitch_in);
mount_hole_dia = in2mm(mount_hole_dia_in);
lamp_z = in2mm(lamp_z_in);
lamp_y = in2mm(lamp_y_in);
shade_x = mounting_pitch*number_mounts;
shade_thickness = 2;
base_thickness = 5;
mount_y = mount_hole_dia*3;
$fn=42;


translate([-shade_x/2, -lamp_y/2, 0]) //just for display
difference() { 
    union() {
            color("red") //front shade body
                translate([0,lamp_y,0])
                    cube([shade_x, shade_thickness, lamp_z]);
            
            color("purple") //right side shade body(when installed)
                translate([0,shade_thickness,0])
                    cube([shade_thickness, lamp_y, lamp_z]);

            color("blue") //left side shade body(when installed)
                translate([shade_x,shade_thickness,0])
                    cube([shade_thickness, lamp_y, lamp_z]);
        
            color("green") //front side mounting lip
                translate([0,lamp_y,0])
                    cube([shade_x, mount_y, base_thickness]);
        
            color("lightgreen") //right side structural lip
                translate([-1*mount_y,0,0])
                    cube([mount_y, mount_y + lamp_y, base_thickness]);
        
            color("darkgreen") //left side structural lip
                translate([shade_x,0,0])
                    cube([mount_y, mount_y + lamp_y, base_thickness]);
                
    }
    
    //mounting hole array
    for( x = [mounting_pitch/2 : mounting_pitch : shade_x]) {
        color("black")
        translate([x,mount_y/2 + lamp_y, -1])
            cylinder(h = base_thickness * 4, r = mount_hole_dia/2);
    }
}
