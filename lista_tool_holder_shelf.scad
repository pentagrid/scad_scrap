    
difference(){
    union(){
    include <lista_shelf.scad>
    translate([35+(80),(85),4]) rotate(180) 
        import("import/n.stl");
    }
    
    translate([15,85,-1])
        cylinder(10,4,4);
    translate([15,65,-1])
        cylinder(10,3,3);
    translate([15,55,-1])
        cylinder(10,3,3);

    translate([150-15,85,-1])
        cylinder(10,4,4);
    translate([150-15,65,-1])
        cylinder(10,3,3);
    translate([150-15,55,-1])
        cylinder(10,3,3);
}

