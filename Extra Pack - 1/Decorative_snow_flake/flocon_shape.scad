
$fn=36;

module branch(radius)
{
    hull()
    {
        circle(radius/10);
        translate([radius,0]) circle(1);
    }
    for (i=[1:3])
    {
        hull()
        {
            translate([radius*i/4,0])
            {
                circle(radius/25);
                rotate(60) translate([radius*i/7,0]) circle(1);
            }
        }
        hull()
        {
            translate([radius*i/4,0])
            {
                circle(radius/25);
                rotate(-60) translate([radius*i/7,0]) circle(1);
            }
        }
    }
}

module flocon(radius)
{
    for (i=[0:5])
    {
        rotate(90+60*i) branch(radius);
    }
}
    
module demi_flocon(radius)
{
    intersection()
    {
        translate([0,-2*radius]) square([2*radius,4*radius]);
        flocon(radius);
    }
}

flocon(50);
