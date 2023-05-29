#include <stdlib.h>
#include <stdio.h>

float sum(float n, float m){
        return n + m;
}

float substract(float n, float m){
        return n - m;
}

float multiply(float n, float m){
        return n * m;
}

float divide(float n, float m){
        return n / m;
}

float menu(void){
        char o[1];
        float n;
        float m;
        float r;
        scanf("%s", &o);
        scanf("%f", &n);
        scanf("%f", &m);
        if (o[0] == '+'){
                r = sum(n, m);
        } else if (o[0] == '-'){
                r = substract(n, m);
        } else if (o[0] == '*'){
                r = multiply(n, m);
        } else if (o[0] == '/'){
                r = divide(n, m);
        }
        return r;
}

int main(void){
        int t;
        scanf("%d", &t);
        int x;
        for (x = 0; x < t; x+=1){
                printf("%f\n",  menu());
        }
        return 0;
}
