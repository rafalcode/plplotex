CC=gcc
CFLAGS=-g -Wall

LIBSM=-L/opt/local/lib -lplplot
LIBS0=-lplplotd -lltdl -lm -lcsirocsa -lcsironn -lqhull -lqsastime
LIBS=-lplplotd -lltdl -lm -lshp -lcsirocsa -lcsironn -lqhull -lqsastime

# beware library pjkg-config is like so
# $ pkg-config --libs plplotd
# -lplplotd -lltdl -lm -lshp -lcsirocsa -lcsironn -lqhull -lqsastime

# tjhe plparsepts() func is well equipped with docs, so just
# put -h after these sample programs to see it.

# To run these progs without the pesky interrruptions:
# ./x00c -o o2.png -dev pngcairo

EXES=x00c x01c x02c

x00c: x00c.c
	${CC} ${CFLAGS} -o $@ $^ $(LIBS0)
# for mac
x00c_: x00c.c
	${CC} ${CFLAGS} -I/opt/local/include -o $@ $^ $(LIBSM)

x01c: x01c.c
	${CC} ${CFLAGS} -o $@ $^ $(LIBS)
# fuer mac
x01c_: x01c.c
	${CC} ${CFLAGS} -I/opt/local/include -o $@ $^ $(LIBSM)

x02c: x02c.c
	${CC} ${CFLAGS} -o $@ $^ $(LIBS)

.PHONY: clean

clean:
	rm -f ${EXES}
