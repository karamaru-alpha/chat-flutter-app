.PHONY: run
run:
	flutter run --dart-define=PORT=8080 --dart-define=HOST='localhost'

.PHONY: gen_proto
gen_proto:
	protoc -I lib/proto --dart_out=grpc:lib/proto/pb lib/proto/*.proto
