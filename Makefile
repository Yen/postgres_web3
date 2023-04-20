MODULE_big = postgres_web3
OBJS = $(patsubst %.c,%.o,$(wildcard src/*.c src/*/*.c))
EXTENSION = postgres_web3
DATA = postgres_web3--1.0.sql
DOCS = README.postgres_web3

PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)