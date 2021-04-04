.PHONY: run
run:
	flutter run

.PHONY: gen_proto
gen_proto:
	protoc -I lib/proto --dart_out=grpc:lib/proto/pb lib/proto/*.proto
