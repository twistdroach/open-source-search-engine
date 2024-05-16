SRC_DIR := src
OBJ_DIR := obj
BIN_DIR := .

EXE := $(BIN_DIR)/gb

SRC := $(wildcard $(SRC_DIR)/*.cpp $(SRC_DIR)/*.c)
OBJ := $(SRC:$(SRC_DIR)/%.cpp=$(OBJ_DIR)/%.o)

DEFS := -DPTHREADS -D_REENTRANT_ -D_CHECK_FORMAT_STRING_
CPPFLAGS := -g -Wall -Wextra -pipe -fno-stack-protector $(DEFS) -O3 -std=c++23
LDLIBS := -lm -lpthread -lssl -lcrypto -lz

$(EXE): $(OBJ) | $(BIN_DIR)
	$(CXX) $(LDFLAGS) $^ $(LDLIBS) -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp | $(OBJ_DIR)
	$(CXX) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

$(OBJ_DIR) $(BIN_DIR):
	mkdir -p $@

Make.depend:
	$(CXX) -MM $(DEFS) $(SRC) > $@

install: $(EXE)
	mkdir -p $(DESTDIR)/var/gigablast/data0/
	mkdir -p $(DESTDIR)/usr/bin/
	mkdir -p $(DESTDIR)/etc/init.d/
	mkdir -p $(DESTDIR)/etc/init/
	mkdir -p $(DESTDIR)/etc/rc3.d/
	mkdir -p $(DESTDIR)/lib/init/
	$(EXE) copyfiles $(DESTDIR)/var/gigablast/data0/
	$(RM) $(DESTDIR)/usr/bin/gb
	ln -s /var/gigablast/data0/gb $(DESTDIR)/usr/bin/gb
	cp S99gb $(DESTDIR)/etc/init.d/gb
	ln -s /etc/init.d/gb $(DESTDIR)/etc/rc3.d/S99gb

clean:
	rm -rf $(OBJ_DIR) $(EXE)

all: $(EXE)
depend: Make.depend

include Make.depend

.PHONY: all clean install depend
