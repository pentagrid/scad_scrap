//units in mm
length = 100; // how long the stand is along the long axis of the monitor (arbitrary)
base_offset = 10; // how tall the monitor sits off the desk(arbitrary)
channel_width = 65; // the gap for the monitor's body(determined via measurement + 10mm)
channel_height = 15; // the height of the ledges that wrap around the monitor (determined via measurement - 2mm)
ledge_width = 20; // how thick the ledges are
width = ledge_width * 2 + channel_width; // total width
pn_depth = 4; // depth of the part number cut (arbitrary)
pversion = "stand 0.1a perek";

difference() { 
    union() {
        color("red")
            translate([0,0,0])
                linear_extrude(height=base_offset)
                    square([length,width], center = true);
            
        color("blue")
            translate([0,(width-ledge_width)/2,base_offset])
                linear_extrude(height=channel_height)
                    square([length,ledge_width], center=true);
  
        color("blue")
           translate([0,-1*(width-ledge_width)/2,base_offset])
                linear_extrude(height=channel_height)
                    square([length,ledge_width], center=true);  
    }
 
    color("green")
        translate([0,0,-0.1]) mirror([1,0,0])        
            linear_extrude(height = pn_depth) 
                text(pversion, size = pn_depth, font = "times", halign = "center", valign = "center", $fn=42);
 }
           
