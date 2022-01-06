############################################################
#
# Makefile
# Code sample accompanying topic 1.3.2 "Types and type signatures"
# See README.md for details
#
# Fundamentals of Practical Haskell Programming
# By Richard Cook
#
############################################################

HS_TARGETS := \
	Chars \
	Constraints0 \
	Constraints1 \
	Constraints2 \
	FormatList \
	Functions \
	Lists \
	Nums \
	Polymorphism \
	Strings \
	Tuples

INVALID_HS_TARGETS := \
	Constraints3

CPP_TARGETS := \
	Inheritance \
	Overloading \
	Templates

GHC := stack ghc -- \
	--make \
	-O0 \
	-Wall \
	-Werror \
	-Wno-missing-signatures \
	-Wno-type-defaults

CXX := g++ -std=c++11 -O0 -c

.PHONY: all
all: $(addsuffix .out,$(HS_TARGETS)) $(addsuffix .o,$(CPP_TARGETS))

define make_hs_target
$(1).out: $(1).hs
	${GHC} -o $$@ $$<
ALL_OBJS += $(1).hi $(1).o $(1).out
endef
$(foreach t,$(HS_TARGETS),$(eval $(call make_hs_target,$(t))))

define make_cpp_target
$(1).o: $(1).cpp
	${CXX} $$<
ALL_OBJS += $(1).o
endef
$(foreach t,$(CPP_TARGETS),$(eval $(call make_cpp_target,$(t))))

clean:
	@rm -rf $(ALL_OBJS)
