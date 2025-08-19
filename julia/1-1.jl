using Printf

const ε = 0.0001

function nibun( a, b )
    c = 0
    while true
        c = ( a + b ) / 2.0
        if ( func_y(c) * func_y(a) ) < 0
            b = c
        else
            a = c
        end
        if !( abs( a - b) > ε )
            break
        end
    end
    return c
end

function func_y( x )
    return x^3.0 + x - 1.0
end

a = 0.0
b = 1.0

println( "x^3 + x - 1 = 0 の2分法による数値計算\n" )
@printf( "初期値a = %6.3lf\n", a )
@printf( "初期値b = %6.3lf\n", b )
x = nibun( a, b )
@printf( "近似解x = %6.3lf\n", x )
