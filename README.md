# Southern Virginia University Numerical Analysis
## Class Project

This repository contains a grab bag of resources for the learning and practice of numerical analysis at the undergraduate level. It is contributed to by the students MAT 410: _Introduction to Numerical Analysis_ at Southern Virginia University, Buena Vista, Virginia, spring 2024. The students will be adding to the course throughout the semester.  

Soon we will be starting Chapter 2 of Burden, which covers solving equations of a single variable. In preparation for this, I have started a Julia module called EquSolvers.jl. All the code projects for chapter two will be held in this module. 

## Root-finding methods: EquSolvers.jl

### Inverse Quadratic Interpolation

Inverse Quadratic Interpolation improves on the secant method by fitting a sideways parabola (i.e. a parabola is $y$) to three successive points of the iteration. The recursion boils down to the following. 

$$ 
\begin{align}
p_{n+1} = & \frac{f_{n-1}f_{n}}{(f_{n-2} - f_{n-1})(f_{n-2}-f_{n})}p_{n-2} + \frac{f_{n-2}f_{n}}{(f_{n-1} - f_{n-2})(f_{n-1}-f_{n})}p_{n-1} + \frac{f_{n-2}f_{n-1}}{(f_{n} - f_{n-2})(f_{n}-f_{n-1})}p_{n}
 \end{align}
$$

