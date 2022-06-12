BASEDIR=$(dirname "$0")
echo $BASEDIR
mkdir -p $BASEDIR/../client/src/types/generated
mkdir -p $BASEDIR/../proto/cosmos/base/query/v1beta1
curl https://raw.githubusercontent.com/cosmos/cosmos-sdk/v0.42.6/proto/cosmos/base/query/v1beta1/pagination.proto -o $BASEDIR/../proto/cosmos/base/query/v1beta1/pagination.proto
mkdir -p $BASEDIR/../proto/confio
mkdir -p $BASEDIR/../proto/cosmos_proto
mkdir -p $BASEDIR/../proto/gogoproto
mkdir -p $BASEDIR/../proto/google/api
mkdir -p $BASEDIR/../proto/google/protobuf
mkdir -p $BASEDIR/../proto/tendermint/abci
mkdir -p $BASEDIR/../proto/tendermint/crypto
mkdir -p $BASEDIR/../proto/tendermint/libs/bits
mkdir -p $BASEDIR/../proto/tendermint/p2p
mkdir -p $BASEDIR/../proto/tendermint/types
mkdir -p $BASEDIR/../proto/tendermint/version
curl https://raw.githubusercontent.com/cosmos/cosmos-sdk/v0.42.6/third_party/proto/confio/proofs.proto -o $BASEDIR/../proto/confio/proofs.proto
curl https://raw.githubusercontent.com/cosmos/cosmos-sdk/v0.42.6/third_party/proto/cosmos_proto/cosmos.proto -o $BASEDIR/../proto/cosmos_proto/cosmos.proto
curl https://raw.githubusercontent.com/cosmos/cosmos-sdk/v0.42.6/third_party/proto/gogoproto/gogo.proto -o $BASEDIR/../proto/gogoproto/gogo.proto
curl https://raw.githubusercontent.com/cosmos/cosmos-sdk/v0.42.6/third_party/proto/google/api/annotations.proto -o $BASEDIR/../proto/google/api/annotations.proto
curl https://raw.githubusercontent.com/cosmos/cosmos-sdk/v0.42.6/third_party/proto/google/api/http.proto -o $BASEDIR/../proto/google/api/http.proto
curl https://raw.githubusercontent.com/cosmos/cosmos-sdk/v0.42.6/third_party/proto/google/api/httpbody.proto -o $BASEDIR/../proto/google/api/httpbody.proto
curl https://raw.githubusercontent.com/cosmos/cosmos-sdk/v0.42.6/third_party/proto/google/protobuf/any.proto -o $BASEDIR/../proto/google/protobuf/any.proto
curl https://raw.githubusercontent.com/cosmos/cosmos-sdk/v0.42.6/third_party/proto/google/protobuf/any.proto -o $BASEDIR/../proto/google/protobuf/any.proto
curl https://raw.githubusercontent.com/cosmos/cosmos-sdk/v0.42.6/third_party/proto/tendermint/abci/types.proto -o $BASEDIR/../proto/tendermint/abci/types.proto
curl https://raw.githubusercontent.com/cosmos/cosmos-sdk/v0.42.6/third_party/proto/tendermint/crypto/keys.proto -o $BASEDIR/../proto/tendermint/crypto/keys.proto
curl https://raw.githubusercontent.com/cosmos/cosmos-sdk/v0.42.6/third_party/proto/tendermint/crypto/proof.proto -o $BASEDIR/../proto/tendermint/crypto/proof.proto
curl https://raw.githubusercontent.com/cosmos/cosmos-sdk/v0.42.6/third_party/proto/tendermint/lib/bits/types.proto -o $BASEDIR/../proto/tendermint/lib/bits/types.proto
curl https://raw.githubusercontent.com/cosmos/cosmos-sdk/v0.42.6/third_party/proto/tendermint/p2p/types.proto -o $BASEDIR/../proto/tendermint/p2p/types.proto
curl https://raw.githubusercontent.com/cosmos/cosmos-sdk/v0.42.6/third_party/proto/tendermint/types/block.proto -o $BASEDIR/../proto/tendermint/types/block.proto
curl https://raw.githubusercontent.com/cosmos/cosmos-sdk/v0.42.6/third_party/proto/tendermint/types/evidence.proto -o $BASEDIR/../proto/tendermint/types/evidence.proto
curl https://raw.githubusercontent.com/cosmos/cosmos-sdk/v0.42.6/third_party/proto/tendermint/types/params.proto -o $BASEDIR/../proto/tendermint/types/params.proto
curl https://raw.githubusercontent.com/cosmos/cosmos-sdk/v0.42.6/third_party/proto/tendermint/types/types.proto -o $BASEDIR/../proto/tendermint/types/types.proto
curl https://raw.githubusercontent.com/cosmos/cosmos-sdk/v0.42.6/third_party/proto/tendermint/types/validator.proto -o $BASEDIR/../proto/tendermint/types/validator.proto
curl https://raw.githubusercontent.com/cosmos/cosmos-sdk/v0.42.6/third_party/proto/tendermint/version/types.proto -o $BASEDIR/../proto/tendermint/version/types.proto
ls $BASEDIR/../proto/checkers | xargs -I {} ./node_modules/protoc/protoc/bin/protoc \
    --plugin="$BASEDIR/node_modules/.bin/protoc-gen-ts_proto" \
    --ts_proto_out="$BASEDIR/../client/src/types/generated" \
    --proto_path="$BASEDIR/../proto" \
    --ts_proto_opt="esModuleInterop=true,forceLong=long,useOptionals=messages" \
    checkers/{}
