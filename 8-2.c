// 時間分割法による高速DFT

#include    <stdio.h>
#define     _USE_MATH_DEFINES
#include    <math.h>

#define L   3                   // 最大サンプル数（2^L)

double r[ 1024 ], i[ 1024 ], wr[ 512 ], wi[ 512 ];

void bit( int );
void dft( int );
void bat( int, double, int, int );
double func_y( double );

int main( int argc, char **argv ) {
    int p;

    p = (int)pow( 2.0, (double)L );

    for( int j=0; j<1024; j++ ) {
        r[ j ] = 0.0;
        i[ j ] = 0.0;
    }

                                // データを 1/p 倍してサンプリング
    for( int j=0; j<p; j++ )
        i[ j ] = func_y( ( 2.0 * M_PI / (double)p ) * (double)j )
                 / (double)p;

                                // 原関数データを表示
    printf( "No.\tデータ\n" );
    for( int j=0; j<p; j++ )
        printf( "i[%d] = %9.3lf\n", j, i[ j ] * (double)p );

    bit( p );
    dft( p );

    printf( "\n次数\t実数部\t虚数部\n" );   // DFT データ表示
    for( int j=0; j<p; j++ )
        printf( "%4d%9.3lf%9.3lf\n", j, r[ j ], i[ j ] );
    return 0;
}

                                // ビット逆順配列換え計算
void bit( int p ) {
    int d, c;

                                // ビット逆順
    for( int j=0; j<p; j++ ) {
        d = j;
        c = p / 2;
        for( int k=0; k<L; k++ ) {
            printf("j:%d d:%d c:%d\n", j, d, c);
            r[ j ] += ( d % 2 ) * c;
            d /= 2;
            c /= 2;
        }
    }

                                // データ入れ換え
    for( int j=0; j<p; j++ ){
        printf( "r[%d]: %9.3f : ", j, r[j] );
        r[ j ] = i[ (int)r[ j ] ];
        printf( "%9.3f\n", r[j] );
    }

                                // 配列 i クリア
    for( int k=0; k<1024; k++ )
        i[ k ] = 0.0;
}

                                // 高速フーリエ変換
void dft( int p ) {
    int a, b;
    double w, q, t;

                                // 回転因子値格納
    for( int j=0; j<=p/2; j++ ) {
        w = -2.0 * M_PI / (double)p * (double)j;
        wr[ j ] = cos( w );
        wi[ j ] = sin( w );
    }

                                // 高速フーリエ変換
    for( int j=0; j<L; j++ ) {
        t = pow( 2.0, (double)j );
        q = pow( 2.0, (double)L - 1.0 - (double)j );
        for( int k=0; k<q; k++ )
            for( int h=0; h<t; h++ ) {
                a = (int)( (double)k * 2.0 * t + (double)h );
                b = (int)( (double)a + t );
                bat( h, q, a, b );
            }
    }
}

                                // 複素数のバタフライ演算
void bat( int h, double q, int a, int b ) {
    int w;
    double ra, rb, ia, ib;

    w = (int)( (double)h * q );
    ra = r[ a ] + r[ b ] * wr[ w ] - i[ b ] * wi[ w ];
    ia = i[ a ] + r[ b ] * wi[ w ] + i[ b ] * wr[ w ];
    rb = r[ a ] - r[ b ] * wr[ w ] + i[ b ] * wi[ w ];
    ib = i[ a ] - r[ b ] * wi[ w ] - i[ b ] * wr[ w ];
    r[ a ] = ra;
    i[ a ] = ia;
    r[ b ] = rb;
    i[ b ] = ib;
}

                                // 原関数 3sin(x) + 7cos(3x) 定義
double func_y( double x ) {
    return 3.0 * sin( x ) + 7.0 * cos( 3.0 * x );
}