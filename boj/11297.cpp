#include <cstdio>

int main(void) {
    int a, b, c;
    char s[260];
    while (true) {
        scanf("%d %d %d", &a, &b, &c);
        getchar();
        if (a*b*c==0) break;
        int k = (a+b+c)%25+1;
        fgets(s, sizeof(s), stdin);
        for (int i=0; s[i]!='\n'; i++) {
            if (s[i]>='a'&&s[i]<='z') {
                printf("%c", 'a'+(s[i]-'a'-k+26)%26);
            } else printf("%c", s[i]);
        }
        printf("\n");
    }
    return 0;
}