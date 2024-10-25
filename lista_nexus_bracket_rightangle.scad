extension_length = 100;
extension_width = 5;
tooth_width = 15;
bracket_thickness = 4;
tooth_gap = 9;
pversion = "0.1a 4mm";
$fn=42;

union(){
//actual braket template
linear_extrude(bracket_thickness){
    
    square([tooth_width, 
            tooth_width]);
    translate([tooth_width, 0, 0])
        square([tooth_gap,extension_width]);
    translate([0, tooth_gap+tooth_width,0])
            square([tooth_width, tooth_width]);
    translate([0, tooth_gap+tooth_width,0])
            square([tooth_width*2, extension_width]);};

linear_extrude(bracket_thickness*2) {
    translate([tooth_gap*2, 0, 0])
            square([tooth_width, 
                    tooth_width*2+tooth_gap]);
};    


translate([tooth_width+tooth_gap,0,0]) rotate([0,90,0])
linear_extrude(bracket_thickness*2){
            rotate(45) 
            square([tooth_width/2.1, tooth_width/2.1]);};    

translate([tooth_width+tooth_gap, 0, 0]) rotate([0,90,0])
union(){
	linear_extrude(bracket_thickness*2) {
		square([extension_length-tooth_gap-tooth_width, 
			extension_width]);
	};
			
	// add little nubs to make it usefulish
	linear_extrude(bracket_thickness){
	    translate([2*extension_length/5,
		       -(tooth_width-extension_width)/2,0])
		square([tooth_width/2, tooth_width]);
	    translate([extension_length-tooth_width-tooth_gap-tooth_width/2,
		       -(tooth_width-extension_width)/2,0])
		square([tooth_width/2, tooth_width]);};
}        
        }
