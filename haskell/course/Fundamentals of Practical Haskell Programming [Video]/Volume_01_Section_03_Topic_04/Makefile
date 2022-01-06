############################################################
#
# Makefile
# Code sample accompanying topic 1.3.4 "Type classes"
# See README.md for details
#
# Fundamentals of Practical Haskell Programming
# By Richard Cook
#
############################################################

TARGETS := \
	Quaternion0 \
	Quaternion1 \
	Quaternion2 \
	Quaternion3 \
	ShowExample \
	TypeClasses \
	TypeWrapping0 \
	TypeWrapping1

GHC := stack ghc -- \
	--make \
	-O0 \
	-Wall \
	-Werror \
	-Wno-type-defaults \
	-Wno-unused-matches \
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
