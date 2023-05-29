#include <stdlib.h>
#include <stdio.h>

int gcd(int a, int b){
        int saveA;
        while (b!=0){
                saveA = a;
                a = b;
                b = saveA % b;
        }
        return a;
}


int main(void){
        int a, b, c, d, e, p;
        scanf("%d", &a);
        scanf("%d", &b);
        scanf("%d", &c);
        scanf("%d", &d);
        scanf("%d", &e);
        p = gcd(gcd(gcd(gcd(a, b), c), d), e);
        printf("%d\n", p);
        printf("%d\n", a/p);
        printf("%d\n", b/p);
        printf("%d\n", c/p);
        printf("%d\n", d/p),
        printf("%d\n", e/p);
        printf("%d\n", a/p+b/p+c/p+d/p+e/p);
        return 0;
}
