#include <stdlib.h>
#include <stdio.h>

int main(void){
        int n, x, m, y;
        scanf("%d", &n);
        for (x = 0; x < n; x+=1){
                scanf("%d", &m);
                float i, min;
                scanf("%f", &i);
                min = i;
                for (y = 0; y < m-1; y+=1){
                        scanf("%f", &i);
                        if (i < min){
                                min = i;
                        }
                }
                printf("%f\n", min);
        }
        return 0;
}
