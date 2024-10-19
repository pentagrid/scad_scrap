extension_length = 100;
extension_width = 5;
tooth_width = 15;
bracket_thickness = 4;
shelf_thickness = 4;
tooth_gap = 10;
shelf_width=100;
shelf_length=100;
//16mm between the bracket centers
bracket_center_to_center=16;
bracket_gap=bracket_center_to_center-bracket_thickness;
pversion = "listashelf 0.1b";
$fn=42;

//x_off is where the first tooth hole starts
x_off = (shelf_width-bracket_center_to_center)/2 - bracket_thickness/2;
//y_off is how far from the edge to start the tooth attach
y_off = 10;
//based on the mounting bracket design, what the space is between
//the two vertical teeth(the horizontal space is defined by the 
//nexus system gap)
slot_y_space = (extension_length-tooth_width/2-(3*extension_length/5));

difference(){
    //first create a rectangular prisim that is twice as thick as what we
    //need so it gets a rim and we will carve a bowl later.
    translate([0,0,0])
        cube([shelf_width,shelf_length,shelf_thickness*2]);
    union(){
        //carve "bowl"
        translate([shelf_thickness,shelf_thickness,shelf_thickness+1])
            cube([shelf_width-2*shelf_thickness,
                  shelf_length-2*shelf_thickness,shelf_thickness+1]);
        //these are the four holes for mounting bracket attach
        translate([x_off,y_off,-1])
            cube([bracket_thickness,tooth_width/2,shelf_thickness*2]);
        translate([x_off, y_off+slot_y_space, -1])
            cube([bracket_thickness,tooth_width/2,shelf_thickness*2]); 
        translate([x_off+bracket_center_to_center, y_off,-1])
            cube([bracket_thickness,tooth_width/2,shelf_thickness*2]);
        translate([x_off+bracket_center_to_center, y_off+slot_y_space,-1])
            cube([bracket_thickness,tooth_width/2,shelf_thickness*2]);
        //part number label
        linear_extrude(shelf_thickness/2){
            rotate(90)  translate([10, -10, 0]) mirror([0,1,0]) 
               text(pversion, size=6, font="times");};    
    }
}
