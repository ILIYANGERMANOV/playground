############################################################
#
# Makefile
# Code sample accompanying topic 1.2.4 "Debugging with GHCi"
# See README.md for details
#
# Fundamentals of Practical Haskell Programming
# By Richard Cook
#
############################################################

TARGETS := \
	Program4

GHC := stack ghc -- \
	--make \
	-O0 \
	-Wall \
	-Werror \
	-Wno-name-shadowing \
	-Wno-type-defaults

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
