extension_length = 100;
extension_width = 5;
tooth_width = 15;
bracket_thickness = 2;
tooth_gap = 10;

union(){
//actual braket template
linear_extrude(bracket_thickness){
    square([extension_length, 
            extension_width]);
    square([tooth_width, 
            tooth_width]);
    translate([tooth_gap*2, 0, 0])
            square([tooth_width, 
                    tooth_width*2+tooth_gap]);
    translate([0, tooth_gap+tooth_width,0])
            square([tooth_width, tooth_width]);
    translate([0, tooth_gap+tooth_width,0])
            square([tooth_width*2, extension_width]);};
                
// add little nubs to make it usefulish
linear_extrude(bracket_thickness){
    translate([3*extension_length/5,
               -(tooth_width-extension_width)/2,0])
        square([tooth_width/2, tooth_width]);
    translate([extension_length-tooth_width/2,
               -(tooth_width-extension_width)/2,0])
        square([tooth_width/2, tooth_width]);};}