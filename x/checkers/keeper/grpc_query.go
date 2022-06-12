package keeper

import (
	"github.com/pablo/checkers/x/checkers/types"
)

var _ types.QueryServer = Keeper{}
