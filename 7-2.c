// ヤコビ法による固有値と固有ベクトル計算

#include    <stdio.h>
#include    <math.h>

#define N   3                       // 次数設定
#define EPS 0.0001                  // 収束範囲

int main( int argc, char **argv ) {
    double a[N][N] = {
        {  5.0000, -1.4142,  0.0000 },
        { -1.4142,  1.5000, -0.4082 },
        {  0.0000, -0.4082,  0.3333 } }; // 係数行列
    double u[N][N];                 // 単位行列
    double alpha, beta, gamma;
    double s, c, w;
    double wa, wb, wc;
    double max;
    int p, q, x, y;

    for( int i=0; i<N; i++ )
        for( int j=0; j<N; j++ )
            u[i][j] = 0.0;

    for( int i=0; i<N; i++ )
        u[i][i] = 1.0;

    while(1) {
                                    // 最大要素の行と列を検索
        max = 0.0;
        for( int i=0;i<N-1; i++ )
            for( int j=i+1; j<N; j++ )
                if( fabs( a[i][j] ) > max ) {
                    p = i;
                    q = j;
                    max = fabs( a[i][j] );
                }
                                    // 収束したら解打出し
        if( max < EPS ) break;

                                    // sinθ, cosθ 計算
        wa = a[p][p];
        wb = a[p][q];
        wc = a[q][q];
        alpha = -wb;
        beta = 0.5 * ( wa - wc );
        gamma = fabs( beta ) / sqrt( alpha * alpha + beta * beta );
        s = sqrt( 0.5 * ( 1.0 - gamma ) );
        if( alpha * beta < 0 ) s = -s;
        c = sqrt( 1.0 - s * s );

                                    // 直交変換
        for( int j=0; j<N; j++ ) {
            w = a[p][j] * c - a[q][j] * s;
            a[q][j] = a[p][j] * s + a[q][j] * c;
            a[p][j] = w;
        }

        for( int j=0; j<N; j++ ) {
            a[j][p] = a[p][j];
            a[j][q] = a[q][j];
        }

        w = 2.0 * wb * s * c;
        a[p][p] = wa * c * c + wc * s * s - w;
        a[q][q] = wa * s * s + wc * c * c + w;
        a[p][q] = 0;
        a[q][p] = 0;

                                    // 漸化式計算
        for( int i=0; i<N; i++ ) {
            w = u[i][p] * c - u[i][q] * s;
            u[i][q] = u[i][p] * s + u[i][q] * c;
            u[i][p] = w;
        }
    }

    printf("固有値\n");
    for( int i=0; i<N; i++ )
        printf( "%7.4lf ", a[i][i] );
    printf( "\n\n" );
    printf("固有ベクトル\n");
    for( int i=0; i<N; i++ ) {
        for( int j=0; j<N; j++ )
            printf( "%7.4lf ", u[i][j] );
        printf( "\n" );
    }
    return 0;
}