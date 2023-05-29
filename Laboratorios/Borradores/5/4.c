#include <stdlib.h>
#include <stdio.h>

int read(int v[], int t){
        int x, n;
        for (x = 0; x < t; x += 1){
                scanf("%d", &n);
                v[x] = n;
        }
return 0;
}

int sum(int v[], int s, int t){
        int x;
        for (x = 0; x < t; x+=1){
                s += v[x];
        }
return s;
}


int main(void){
        int x, t;
        scanf("%d", &t);
        for (x = 0; x < t; x+=1){
                int m;
                scanf("%d", &m);
                int v[m];
                read(v, m);
                printf("%d\n", sum(v, 0, m));
        }
return 0;
}
