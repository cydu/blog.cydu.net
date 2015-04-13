#!/usr/bin/env python
# encoding: utf-8
import os
import sys
from datetime import datetime

def post_name(argv):
  dt = datetime.now().strftime('%Y-%m-%d')
  argv = [dt] + [k.lower() for k in argv]
  name = "_posts/" + "-".join(argv) + ".md"
  return name

def template(argv):
  html = '''---
layout: post
title: "%s"
description: ""
category: LivingAbroad
tags:
---

'''
  return html % " ".join(argv)

def create_post(argv):
  fname = post_name(argv)
  content = template(argv)

  if os.path.exists(fname):
    backupcmd = "mv " + fname + " " + fname + "." + datetime.now().strftime('%Y%m%d%H%M%S')
    os.system(backupcmd)
    print "Backup: " + backupcmd

  print "create post " + fname
  with open(fname, "w") as f:
    f.write(content)

if __name__ == "__main__":
  create_post(sys.argv[1:])
