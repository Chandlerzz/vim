fun! CompleteMonths(findstart, base)

  if a:findstart
    " locate the start of the word
    let line = getline('.')
    let start = col('.') - 1
    while start > 0 && line[start - 1] =~ '\a'
      let start -= 1
    endwhile
    return start
  else
      let g:completefiletype=&filetype
    " find months matching with "a:base"
    call Compython()
    " for m in split("Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec")
    let res=[]
    for m in g:completediy 
      if m =~ a:base
    call add(res, m)
      endif
    endfor
    return res
  endif
endfun
fun! Compython()
python3 << EOF
import vim
import json
import os
from IPython import embed
import re

def whichType(item):
    typestr=str(type(item))
    pattern=re.compile("(bool|NoneType|int|str|dict|list|function|float)")
    wtype=re.search(pattern,typestr).group()
    if wtype == "list":
        if len(item)==0:
            return "emptyDict"
    if wtype == "dict":
        if len(item.keys())==0:
            return "emptyList"
    return wtype

def cat(origin,key):
    return origin+"['"+key+"']"

def catList(origin,index):
    return  origin+"["+index+"]"

def python2javascript(path):
    pattern=re.compile("\['")
    pattern1=re.compile("'\]")
    path=re.sub(pattern,".",path)
    path=re.sub(pattern1,"",path)
    return path

def walk(path):
    result = eval(path)
    wtype = whichType(result)
    func=baseType[wtype]
    func(path)


def basedo(path):
    lists.append(path)
def listdo(path):
    result = eval(path)
    for index in range(len(result)):
        walk(catList(path,str(index)))
def dictdo(path):
    result = eval(path)
    keys=result.keys()
    for key in keys:
        walk(cat(path,key))

baseType = {\
        "NoneType":basedo,\
        "int":basedo,\
        "dict":dictdo,\
        "str":basedo,\
        "list":listdo,\
        "emptyDict":basedo,\
        "emptyList":basedo,\
        "float":basedo,\
        "bool":basedo\
        }
lists=[]
jsonFile = os.environ['HOME']+'/vim/package.json'
with open(jsonFile) as f:
    result = json.load(f)
walk('result')
filet = vim.vars['completefiletype']
if filet == b'javascript':
    for index in range(len(lists)):
        item=lists[index]
        item1=python2javascript(item)
        lists[index]=item1
vim.vars["completediy"]=lists
EOF
endfun

set completefunc=CompleteMonths
