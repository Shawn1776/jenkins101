1
```
std::array arr{ class1{}, class2{} }; // safety initialize the 2 class1{} and class2{} elements array // C++17 new feature... 
std::span arr_span(arr, 2);             // access to the contiguous sequence of arr elements
```