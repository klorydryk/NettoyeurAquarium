$fn=150 ;

module maSphere() {translate([0,0,-50]) sphere(60);}
module monCube() {translate([0,0,60]) cube(120, center=true);}
module monDome() {intersection() {maSphere();monCube();}}

module monAimant() {
    cube([11,40+7.5,4]);
    //intersection() {
    //translate([0,0,4])
    //   cube([14,50,2]);
 /*   translate([5.5,0,-5.5])
        rotate([-90,0,0])
            cylinder(d=23,h=50);*/
    //}
}

module mesAimants() { 
    for(i=[0:1]) {
        translate([i*20,0,0])
            translate([-(11+4.5),-20,2])
                monAimant();
    }
}
module main() {
difference() {monDome(); mesAimants();};
}

main();


module aimantPetit() {
cube([13-2,15+59.1,4-1]);
}
