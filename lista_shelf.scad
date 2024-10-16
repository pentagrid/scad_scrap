extension_length = 100;
extension_width = 5;
tooth_width = 15;
bracket_thickness = 4;
tooth_gap = 10;
shelf_width=50;
shelf_length=50;
//16mm between the bracket centers
bracket_center_to_center=16;
bracket_gap=bracket_center_to_center-bracket_thickness;
pversion = "0.1a 4mm";
$fn=42;

union(){
difference(){
translate([shelf_width/4,-shelf_width*2-10,0])
    cube([100,100,4]);
union(){
    translate([3*extension_length/5,-30,-1])
        cube([bracket_thickness,tooth_width/2,10]);
    translate([3*extension_length/5,-30-(extension_length-tooth_width/2-(3*extension_length/5)),-1])
        cube([bracket_thickness,tooth_width/2,10]); 
    translate([3*extension_length/5+bracket_center_to_center,-30,-1])
        cube([bracket_thickness,tooth_width/2,10]);
    translate([3*extension_length/5+bracket_center_to_center,-30-(extension_length-tooth_width/2-(3*extension_length/5)),-1])
        cube([bracket_thickness,tooth_width/2,10]);      
}

}

//actual braket template
linear_extrude(bracket_thickness){
    square([extension_length, 
            extension_width]);
    square([tooth_width, 
            tooth_width]);
    translate([tooth_gap*2, 0, 0])
            square([tooth_width, 
                    tooth_width*2+tooth_gap]);
    translate([tooth_width*2+tooth_width/3,0,0]) rotate(45)
            square([tooth_width/2.1, tooth_width/2.1]);
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
        square([tooth_width/2, tooth_width]);};
        
 linear_extrude(bracket_thickness+2){
    rotate(90) translate([2,-1*tooth_width*2,0]) 
       text(pversion, size=6, font="times");
     };
        
        }