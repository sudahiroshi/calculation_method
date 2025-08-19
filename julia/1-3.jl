using Printf

const EPS = 0.0001

function bairstow( a, n )
    b = zeros(n+1)
    c = zeros(n+1)

    p = 1.0
    q = 1.0

    while true
        b[1] = a[1]
        b[2] = a[2] - p * b[1]
        for k = 3:n+1
            b[k] = a[k] - p * b[k-1] - q * b[k-2]
        end
        c[1] = b[1]
        c[2] = b[2] - p * c[1]
        for k = 3:n+1
            c[k] = b[k] - p * c[k-1] - q * c[k-2]
        end
        e = c[n-1]^2.0 - c[n-2] * ( c[n] - b[n] )
        dp = ( b[n] * c[n-1] - b[n+1] * c[n-2] ) / e
        dq = ( b[n+1] * c[n-1] - b[n] * ( c[n] - b[n] ) ) / e

        p += dp
        q += dq
        if !(( abs(dp) > EPS ) || ( abs(dq) > EPS ))
            break
        end
    end

    for i=1:n-1
        a[i] = b[i]
    end
    return(p,q)
end

function root( p, q )
    d = p^2.0 - 4.0q
    if d <= 0
        f = sqrt( -d )
        println( -p / 2.0 + (f / 2.0)im )
        println( -p / 2.0 - (f / 2.0)im )
    else
        f = sqrt( d )
        println( ( -p + f ) / 2.0 )
        println( ( -p - f ) / 2.0 )
    end
end

n = 4
a = [ 1.0, -2.0, 2.0, -50.0, 62.0 ]

while n > 0
    if n==1
        println( -a[2]/a[1] + 0im )
        break
    elseif n==2
        root( a[2], a[3] )
        break
    # elseif n==0
    #     break
    end

    ( p, q ) = bairstow( a, n )
    root( p, q )
    global n -= 2
end
