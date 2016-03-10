// Make circles smooth
$fn=200;

// function for curve
function y(x) = 7*(cos(3.6*x)+2);
a = 0;
b = 45;
steps = 20;

translate([00,50,00]) solid(a,b);

translate([00,00,00]) disks(a,b,steps);



// Don't edit under this line
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------


module solid(a=0, b=10) {
    x_vals=[for (i = [a:0.1:b]) i ];
    // y = function to plot
    points_on_line = [ for (x = x_vals) let (y = y(x)) [y,x]];
    
    // Curve is points that make up shape of curve plus lines for bounds and x axis
    curve = concat(points_on_line,[[0,x_vals[len(x_vals)-1]],[0,0]]);
    
    // Do the actual rotation
    rotate_extrude()polygon(points=curve, convexity=10);
}

module disks(a=0, b=10, steps=5) {
    // Determine step size
    step_size = (b-a)/steps;
    
    rotate_extrude()union() {
        for(x = [a:step_size:b-step_size]) {
            translate([0,x,0])square(size = [y(x),step_size],center=false);
        }
    }
}
