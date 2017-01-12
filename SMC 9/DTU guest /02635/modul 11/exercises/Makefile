CC=clang
SRCS=ex4.c linalg.c
EXECUTABLE=ex4
CFLAGS=-g -Wall -Wextra
LFLAGS=
LIBS=-llapack -lblas -lm
INCLUDES=

OBJS=$(SRCS:.c=.o)

all: $(SRCS) $(EXECUTABLE)

$(EXECUTABLE): $(OBJS)
	$(CC) $(OBJS) $(LFLAGS) $(LIBS) -o $@

%.o: %.c
	$(CC) -c $(CFLAGS) $(INCLUDES) $< -o $@

clean:
	rm *.o $(EXECUTABLE)

run: $(EXECUTABLE)
	./$<
