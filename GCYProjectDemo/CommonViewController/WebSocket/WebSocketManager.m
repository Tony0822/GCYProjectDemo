//
//  WebSocketManager.m
//  GCYDemo
//
//  Created by gewara on 17/7/31.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import "WebSocketManager.h"

@implementation WebSocketManager

- (void)withIP:(NSString *)URLIP {
    _webSocket.delegate = nil;
    [_webSocket close];
    
    NSString *urlStr = [NSString stringWithFormat:@"%@", URLIP];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setValue:@"http://" forHTTPHeaderField:@"sss"];
    _webSocket = [[SRWebSocket alloc] initWithURLRequest:request];
    _webSocket.delegate = self;
}

- (void)openSocket {
    [_webSocket open];
}

- (void)closeSocket {
    self.webSocket.delegate = nil;
    [self.webSocket close];
    self.webSocket = nil;
}
- (void)sendTalkMessage:(NSString *)message {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic = [@{@"content":message} mutableCopy];
    [self sendMessage:dic];
}
- (void)SendPangMessage {

}


#pragma mark websocket代理
- (void)webSocketDidOpen:(SRWebSocket *)webSocket {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:@{@"type":@"login"}
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    [webSocket send:jsonStr];
}

- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message {
    NSData *jsonData = [message dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers error:&error];
    [self.delegate getMessageFromSocket:dic];
}

- (void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean {
    NSLog(@"WebSocket 关闭");
    _webSocket = nil;
}

- (void)webSocket:(SRWebSocket *)webSocket didReceivePong:(NSData *)pongPayload {
    
}

- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error {
    NSLog(@"WebSocket 错误%@", error);
    _webSocket = nil;
}

// send数据转化为json
- (void)sendMessage:(NSDictionary *)messageDic {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:messageDic
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUnicodeStringEncoding];
    
    [_webSocket send:jsonStr];

}
@end
