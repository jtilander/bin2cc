CONFIG?=Final
TAG?=0.9.0
SHELL=cmd
MSBUILD="C:\Program Files (x86)\MSBuild\14.0\bin\amd64\msbuild.exe"
BUILDFLAGS=/nologo /verbosity:quiet
CONFIGFLAGS=/p:Configuration=$(CONFIG)
SLN=bin2cc.sln

.PHONY: clean build dist

build:
	@$(MSBUILD) $(BUILDFLAGS) $(SLN) $(CONFIGFLAGS)

clean:
	@$(MSBUILD) $(BUILDFLAGS) $(SLN) /t:Clean $(CONFIGFLAGS)
	@-rm -f bin/*

dist: clean build
	zip bin\\bin2cc-v$(TAG).zip bin\\bin2cc.*
