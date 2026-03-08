/**************/
/*  さいころ  */
/*  乱数      */
/**************/
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main( )
{
    int n;

    printf("さいころを振ります。\n何かキーを押してください。\n");
    getchar(); // キー入力待ち

    srand(time(NULL)); // 乱数の準備

    n=rand( )%6+1; // 乱数からさいころの目を計算

    if ( n==1 ) {
        printf("+-------+\n");
        printf("|       |\n");
        printf("|   ●   |\n");
        printf("|       |\n");
        printf("+-------+\n");
    }
    else if ( n==2 ) {
        printf("+-------+\n");
        printf("| ●     |\n");
        printf("|       |\n");
        printf("|     ● |\n");
        printf("+-------+\n");
    }
    else if ( n==3 ) {
        printf("+-------+\n");
        printf("| ●     |\n");
        printf("|   ●   |\n");
        printf("|     ● |\n");
        printf("+-------+\n");
    }
    else if ( n==4 ) {
        printf("+------+\n");
        printf("| ●  ● |\n");
        printf("|      |\n");
        printf("| ●  ● |\n");
        printf("+------+\n");
    }
    else if ( n==5 ) {
        printf("+-------+\n");
        printf("| ●   ● |\n");
        printf("|   ●   |\n");
        printf("| ●   ● |\n");
        printf("+-------+\n");
    }
    else {
        printf("+-------+\n");
        printf("| ●   ● |\n");
        printf("| ●   ● |\n");
        printf("| ●   ● |\n");
        printf("+-------+\n");
    }

    return 0;
}
