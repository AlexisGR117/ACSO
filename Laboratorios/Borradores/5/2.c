#include <stdlib.h>
#include <stdio.h>

int main(void){
        int n, x;
        float a, b;
        scanf("%d", &n);
        for (x = 0; x < n; x+=1){
                scanf("%f", &a);
                scanf("%f", &b);
                if (a < b){
                        printf("%f\n", b);
                }else{
                        printf("%f\n", a);
                }
        }
        return 0;
}