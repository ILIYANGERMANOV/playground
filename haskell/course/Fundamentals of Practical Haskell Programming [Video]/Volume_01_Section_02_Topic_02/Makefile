############################################################
#
# Makefile
# Code sample accompanying topic 1.2.2 "Whitespace, layout and scoping"
# See README.md for details
#
# Fundamentals of Practical Haskell Programming
# By Richard Cook
#
############################################################

TARGETS := \
	Program1 \
	Program2 \
	Program5 \
	Program6 \
	Program7 \
	Program8 \
	Program9 \
	Program10

INVALID_TARGETS := \
	Program3 \
	Program4

GHC := stack ghc -- \
	--make \
	-O0 \
	-Wall \
	-Werror \
	-Wno-missing-signatures \
	-Wno-name-shadowing \
	-Wno-overlapping-patterns \
	-Wno-type-defaults \
	-Wno-unused-do-bind \
	-fno-code \
	-fno-warn-unused-local-binds \
	-fno-warn-unused-matches \
	-fno-warn-unused-top-binds

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
