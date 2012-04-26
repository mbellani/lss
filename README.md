Ruby based implementation of lss command
===

What it does
===

Given an output from an ls command:
<pre>
  a1_001.txt a1_002.txt a1_003.txt a1_004.txt
  b2_01.txt b2_02.txt b2_03.txt b2_04.txt b2_05.txt
</pre>

When you execute this program 
It would  generate an output below

<pre>
4 a1_%03d.txt 001-004
5 b2_%02d.txt 01-05
</pre>

What it does not do
===

It currently does not detect detect the breakages in the sequence e.g. 
If you had the output from the command like one below

<pre>

a1_001.txt a1_002.txt a1_005.txt a1_006.txt
b2_01.txt b2_02.txt b2_03.txt b2_04.txt b2_05.txt
</pre>

The it should produce the output 
<pre>
4 a1_%03d.txt 001-002 005-006
5 b2_%02d.txt 01-05
</pre>

This feature will be implemented soon into the parser. 
It also does not package itself as a gem to conveniently execute like a command after the installation. 


Pre-requisites
===
Ruby 1.9.2

I have not tested it under other environments. 

Test it out
===
<pre>
git clone https://mbellani@github.com/mbellani/lss.git
bundler install
cucumber
</pre>
