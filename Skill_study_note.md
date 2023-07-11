Cadence Skill Cadence® SKILL is a high-level, interactive programming language based on the popular artificial intelligence language, Lisp. Because SKILL supports a more conventional C-like syntax, novice users can learn to use it quickly, and expert programmers can access the full power of the Lisp language. 
SKill can be written both in Algebraic notation style, `func(arg1, arg2, ...)` and prefix notation style like in Lisp: `(func arg1 arg2 ...)`.
SKill shares many list manipulaion functions with Franz lisp dialect and borrows Common Lisp's notation for list construction from templaters 

SKILL ( `]`, or `"]` to closing all right bracket)

syntax style:
1. C style
strcat("May" " flower")
2. lisp style
( strcat "May" " flower")
3. ??? 
strcat "May" " flower"

Data Type:
integer             5
floating point      5.1     ;;; 10.0, 10., 0.5, .5, 1e10, 1e-10, 1e10
text string         "5.1"
variable            bBox
list                (1 2 3)

scalling:

![Alt text](<Screenshot 2023-07-11 at 4.31.10 PM.png>)
![Alt text](<Screenshot 2023-07-11 at 4.31.53 PM.png>)
![Alt text](<Screenshot 2023-07-11 at 4.34.17 PM.png>)
![Alt text](<Screenshot 2023-07-11 at 4.34.39 PM.png>)

return value -> t (true) nil (empty list)

Variables
```lisp
x = 5
x_list = '(1 2 3 4 5) == list(1 2 3 4 5) ;; ' single quote
```
function/procedure: (primitive | build-in)

1 define/build list
nil == () =\=(nil)
'(1 2 3) == list(1 2 3)
result = '( 1 2)
cons( 1 result) =>  ( 1 1 2)
append( '(1) result) => (1 1 1 2)

2. access list
car(result) -> 1
cdr(result) -> (1 1 2)
nth(0 result) == car(result) -> 1
nth(3 result) -> 2
member(4 result) -> nil ; only top level of the list, not deeper in the hierachical list
length(result) => 4

3. modify list
3.1 aCoordinate
x = 300
y = 400
aCoordinate = x:y ==> (300 400)
3.2 bounding box
bBox = list(300:400 500:450)
lowerLeft  = 300:400
upperRight = 500:450
bBox       = list( lowerLeft, upperRight)
bBox       = '(( 300 400 ) ( 500 450))

lower_left_corner  = car(bBox)
upper_right_corner = cadr(bBox) = car( cdr(bBox))

x_coord_of_lower_left_corner =llx = caar(bBox)=car(car(bBox))
y_coord_of_lower_left_corner =lly = cadar(bBox)=car(cdr(car(bBox)))

x_coord_of_upper_right_corner =urx = caadr(bBox)=car(car(cdr(bBox)))
y_coord_of_upper_right_corner =ury = cadadr(bBox)=car(cdr(car(cdr(bBox]

file I/O:
1. display
print()
println
printf

for(i 1 3 print("hi"))
for(i 1 3 println("hi"))
aList='(1 2 3)
printf("\nThis is a list: %L" aList) => t This is a list: (1 2 3)

#### 2. to a file
myPort = outfile( "/tmp/myFile" )  ;; a full path with the outfile function.
for( i 1 3
    println( list( "Number:" i) myPort )
    )
close( myPort )
#### 2.2 first argument should be an output port associated with the file 
myPort = outfile( "/tmp/myFile" )
for( i 1 3
      fprintf( myPort "Number: %d\n" i )
      )
close( myPort )

#### 2.3 read text file (Skill parser imposes a limit of 6000 on the number of elements that can be in a list being read in)
```S
inPort = infile( "~/.cshrc" )           ;;; infile for set a file port
when( inPort
      while( gets( nextLine inPort )    ;;; gets( ) for nextLine
            println( nextLine )
      )
      while( fscanf( inPort "%s" word ) 
            println( word )
      )
      close( inPort )
)
```

### 3 flow of control

boundp('trMessages) && trMessages 
userName || "noName"

```S
;; if(
;;     then
;;     else
;; )

if( shapeType =="rect"
    then 
        println( "Shape is a rectangle" )
        ++rectCount
    else
        println( "Shape is not a rectangle")
        ++miscCount
)
;;; when and unless 
when( shapeType == "rect"
            println( "Shape is a rectangle" )
            ++rectCount
      ) ; when

;;; unless
unless( shapeType == "rect" || shapeType == "line"
      println( "Shape is miscellaneous" )
      ++miscCount
      ) ; unless

;;; case
case( shapeType
      ( "rect"
            ++rectCount
            println( "Shape is a rectangle" )
            )
      ( "line"
            ++lineCount
            println( "Shape is a line" )
            ) 
      ( "label"
            ++labelCount
            println( "Shape is a label" )
            )
       ( t   ;; default         
            ++miscCount
            println( "Shape is miscellaneous" )
            )
    ) ; case
;;; for 
sum = 0
for( i 1 5
      sum = sum + i
      println( sum )
      )
```

;;; foreach ---> on each element in the list of a lisp
```S
rectCount = lineCount = polygonCount = 0
shapeTypeList = '( "rect" "polygon" "rect" "line" )

foreach( shapeType shapeTypeList
    case( shapeType
                ( "rect"       ++rectCount )
                ( "line"       ++lineCount )
                ( "polygon" ++polygonCount )
                ( t            ++miscCount )
        ) ;case
) ; foreach
;;; result
=> ( "rect" "polygon" "rect" "line" )
```
### develop a SKill function
1. group several statements { }
```S
;;; computes the pixel height of bBox and assigns it to the bBoxHeight variable
bBoxHeight = {
      bBox = list( 100:150 250:400)
      ll = car( bBox )
      ur = cadr( bBox )
      lly = yCoord( ll )
      ury = yCoord( ur )
      ury - lly }

;;; declaring function
procedure( ComputeBBoxHeight( )
      bBox = list( 100:150 250:400)
      ll   = car( bBox )
      ur   = cadr( bBox )
      lly  = yCoord( ll )
      ury  = yCoord( ur )
      ury - lly
    ) ; procedure

bBoxHeight = ComputeBBoxHeight()

;;; function parameters
procedure( ComputeBBoxHeight( bBox )
        ll       = car( bBox )
        ur       = cadr( bBox )
        lly      = yCoord( ll )
        ury      = yCoord( ur )
        ury - lly
    ) ; procedure
;;; To execute your function, you must provide a value for the parameter.
bBox = list( 100:150 250:400)
bBoxHeight = ComputeBBoxHeight( bBox ) 

;;; prefixes... 1) "tr" -> indicate for training purposes 2) "tc" -> for technology file administration ... unique prefix for your own functions
```

### Source code
```
editor = "xterm -e vi" 
editor2 = "xterm -e e28"
ed( "myFile.il")

setSkillPath
getSkillPath
trSamplesPath = list(
            prependInstallPath( "etc/context" )
            prependInstallPath( "local" )
            prependInstallPath( "samples/local" )
            )
;;; result
("/cds/9401/tools.sun4/dfII/etc/context"
 "/cds/9401/tools.sun4/dfII/local"
 "/cds/9401/tools.sun4/dfII/samples/local")

setSkillPath( append( trSamplesPath getSkillPath() ) )
```
### Special characters in Skill
![Alt text](<Screenshot 2023-07-11 at 4.16.34 PM.png>)

### comma (,) and comma-at (,@)
```S
y = 1
'(x y z)     => (x y z) 
'(x ,y z)    => (x 1 z)

x= 1
y = '(a b c) 
'(,x ,y z)   => (1 (a b c) z)
'(,x ,@y z)  => (1 a b c z)

/* 
Here’s an example of a simple macro implemented with backquote:
defmacro(myWhen (@rest body)
*/

••••••'if( ,car( body) progn( ,@cdr(body))))
;;; The expression
a= 2
b= 7
myWhen( eq( a b ) printf( "The same\n" ) list( a b ))
;;; expands to
if( eq( a b ) progn( printf( "The same\n" ) list( a b )))
```



