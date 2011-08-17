OPA=opa
EXE=chess.exe

all: $(EXE)

chess.exe: chess.user.opx chess.chess.opx chess.game.opx src/main.opa
	$(OPA) $^ -o $(EXE)

chess.user.opx: src/user.opa
	$(OPA) $^  --no-server --autocompile

chess.chess.opx: src/chess.opa
	$(OPA) $^  --no-server --autocompile

chess.game.opx: src/game.opa
	$(OPA) $^  --no-server --autocompile

run: 	all
	./$(EXE)

clean:
	rm -rf _build _tracks
	rm -rf *.exe
	rm -rf *.log
	rm -rf *.opp
	rm -rf *.opx
	rm -rf *.opx.broken

