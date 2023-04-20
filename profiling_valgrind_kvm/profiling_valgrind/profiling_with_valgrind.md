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
2.4) 
