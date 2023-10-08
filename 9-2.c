// 球体の体積計算

#include    <stdio.h>
#include    <stdlib.h>
#include    <math.h>

#define N   10000                   // 繰返し回数
#define DIM 5                       // 次元数

int main( int argc, char **argv ) {
    double x[ DIM ], r[ DIM ];
    double rr;
    int m[ DIM ];

    for( int j=0; j<DIM; j++ )
        m[ j ] = 0;
                                    // 見出し打出し
    printf( " 回数円面積球体積4次元5次元\n\n" );
    for( int n=1; n<=N; n++ ) {
        for( int j=0; j<DIM; j++ ) {
            x[ j ] = (double)rand() / (double)RAND_MAX;
            r[ j ] = 0.0;
        }
        rr = 0.0;
        for( int j=0; j<DIM; j++ ) {
            rr += ( x[ j ] - 0.5 ) * ( x[ j ] - 0.5 );
            r[ j ] = rr;
        }
        for( int j=0; j<DIM; j++ )
            if( r[ j ] <= 0.25 ) m[ j ]++;
        if( ( n % 1000 ) == 0 ) {
                                    // 解打出し
            printf( "%6d ", n );
            for( int j=1; j<DIM; j++ )
                printf( "%9.4lf", (double)m[ j ] / (double)n );
            printf( "\n" );
        }
    }
    return 0;
}