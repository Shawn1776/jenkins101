#include <iostream>
enum Color {
  RED=0,
  GREEN=1,
  BLUE=2,
  Other
};

Color printColor(Color c){
    // Color var = c;
    return c;

};

int main(){
    std::cout<<printColor(Other);
    return 0;
}
