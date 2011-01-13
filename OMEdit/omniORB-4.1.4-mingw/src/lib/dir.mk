SUBDIRS = omnithread omniORB

all::
	@$(MakeSubdirs)

export::
	@$(MakeSubdirs)

ifdef INSTALLTARGET
install::
	@$(MakeSubdirs)
endif

ciao::
	@$(MakeSubdirs)

ifndef EmbeddedSystem
endif
