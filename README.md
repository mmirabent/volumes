# Volumes of Various Solids

These OpenSCAD models serve to help visualise various methods of finding the
volume of a solid. There are five files included, they are described below. The
functions that define the solid are defined at the top of the files. Feel free
to edit these functions to create custom solids. Be aware that the functions
must be written in OpenSCAD, a cheatsheet is available
[here](http://www.openscad.org/cheatsheet/). Note that all the trigonometric
functions are in degrees, NOT radians. This is a feature of OpenSCAD.

Constraints for f(x), g(x), a, and b are listed for each file. If these
constraints are violated, OpenSCAD may fail to render a solid. If it does render
a solid, it probably won't be what you're expecting.

## Disks

This file illustrates the disks method for finding the volume of a solid of
revolution. The curve is defined as f(x). The lower bound is defined as a. The
upper bound is defined as b. Steps is the number of steps to use when doing the
discrete disks method.

* Constraints
    * `f(x) >= 0` for all x such that `a <= x <= b`

## Washers

This file illustrates the washers method for finding the volume of a solid of
revolution. The shape being revolved is defined as the space between an upper
function f(x) and a lower function g(x), between a lower and upper bound, a and
b respectively.

* Constraints
    * `f(x) >= g(x)` and `g(x) >= 0` for all x such that `a <= x <= b`

## Triangles

The triangles file illustrates the method of finding a solid defined by
equilateral triangles, whose base is the line between an upper function
f(x) and a lower function g(x). The lower and upper bounds for this problem are defined by the
variables a and b respectively. The number of slices is defined by the variable steps. To
customize this, simply replace f(x), g(x), a, and b at the top of the file.

* Constraints
    * `f(x) >= g(x)` and `g(x) >= 0` for all x such that `a <= x <= b`

## Semi-Circles

The semi circles file works the same way as the triangles file, but using
semicircles who's diameter is defined as the line between an upper function f(x)
and a lower function g(x), with lower and upper bounds a and b respectively.

* Constraints
    * `f(x) >= g(x)` and `g(x) >= 0` for all x such that `a <= x <= b`

## Squares

The squares file again works the same as the triangles file, but using squares
whose side length is defined as the line between an upper function f(x) and a
lower function g(x), with lower and upper bounds a and b respectively. The same
rules apply for f(x) and g(x) as in the triangles file.

* Constraints
    * `f(x) >= g(x)` and `g(x) >= 0` for all x such that `a <= x <= b`

