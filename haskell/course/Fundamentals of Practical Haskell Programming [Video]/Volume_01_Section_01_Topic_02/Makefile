############################################################
#
# Makefile
# Code sample accompanying topic 1.1.2 "The FP Way"
# See README.md for details
#
# Fundamentals of Practical Haskell Programming
# By Richard Cook
#
############################################################

HS_TARGETS := \
	Composition \
	Filter \
	Reduction \
	Traversal

CPP_TARGETS := \
	Composition \
	Filter \
	Reduction \
	Traversal

GHC := stack ghc -- \
	--make \
	-O0 \
	-Wall \
	-Werror \
	-Wno-missing-signatures \
	-Wno-type-defaults

CXX := g++ -std=c++11 -O0

.PHONY: all
all: $(addsuffix .out,$(HS_TARGETS)) $(addsuffix _cpp.out,$(CPP_TARGETS))

define make_hs_target
$(1).out: $(1).hs
	${GHC} -o $$@ $$<
ALL_OBJS += $(1).hi $(1).o $(1).out
endef
$(foreach t,$(HS_TARGETS),$(eval $(call make_hs_target,$(t))))

define make_cpp_target
$(1)_cpp.out: $(1).cpp
	${CXX} -o $$@ $$<
ALL_OBJS += $(1)_cpp.out
endef
$(foreach t,$(CPP_TARGETS),$(eval $(call make_cpp_target,$(t))))

clean:
	@rm -rf $(ALL_OBJS)
