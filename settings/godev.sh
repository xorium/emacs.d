go get -u -v github.com/nsf/gocode
go get -u -v github.com/rogpeppe/godef
go get -u -v github.com/jstemmer/gotags
go get -u -v github.com/kisielk/errcheck
go get -u -v github.com/golang/lint/golint
go get -u -v golang.org/x/tools/cmd/...
go get -u -v golang.org/x/tools/cmd/godoc
go get -u -v golang.org/x/tools/cmd/oracle
go get -u -v golang.org/x/tools/cmd/gorename
go get -u -v golang.org/x/tools/cmd/goimports
go get -u -v github.com/alecthomas/gometalinter
go get -u -v github.com/kardianos/govendor

gometalinter --install

apt update && sudo apt-get install -y texinfo make

setxkbmap -option 'ctrl:nocaps'