ifndef OMDEV
	LDFLAGS=
else
	LDFLAGS=-lwsock32
endif


all: client TwoTanks.TanksConnectedPI	interactive-simulation-commands.txt
	./TwoTanks.TanksConnectedPI.exe -interactive > trace-server.txt 2>&1 &
	./client.exe interactive-simulation-commands.txt > trace-client.txt 2>&1

TwoTanks.TanksConnectedPI: TwoTanks/* buildModel.mos
	../../build/bin/omc buildModel.mos

client: ../../c_runtime/interactive/*.c* ../../c_runtime/interactive/*.h*
	g++ -o client ../../c_runtime/interactive/client.cpp -I../../c_runtime/interactive/ \
	../../c_runtime/interactive/thread.cpp \
	../../c_runtime/interactive/socket.cpp $(LDFLAGS)

clean: 
	rm -f TwoTanks.TanksConnectedPI* client.* trace-client.txt trace-server.txt
