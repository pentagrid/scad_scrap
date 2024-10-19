include <lib/chamfer3d.scad>

//HP z34c top is ~29.5mm wide
//dell is about 36-40mm(beveled
//lg is about 23/24mm

//units in mm
shelf_length = 200; // size of the shelf tray (arbitrary)
shelf_width = 200; // size of the shelf tray (arbitrary)
shelf_z = 10; // thickness of the shelf tray

rim_channel_width = shelf_z+1.5; //channel width of the rim based on the shelf thickness it will slide on
rim_bottom_rail_width = shelf_z; //thickness of the bottom rail
rim_top_rail_width = 25.4; //the top rail which is also the guard element
rim_width = rim_channel_width+rim_bottom_rail_width+rim_top_rail_width;
rim_height_bottom = 14; //height of the rim which is the depth of the rail
rim_height_top = 8;
rim_base_height = 4;


pn_depth = 8; // depth of the part number cut (arbitrary)
pversion = "shelf_rim_L 0.1a perek";
chamfer_radius = 3; // gild the lily
$fn=42;

difference() { 
    union() {
        //Chamfer_3d(dr=chamfer_radius){
            color("red")
                translate([0,0,0])
                    cube([shelf_length, rim_width, rim_base_height], center = true);    
            color("purple")
                translate([0,-1*rim_width/2+rim_bottom_rail_width/2,(rim_base_height+rim_height_bottom)/2])
                    cube([shelf_length, rim_bottom_rail_width, rim_height_bottom], center = true);

            color("purple")
                translate([0,-1*rim_width/2+rim_bottom_rail_width*3/2+rim_channel_width,(rim_base_height+rim_height_top)/2])
                    cube([shelf_length, rim_bottom_rail_width, rim_height_top], center = true);
    }
    
    color("green")
        translate([0,rim_width/4+rim_bottom_rail_width/3,0]) mirror([0,0,0])        
            linear_extrude(height = pn_depth) 
                text(pversion, size = pn_depth, font = "times", halign = "center", valign = "center", $fn=42);
 }
