#!/bin/bash

for i in `seq 15`; do
cat > announcements/2015-01-$i-testing.md <<EOF
---
title: "Testing $i"
layout: article
categories: Announcements
---

We have a new website. Red Redford has done a great job over the last 10 years but is retiring from the website. We wanted something that maintained the useful information but was more useful to varying screen sizes and devices.

  * One test link
  * Two test things

Here's some text that is just random

	This is a code block that should be indented
	All of this is the code block

**Testing**

EOF
done

