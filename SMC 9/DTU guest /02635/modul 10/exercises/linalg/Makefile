CC=cc # C compiler, e.g. gcc, clang, icc, ...
SRCS=linalg.c test_norm_fro.c
EXECUTABLE=test_norm_fro
CFLAGS=-c -Wall -g #-std=c99
LFLAGS=
LIBS=
INCLUDES=
OBJS=$(SRCS:.c=.o)

test: $(SRCS) $(EXECUTABLE)

$(EXECUTABLE): $(OBJS)
	$(CC) $(OBJS) $(LFLAGS) $(LIBS) -o $@

%.o: %.c
	$(CC) -c $(CFLAGS) $(INCLUDES) $< -o $@

clean:
	rm *.o $(EXECUTABLE)

run: $(EXECUTABLE)
	./$<
