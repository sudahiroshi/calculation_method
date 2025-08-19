using Printf

const EPS = 0.0001

function func_y( x )
    return x^3.0 + x - 1.0
end

function func_z( x )
    return 3.0 * x^2.0 + 1.0
end

a = 1.0
b = 0

while true
    global b = a - func_y(a) / func_z(a)
    if abs( a- b ) < EPS
        break
    else
        global a = b
    end
end
@printf( "近似解x = %6.3f\n", b )
