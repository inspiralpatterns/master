CC=clang
SRCS=dgesv_time.c linalg.c
EXECUTABLE=dgesv_time
CFLAGS=-g -Wall -Wextra -DNDEBUG
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
