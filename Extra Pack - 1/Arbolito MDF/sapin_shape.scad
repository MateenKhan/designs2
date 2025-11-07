
module demi_sapin(radius)
{
    $fn = 36;

    W = radius;
    H = 2*radius;
    // diagonale du sapin
    D = sqrt(W*W+H*H);
    // rayon branche
    N = 10;
    RB = D/N/4;
    
    intersection()
    {
        translate([0,RB])
        {
            M = 3*RB;
            difference()
            {
                union()
                {
                    // branches
                    for (i=[0:N])
                        translate([W*(1-i/N),H*i/N]) circle(RB);
                    // plain
                    polygon([[0,0],[W,0],[0,H]]);
                }
                // branch holes
                for (i=[0:N-1])
                {
                    j = i+1/2;
                    hull()
                    {
                        translate([W*(1-j/N),H*j/N]) circle(RB);
                        HC = H*j/N-((W*(1-j/N)-M)*W/H);
                        if (HC<=M)
                            translate([W*(1-j/N)-((H*j/N)-M)*H/W,M]) circle(RB);
                        else
                            translate([M,HC]) circle(RB);
                    }
                }
            }
            hull()
            {
                circle(RB);
                translate([W,0]) circle(RB);
            }
            hull()
            {
                circle(RB);
                translate([0,H]) circle(RB);
            }
        }
        square([2*W,2*H]);
    }
}
