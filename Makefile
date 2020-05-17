#! /usr/bin/env make

FILESDIR = $(HOME)/bin
FILE=pinentry-mine
TARGET = $(FILESDIR)/$(FILE)
SYSTARGET = /usr/local/bin/$(FILE)

all : $(TARGET)

$(TARGET): 
	install -c -m 755 $(FILE) $(TARGET) || { cp $(FILE) $(TARGET) && chmod 755 $(TARGET); }

install-link:
	sudo ln -f $(TARGET) $(SYSTARGET)

install: $(SYSTARGET)

$(SYSTARGET): $(TARGET)
	sudo install -c -m 755 -o root -g wheel $(TARGET) $(SYSTARGET) || { udo cp $(TARGET) $(SYSTARGET) && sudo chmod 755 $(SYSTARGET) && sudo chown root:wheel $(SYSTARGET); }

