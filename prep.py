
import tomllib

with open("typst.toml", "rb") as f:
    data = tomllib.load(f)

version = data["package"]["version"]
print(version)

import subprocess
import os

for fn in os.listdir("examples"):
    if fn.endswith('.typ'):
        subprocess.run(["typst", "compile", fn, "-f", "pdf", "--root", ".."], cwd = "examples") 

def read1(fname):
    with open(fname) as f:
        next(f)
        return f.read() 

template = open("README-template.md").read()

population = read1("examples/population.typ")
grantspend = read1("examples/grant-spend.typ")
booktabs = read1("examples/booktabs.typ")
generalalign = read1("examples/general-align.typ")
decimalalign = read1("examples/decimal-align.typ")


with open("README.md", "w") as out:
    out.write(template.format(version = version, 
                              population = population,
                              booktabs = booktabs,
                              generalalign = generalalign,
                              decimalalign = decimalalign,
                              grantspend = grantspend))


# test_template = open("tests/examples/test-template.typ").read()


# with open("tests/examples/test.typ", "w") as out:
#     out.write(template.format( 
#                               population = population,
#                               booktabs = booktabs,
#                               generalalign = generalalign,
#                               decimalalign = decimalalign,
#                               grantspend = grantspend))


import shutil
import os
import pathlib

pathlib.Path("../packages/packages/preview/tblr/" + version).mkdir(parents=True, exist_ok=True) 

for fn in ["LICENSE", "typst.toml", "tblr.typ", "README.md"]:
    shutil.copy(fn, "../packages/packages/preview/tblr/" + version + "/")
shutil.copytree("examples", "../packages/packages/preview/tblr/" + version + "/examples", dirs_exist_ok=True)
