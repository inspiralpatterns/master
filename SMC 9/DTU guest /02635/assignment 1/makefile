CC=cc
SRCS=randGen.c array2d.c generators.c
EXECUTABLE=randGen
CFLAGS=-g -Wall -Wextra --std=c99
LFLAGS=
LIBS=-lm
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
