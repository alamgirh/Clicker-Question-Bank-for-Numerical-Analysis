EPSFILES := $(wildcard *.eps)
STEMS    := $(patsubst %.eps,%, $(EPSFILES))

all: $(STEMS)

%: %.eps
	epstopdf $@.eps
