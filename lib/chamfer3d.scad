       
//-----------------------------------------------
// Create a chamfer between two or more surfaces
//
// A subset of surface pairs may be specified
//
// Call with N = List of surface subsets
//           N = [[child#,child#],[child#,child#,]...]
//           for 2 objects N = [[0,1]]
//           for 3 objects intersection 0 and 1 N = [[0,1],[0,2]]
// dr = chamfer height (approx)
//       if dr > 0 minkowski() children(); sphere(r=dr) is used
//          dr <= 0 surface is extended via 6 way translation
//
// ** Expand_3d may be modified to use a centered cube rather than a sphere
//
module Chamfer_3d(N,dr=-.5) {
   children();
   
   if (N != undef) { 
      
   for (i=N) {
      hull() {
         intersection() {
            children(i[0]);
            Expand_3d(dr) 
            children(i[1]);
         }
         
         intersection() {
            Expand_3d(dr) 
            children(i[0]);
            children(i[1]);
         }
      }
   }

   } else {
      
      for (i=[0:$children-1]) {
         for (j=[0:$children-1]) {            
            if (i!=j) 
            hull() {
               intersection() {
                  Expand_3d(dr)
                  children(i); 
                  children(j);
               }
               intersection() {
                  children(i); 
                  Expand_3d(dr)
                  children(j);
               }
            }
         } 
      }
   }
}

//--------------------------------------------------
// Expand a child object by shifting or minkowski
// Since the center of an object is not known, 
//     a simple scale(S) children() is not possible
//
// An object can be expanded by creating a composite object
// either using minkowski() children(); sphere(r),cube(r,center=true) etc.
// or by shifting the object on multiple axis
//
// Call with dr = absolute expansion
//           dr <= 0 = use shifting +-dr on each axis.
//           dr >  0 = use minkowski() children(), sphere(dr)
//
module Expand_3d(dr = -.5) {
   if (dr < 0) {
   
      translate([dr,0])
      children();
      translate([-dr,0])
      children();
      translate([0,dr])
      children();
      translate([0,-dr])
      children();
      translate([0,0,dr])
      children();
      translate([0,0,-dr])
      children();
      
   } else {
      minkowski() {
         children();
         sphere(r=dr);
         //cube(dr,center=true);
      }
   }
}

