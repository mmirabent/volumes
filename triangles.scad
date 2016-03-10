// Make circles smooth
$fn=200;

// function for curves
function f(x) = 1+sin(2*x*180/3.14);
function g(x) = exp(x/2);
a = 0;
b = 1.1357;

// functions for circles
//function f(x) = sqrt(1- pow(x,2));
//function g(x) = -f(x);
//a = -1;
//b = 1;

//function f(x) = sqrt(x) + 4;
//function g(x) = -sqrt(x) + 4;
//a = 0;
//b = 16;

triangles(a,b,100);

// Don't edit under this line
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

module triangles(a=0, b=1, steps=10) {
    // Determine step size
    step_size = (b-a)/steps;
    sqrt_3 = 1.732050;
    
    function height(b) = ((sqrt_3/2)*b);
    
    union() {
        for(x = [a:step_size:b]) {
            points = [
                [0,f(x)],
                [0,g(x)],
                [height(f(x)-g(x)),(f(x)-g(x))/2+g(x)]
            ];
            translate([x,0,0])rotate([0,-90,0])linear_extrude(step_size)polygon(points);
        }
    }
}
