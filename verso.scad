$fn=150 ;

module maSphere() {translate([0,0,-50]) sphere(60);}
module monCube() {translate([0,0,60]) cube(120, center=true);}
module monCubeSup() {translate([0,0,68]) cube(120, center=true);}

module monDome() {
    difference() {
        intersection() {maSphere();monCube();};
        monCubeSup(); }
    }

module teteDeVisseuse() {
    union(){
        translate([0,0,0])
            cylinder(d=30,h=2, center=false);
        translate([0,0,15])
            cylinder(d=6,h=30, center=true);
        }
}

module monAimant() {
    cube([11,40+7.5,4.5]);
}

module mesAimants() { 
    for(i=[0:1]) {
        translate([i*20,0,0])
            translate([-(11+4.5),-20,2])
                monAimant();
    }
}
module main() {
    difference() {difference() {monDome(); mesAimants();}; #teteDeVisseuse();};
}

main();