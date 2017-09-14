//
//  WebSocketManager.h
//  GCYDemo
//
//  Created by gewara on 17/7/31.
//  Copyright © 2017年 gewara. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SocketRocket/SRWebSocket.h>


// 设置代理，用于接受WebSocket传来消息时，在外部进行处理
@protocol getMessageDelegate <NSObject>

- (void)getMessageFromSocket:(NSDictionary *)message;

@end
@interface WebSocketManager : NSObject <SRWebSocketDelegate> // 签socket协议

@property (nonatomic, assign) id<getMessageDelegate>delegate;
@property (nonatomic, strong) SRWebSocket *webSocket;


/**
 外部调用传入链接URL
 */
- (void)withIP:(NSString *)URLIP;

/**
 外部控制打开WebSocket（拿到接口传给URL之后）
 */
- (void)openSocket;

/**
 外部控制关闭WebSocket
 */
- (void)closeSocket;

/**
 ping pong 心跳链接
 */
- (void)SendPangMessage;

/**
 外部聊天发送消息
 */
- (void)sendTalkMessage:(NSString *)message;
@end
