#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
int main() {
    char *c = malloc(sizeof(char) * 11);
    char *s = "aaaaaaaaa1";
    for ( int i = 0; i < 10; i ++ ) {
        c[i] = 'a' + i;
    }
    //memcpy(c, s, 10);
    c[10] = '\0';
    //memcpy(c, s, strlen(s));
    printf("malloc %s\n", c);
    sleep(30);
    free(c);
}
