#!/usr/bin/env texlua
-- Build script for biblatex package
module = "biblatex"
-- variable overwrites (if needed)
stdengine = "luatex"
checkengines = {"luatex"}
checkruns    = 3

-- Non-standard structure
docfiledir    = "./doc"
sourcefiledir = "./tex"

-- Install all files from the source tree directly
installfiles =
  {
    "**/*.bbx",
    "**/*.cbx",
    "**/*.cfg",
    "**/*.def",
    "**/*.lbx",
    "**/*.sty"
  }
sourcefiles  = installfiles
unpackfiles  = { }

-- Release a TDS-style zip
packtdszip = true

-- Preserve structure for CTAN
flatten = false

checkopts = 
  "-interaction=nonstopmode \\input regression-test "
  .. "\\AtBeginDocument{\\START \\showoutput}"

function runtest_tasks(name)
  return "biber -q " .. name 
end

-- call standard script
kpse.set_program_name ("kpsewhich")
dofile (kpse.lookup ("l3build.lua"))

