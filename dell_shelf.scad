include <lib/chamfer3d.scad>

//HP z34c top is ~29.5mm wide
//dell is about 36-40mm(beveled
//lg is about 23/24mm

//units in mm
shelf_length = 180; // size of the shelf tray (arbitrary)
shelf_width = 125; // size of the shelf tray (arbitrary)
shelf_z = 10; // thickness of the shelf tray
channel_width = 42; // the gap for the monitor's body(determined via measurement + 4mm)
channel_height = 17; // the height of the ledges that wrap around the monitor (determined via measurement - 2mm)
channel_height_back = channel_height*2;
ledge_width = 20; // how thick the ledges are
width = ledge_width*2+channel_width;
pn_depth = 7; // depth of the part number cut (arbitrary)
pversion = "dell_shelf 0.1b perek";
chamfer_radius = 3; // gild the lily
$fn=42;

difference() { 
    union() {
        //Chamfer_3d(dr=chamfer_radius){
            color("red")
                translate([0,0,0])
                    linear_extrude(height=shelf_z)
                        square([shelf_length,shelf_width], center = true);
            
            color("purple")
                translate([0,0,shelf_z/2])
                    linear_extrude(height=shelf_z)
                        square([shelf_length, width+ledge_width*1.5], center = true);
                
            color("blue")
                translate([0,(width-ledge_width)/2,shelf_z])
                    linear_extrude(height=channel_height_back)
                        square([shelf_length,ledge_width], center=true);
      
            color("blue")
               translate([0,-1*(width-ledge_width)/2,shelf_z])
                    linear_extrude(height=channel_height)
                        square([shelf_length,ledge_width], center=true); 
        //} 
    }
 
    color("green")
        translate([0,0,-0.1]) mirror([1,0,0])        
            linear_extrude(height = pn_depth) 
                text(pversion, size = pn_depth, font = "times", halign = "center", valign = "center", $fn=42);
 }
