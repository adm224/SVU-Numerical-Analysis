module EquSolver

function MC_log(x; N = 1000)
    count = 1

    for i = 1: N
        Y = rand()
        X = (x-1)*rand() + 1

        if Y < 1/X
            count = count +1
        end
    end
    I = count/N * (x-1)
end


function hal(Dave)
    println("I can't do that, $Dave.")
end

## Bisection method

"""
Bisection method
by Jared McBride (Feb 7, 2024)

An implementation of the bisection method [Numerical Analysis 9e, Burden, Sec 2.1].

"""
function bisect_method(f,a,b; maxit = 50, tol = 1e-10)

    j = 1               # Initialize counter
    fa = f(a)           # Function value at left end
    p = 0      # Form is prefered to (a+b)/2

    while j < maxit
        p = a + (b-a)/2
        fp = f(p)  
        if fp == 0 || (b-a)/2 < tol    # check p is the zero or error is with in tolerance
            break
        end

        if fa * fp > 0       # Check if fa and fp are different signs
            a = p 
            fa = fp
        else
            b = p
        end
        j = j + 1
    end

    return p, j
end

## Fixed point iterations

"""
fixed_point by Aaron Miller

Choosing a function and an initial point: when choosing a function,
    it is important to note that the derivative at the initial point
    p0 and the derivative at the eventual fixed point must be less than
    1. In addition, it is important to note that the 

function fixed_point(f, p0; tol=1e-10, maxit=50)
    i=1 
    p=0
    while i<=maxit
        p=f(p0)
        if abs(p-p0)<=tol
            break
        end
        i=i+1
        p0=p
    end
    if i == maxit+1
        println("Method Failed")
    end
    return p, i
end


## Newtons method


## Second Order Newton's method

""" 
# Inverse quadratic interpolation
By Jared McBride (2-20-2025, Buena Vista, VA)

This is an extension of the secant method method. But rather than using the secant line from two points it uses an arc from a sideways parabola, interpolated by three points. For more information see [Wikipedia](https://en.wikipedia.org/wiki/Inverse_quadratic_interpolation)

Inputs:
f - the function whose root we seek
p0, p1, p2 - three initial points.
N - max number of iterations
tol - error tolerance

outputs:
p - the approximated roots
n - the number of iterations it took

## Example:
```
f = x -> cos(x) - x
p0 = .5
p1 = .6

p = QuadNewton(f, p0, p1).p
```
"""
function QuadNewton(f, p0, p1; 
    # Use secant to get a third point
    p2  = p0 - (p1 - p0) / (f(p1) - f(p0)) * f(p0), 
    N   = 30,          # Default max number of iterations
    tol = 1e-10        # Defauls tolerance
    )

    P = [p0; p1; p2]
    F = f.(P)
    c = zeros(3)
    p = 0
    n = 1
    P_all = zeros(N)
    
    while n < N && abs(P[3] - P[2]) > tol
        # Compute coefficients for the quadratic
        c[1] = (F[2] / (F[1] - F[2])) * (F[3] / (F[1] - F[3]))
        c[2] = (F[1] / (F[2] - F[1])) * (F[3] / (F[2] - F[3]))
        c[3] = (F[1] / (F[3] - F[1])) * (F[2] / (F[3] - F[2]))

        # Get new point
        p = c'P 
        P_all[n] = p       # Save p

        # Roll in the new point
        P = [P[2:3]; p]
        F = [F[2:3]; f(p)]
        
        # increment counter
        n += 1
    end

    return (p = p,
            n = n,
            Ps = P_all)
end





        







end # module
