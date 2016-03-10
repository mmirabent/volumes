// Make circles smooth
$fn=200;

// f(x) is the upper function
// g(x) is the lower function
function f(x) = -pow(x,2) + 10;
function g(x) = x/4 + 5.5;

a = -2;
b = 2;
steps = 7;

solid(a,b);
translate([25,0])washers(a,b,steps);


// Don't edit under this line
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

// This creates a solid of revolution between the functions f(x) and g(x)
// It does this by plotting the function f(x) first, from a to b, then plotting
// the function g(x) from b to a. This list of points is then used to form a
// polygon that is then rotated about the x axis to form a solid of revolution
module solid(a=-1, b=1) {
    
    // X values forward and backward for plotting
    x_vals_forward=[for (i = [a:0.1:b]) i ];
    x_vals_reverse=[for (i = [b:-0.1:a]) i ];
        
    // plot functions
    f_x_points = [ for (x = x_vals_forward) let (y = f(x)) [y,x]];
    g_x_points = [ for (x = x_vals_reverse) let (y = g(x)) [y,x]];
    
    // Curve is points that make up shape of curve plus lines for bounds and x axis
    curve = concat(f_x_points, g_x_points);
    
    // Do the actual rotation
    rotate_extrude()polygon(points=curve, convexity=10);
}

// This creates a solid using the disk method with the specified number of disks.
// It accomplishes this by creating a number of rectangles of height f(x)-g(x),
// that are translated upwards by g(x)
module washers(a=-1, b=1, steps=5) {
    // Determine step size
    step_size = (b-a)/steps;
    
    rotate_extrude()union() {
        for(x = [a:step_size:b-step_size]) {
            translate([g(x),x,0])square(size = [f(x)-g(x),step_size],center=false);
        }
    }
}
