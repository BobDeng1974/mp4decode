# set the compile chain
CC = gcc -g
CFLAGS = -Wall

#target
TARGET=mp4encode

# h file seach path
INC = -I. -I./include/mp4v2

# lib file and path
DLIBS = -lmp4v2
LDFLAGS = -L ./lib

# running lib path
RPATH = -Wl,-rpath=./lib

# SRC
SRCS = main.c MP4Encoder.c
# Obj file
OBJS = $(SRCS:.c=.o)

$(TARGET):$(OBJS)
#	$(CC) -o $@ $^ $(LDFLAGS) $(DLIBS) $(RPATH)
	$(CC) -o $@ $^ $(LDFLAGS) $(DLIBS)	$(RPATH)
	
clean:
	rm -rf $(TARGET) $(OBJS)
	

# continue :1 clean 2 compile 3.run
exec:clean $(TARGET)
	@echo  run the app
	./$(TARGET)
	@echo  finish!!!
# compile rules
%.o:%.c
	$(CC) $(CFLAGS) $(INC) -o $@ -c $<
		
	

