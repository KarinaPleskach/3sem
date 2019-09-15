#include <stdio.h>
#include <stdlib.h>

void dext(int a, int b, int* d, int* x, int* y){
    printf("a = %d  b = %d\n", a, b);
    int s;
    if (b == 0) {
        *d = a;
        *x = 1;
        *y = 0;
        printf("d = %d\n", *d);
        return;
    }
    dext(b,a % b,d,x,y);
    s = *y;
    *y = *x - (a / b) * (*y);
    *x = s;
}

int main()
{
    int a = 20;
    int b = 4;
    int d = 0;
    int x = 0;
    int y = 0;
    dext(a,b,&d,&x,&y);
    printf("%d   %d", x, y);
    return 0;
}
