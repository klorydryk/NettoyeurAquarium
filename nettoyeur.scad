include <Polygon.scad>

$fn=150 ;
$epaisseurAimant=4.3;
$epaisseurSocle=1;
$epaisseurPlafond=1;

module maSphere() {translate([0,0,-50]) sphere(60);}
module monCube() {translate([0,0,60]) cube(120, center=true);}
module monDome() {
    difference() {
        intersection() {maSphere();monCube();}
        translate([0,0,60+$epaisseurSocle+$epaisseurPlafond+$epaisseurAimant]) cube(120, center=true);
        }
    }

module teteDeVisseuse() {
    translate([0, 0, 2])
    {
        difference() {
            cylinder(20,6.2, 6.2);
            Hexagon(A=3.4,R=3.9,S=4,h=7,debug=false);
        }
    }
}

module monAimant() {
    cube([11,40+12,$epaisseurAimant]);
}
module mesAimants() { 
            translate([6,-20,$epaisseurSocle])
                monAimant();
            translate([-11-6,-20,$epaisseurSocle])
                monAimant();
}

module main() {
// Verso
    difference() {difference() {monDome(); mesAimants();}; #teteDeVisseuse();};
// Recto
    //difference() {difference() {monDome(); mesAimants();};};
}

main();
