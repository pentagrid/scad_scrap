include <lib/chamfer3d.scad>

//units in mm
length = 100; // how long the stand is along the long axis of the monitor (arbitrary)
base_offset = 150; // how tall the monitor sits off the desk(arbitrary)
channel_width = 59; // the gap for the monitor's body(determined via measurement + 4mm)
channel_height = 17; // the height of the ledges that wrap around the monitor (determined via measurement - 2mm)
channel_height_back = channel_height*2;
ledge_width = 20; // how thick the ledges are
overhang_width = channel_width*2; // how much wider to make the base for added stability (arbitrary)
width = ledge_width * 2 + channel_width; // total of common structure (calculated)
base_width = width + overhang_width; //width of base only (calculated)
pn_depth = 7; // depth of the part number cut (arbitrary)
pversion = "stand 0.1e perek";
chamfer_radius = 0.5; // gild the lily
$fn=42;

difference() { 
    union() {
        Chamfer_3d(dr=chamfer_radius){
            color("red")
                translate([0,0,0])
                    linear_extrude(height=base_offset/5)
                        square([length,base_width], center = true);
            
            color("purple")
                translate([0,0,0])
                    linear_extrude(height=base_offset)
                        square([length, width+ledge_width*1.5], center = true);
                
            color("blue")
                translate([0,(width-ledge_width)/2,base_offset])
                    linear_extrude(height=channel_height_back)
                        square([length,ledge_width], center=true);
      
            color("blue")
               translate([0,-1*(width-ledge_width)/2,base_offset])
                    linear_extrude(height=channel_height)
                        square([length,ledge_width], center=true); 
        } 
    }
    
    color("brown") //save material
        translate([0,0,base_offset/2]) rotate([45, 0, 0])
            linear_extrude(height=base_offset*2/5, center=true)
                square([length*1.1, base_offset*2/5], center=true);
 
    color("green")
        translate([0,0,-0.1]) mirror([1,0,0])        
            linear_extrude(height = pn_depth) 
                text(pversion, size = pn_depth, font = "times", halign = "center", valign = "center", $fn=42);
 }
