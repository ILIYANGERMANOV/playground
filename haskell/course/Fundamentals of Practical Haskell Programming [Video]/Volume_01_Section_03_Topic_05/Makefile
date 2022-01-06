############################################################
#
# Makefile
# Code sample accompanying topic 1.3.5 "Pattern matching"
# See README.md for details
#
# Fundamentals of Practical Haskell Programming
# By Richard Cook
#
############################################################

TARGETS := \
	Colour0 \
	Colour1 \
	Colour2 \
	Colour3 \
	Func \

# Non-exhaustive matches
INVALID_TARGETS := \
	Colour4 \
	Colour5

GHC := stack ghc -- \
	--make \
	-O0 \
	-Wall \
	-Werror \
	-Wno-missing-signatures \
	-Wno-type-defaults \

.PHONY: all
all: $(addsuffix .out,$(TARGETS))

define make_target
$(1).out: $(1).hs
	${GHC} -o $$@ $$<
ALL_OBJS += $(1).hi $(1).o $(1).out
endef
$(foreach t,$(TARGETS),$(eval $(call make_target,$(t))))

clean:
	@rm -rf $(ALL_OBJS)
