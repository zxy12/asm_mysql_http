#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <stdlib.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <sys/socket.h>

int main(){
    extern int errno;
    //创建套接字
    int sock = socket(AF_INET, SOCK_STREAM, 0);

    //向服务器（特定的IP和端口）发起请求
    struct sockaddr_in serv_addr;
    memset(&serv_addr, 0, sizeof(serv_addr));  //每个字节都用0填充
    serv_addr.sin_family = AF_INET;  //使用IPv4地址
    serv_addr.sin_addr.s_addr = inet_addr("127.0.0.1");  //具体的IP地址
    serv_addr.sin_port = htons(80);  //端口
    int c = connect(sock, (struct sockaddr*)&serv_addr, sizeof(serv_addr));
    if (c == -1) {
	printf("connect err%d,%s\n", errno, strerror(errno));
	exit(-1);
    }
    
    char *msg = "GET /";
    printf("send a str%s\n", msg);

    int s = send(sock, msg, strlen(msg), 0); 
    msg = "\r\n";
    s = send(sock, msg, strlen(msg), 0); 
    printf("send %d char\n", s);
   
    //读取服务器传回的数据
    char buffer[400];
    s = 0;
    do {
    	s = recv(sock, buffer, sizeof(buffer)-1, 0);
	if (s == 0) {
		break;
	}
    	//s = read(sock, buffer, sizeof(buffer)-1);
	buffer[s] = '\0';
   
    	printf("(Message form server: %d, [%s],%d)\n", s, buffer, strlen(buffer));
    } while (s != 0);
   
    //关闭套接字
    close(sock);

    return 0;
}
