
use <sapin_shape.scad>

// thickness
T = 3;

module third(index, ymin, ymax)
{
    translate([sqrt(3)/2*T,0]) children();
    translate([-sqrt(3)/2*T,0]) mirror() children();
    
    axis_length = ymax - ymin;
    axis_ymin = ymin;
    translate([-sqrt(3)/2*T, axis_ymin + index*axis_length/3])
        square([sqrt(3)*T, axis_length/3]);
}

module hex_assemble(ymin, ymax)
{
    for (i=[0:2])
        rotate([0,0,60*i])
            rotate([90,0,0])
                translate([0,0,-T/2]) linear_extrude(T)
                    third(i, ymin, ymax) children();
}

module flat(ymin,ymax)
{
    for (i=[0:2])
        translate([i*200,0])
            third(i, ymin, ymax) children();
}


//hex_assemble(0,100) demi_sapin(50);
flat(0,100) demi_sapin(50);
