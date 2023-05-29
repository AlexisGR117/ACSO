#include <stdlib.h>
#include <stdio.h>

int main(void){
        int n;
        int n1;
        int n2;
        int suma;
        scanf("%d", &n);
        int x;
        for(x = 0; x < n; x+=1){
                scanf("%d", &n1);
                scanf("%d", &n2);
                suma =  n1 + n2;
                printf("%d\n", suma);
        }
        return 0;
}

