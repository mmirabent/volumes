$fn = 100;

// Functions
//function f(x) = sqrt(1 - pow(x,2));
//function g(x) = -f(x);
//a = -1;
//b = 1;
//steps = 10;

// function for curves
function f(x) = 1+sin(2*x*180/3.14);
function g(x) = exp(x/2);
a = 0;
b = 1.1357;
steps = 10;

semi_circles(a,b,steps);

// Don't edit below this line
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

module semi_circles(a = -1, b = 1, steps = 10) {

    step_size = (b-a)/steps;
    
    union() {
        for (x = [a:step_size:b-step_size]) {
            d = f(x)-g(x);
            
            translate([step_size+x,d/2+g(x),0])
            rotate([0,-90,0])
            linear_extrude(step_size)
            translate([d/2,0,0])square(d,center = true);
        }
    }
}