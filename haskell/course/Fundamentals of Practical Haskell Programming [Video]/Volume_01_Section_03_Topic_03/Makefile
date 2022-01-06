############################################################
#
# Makefile
# Code sample accompanying topic 1.3.3 "Algebraic data types"
# See README.md for details
#
# Fundamentals of Practical Haskell Programming
# By Richard Cook
#
############################################################

HS_TARGETS := \
	ColourRGB \
	ColourRGBCMYK \
	ColourRGBRecord \
	ColourSimpleSumType

CPP_TARGETS := \
	ColourSimpleEnum \
	ColourStruct \
	ColourTaggedUnion \

GHC := stack ghc -- \
	--make \
	-O0 \
	-Wall \
	-Werror \
	-fno-code \
	-fno-warn-unused-top-binds

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
	${CXX} -o $$@ $$<
ALL_OBJS += $(1).o
endef
$(foreach t,$(CPP_TARGETS),$(eval $(call make_cpp_target,$(t))))

clean:
	@rm -rf $(ALL_OBJS)
