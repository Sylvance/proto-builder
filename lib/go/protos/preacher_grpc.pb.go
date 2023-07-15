// Code generated by protoc-gen-go-grpc. DO NOT EDIT.
// versions:
// - protoc-gen-go-grpc v1.2.0
// - protoc             v3.6.1
// source: protos/preacher.proto

package test_preacher

import (
	context "context"
	grpc "google.golang.org/grpc"
	codes "google.golang.org/grpc/codes"
	status "google.golang.org/grpc/status"
)

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
// Requires gRPC-Go v1.32.0 or later.
const _ = grpc.SupportPackageIsVersion7

// PreacherClient is the client API for Preacher service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type PreacherClient interface {
	// Sends a greeting
	SayHello(ctx context.Context, in *HelloRequest, opts ...grpc.CallOption) (*HelloReply, error)
	// Sends another greeting
	SayHelloAgain(ctx context.Context, in *HelloRequest, opts ...grpc.CallOption) (*HelloReply, error)
}

type preacherClient struct {
	cc grpc.ClientConnInterface
}

func NewPreacherClient(cc grpc.ClientConnInterface) PreacherClient {
	return &preacherClient{cc}
}

func (c *preacherClient) SayHello(ctx context.Context, in *HelloRequest, opts ...grpc.CallOption) (*HelloReply, error) {
	out := new(HelloReply)
	err := c.cc.Invoke(ctx, "/preacher.Preacher/SayHello", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *preacherClient) SayHelloAgain(ctx context.Context, in *HelloRequest, opts ...grpc.CallOption) (*HelloReply, error) {
	out := new(HelloReply)
	err := c.cc.Invoke(ctx, "/preacher.Preacher/SayHelloAgain", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// PreacherServer is the server API for Preacher service.
// All implementations must embed UnimplementedPreacherServer
// for forward compatibility
type PreacherServer interface {
	// Sends a greeting
	SayHello(context.Context, *HelloRequest) (*HelloReply, error)
	// Sends another greeting
	SayHelloAgain(context.Context, *HelloRequest) (*HelloReply, error)
	mustEmbedUnimplementedPreacherServer()
}

// UnimplementedPreacherServer must be embedded to have forward compatible implementations.
type UnimplementedPreacherServer struct {
}

func (UnimplementedPreacherServer) SayHello(context.Context, *HelloRequest) (*HelloReply, error) {
	return nil, status.Errorf(codes.Unimplemented, "method SayHello not implemented")
}
func (UnimplementedPreacherServer) SayHelloAgain(context.Context, *HelloRequest) (*HelloReply, error) {
	return nil, status.Errorf(codes.Unimplemented, "method SayHelloAgain not implemented")
}
func (UnimplementedPreacherServer) mustEmbedUnimplementedPreacherServer() {}

// UnsafePreacherServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to PreacherServer will
// result in compilation errors.
type UnsafePreacherServer interface {
	mustEmbedUnimplementedPreacherServer()
}

func RegisterPreacherServer(s grpc.ServiceRegistrar, srv PreacherServer) {
	s.RegisterService(&Preacher_ServiceDesc, srv)
}

func _Preacher_SayHello_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(HelloRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(PreacherServer).SayHello(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/preacher.Preacher/SayHello",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(PreacherServer).SayHello(ctx, req.(*HelloRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _Preacher_SayHelloAgain_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(HelloRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(PreacherServer).SayHelloAgain(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/preacher.Preacher/SayHelloAgain",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(PreacherServer).SayHelloAgain(ctx, req.(*HelloRequest))
	}
	return interceptor(ctx, in, info, handler)
}

// Preacher_ServiceDesc is the grpc.ServiceDesc for Preacher service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var Preacher_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "preacher.Preacher",
	HandlerType: (*PreacherServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "SayHello",
			Handler:    _Preacher_SayHello_Handler,
		},
		{
			MethodName: "SayHelloAgain",
			Handler:    _Preacher_SayHelloAgain_Handler,
		},
	},
	Streams:  []grpc.StreamDesc{},
	Metadata: "protos/preacher.proto",
}