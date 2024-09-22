length = 20;

difference() { union (){
color("red")
    translate([0,0,0])
        linear_extrude(height=2.5)
            square([length,9], center = true);
            
color("blue")
    translate([0,3.5,2.5])
        linear_extrude(height=1.5)
            square([length,2], center=true);
  
color("blue")
    translate([0,-3.5,2.5])
        linear_extrude(height=1.5)
            square([length,2], center=true);  }
 
color("green")
    translate([0,0,-0.1])mirror([1,0,0])        
        linear_extrude(height = 1) {
    text("stand 0.1 perek", size = 2, font = "times", halign = "center", valign = "center", $fn = 1);
  }
  
  }
            
            