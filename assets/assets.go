package assets

import (
	"embed"
	"strings"
)

//go:embed client server
var f embed.FS

func Asset(name string) ([]byte, error) {
	if strings.HasPrefix(name, "assets/") {
		name = name[7:]
	}
	return f.ReadFile(name)
}
