valgrind (gprof)

injection-based profiler/analyzer

analysis of run-time; dynamically memory usage, memory leaks


Two step process: (compile with -g flag)

1) run program through valgrind, producing, data file with integer PID extension, callgrind.out.PID 

2) then run callgrind_annotate on that file

e.g.

1) valgrind --tool=callgrind ./myprogx whatever args 

2) callgrind_annotate callgrind.out.<PID> -inclusive=yes --tree=both 

callgrind_annotate theoptions... | grep -v build

Reference:
what I want is I/O runtime boost, and use valgrind callgrind profiler to anaylize 
cpu memory boost
1) Valgrind Callgrind
https://web.stanford.edu/class/archive/cs/cs107/cs107.1234/resources/callgrind.html
2) youtube:
2.1) Memory: https://www.youtube.com/watch?v=bb1bTJtgXrI&list=PLGvfHSgImk4ZZq5KWX0mGT0kgwy9-I-Qe
2.2) Profiling with valgrind: https://www.youtube.com/watch?v=UVWTwRrC9nA&t=308s
2.3) Profiling valgrind callgrind cachegrind gperftools google benchmark: https://www.youtube.com/watch?v=pGirLNFeiKs

2.4) profiling visulization: KCachegrind to find run-time bottlenecks 
https://www.youtube.com/watch?v=h-0HpCblt3A 

On the left side column:

1. include: amount of time spent in this function and all functions are recalled in this func.

2. self: time spent in this function only

3. called: shows how often a specific function was called

4. functions: func. w/ some additional changes made. 

e.g.: files that are required or included, don't just all list under require_once or include_once. instead they are postfixed with a file name.  This makes it easier to correlate in which specific file things were. 
additionally PHP's internal func.s have been prefiexed by the pseudo class PHP. This again makes it easy to group things later.

5. location: (filenames)
additionaly, PHP:internal signals a internal func. of PHP

5 type on right:

1. types：( time or memory )  

memory profiles? (be carefulled if you have a PHP garage collection, need to be turned off)

2. callers tab:

which function call to the function that we have selected. In the this case, 


3. all callers

4. callee Map (show run time!!! )

5. Source Code


*** Call Graph ***






