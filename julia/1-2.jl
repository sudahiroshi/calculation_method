using Printf

const ε = 0.0001

func_y( x ) = x^3.0 + x - 1.0
func_z( x ) = 3.0x^2.0 + 1.0

a = 1.0
b = 0

while true
    global b = a - func_y(a) / func_z(a)
    if abs( a- b ) < ε
        break
    else
        global a = b
    end
end
@printf( "近似解x = %6.3f\n", b )
